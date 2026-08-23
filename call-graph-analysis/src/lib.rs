use std::{collections::HashMap, fs, process::Command};

#[cfg(test)]
use petgraph::algo::dominators;
#[cfg(test)]
use tempfile::Builder;
use wasmparser::{ExternalKind, Parser, Payload};
#[cfg(test)]
use wat::parse_str as wat2wasm; // Import the Builder

pub fn find_export_index(wasm_bytes: &[u8], export_name: &str) -> Option<u32> {
    // Quickly parse through the Wasm sections looking for the Export section
    for payload in Parser::new(0).parse_all(wasm_bytes) {
        if let Ok(Payload::ExportSection(reader)) = payload {
            for ex in reader.into_iter().flatten() {
                // Match the name and ensure it's a function (not memory/table)
                if ex.name == export_name && matches!(ex.kind, ExternalKind::Func) {
                    return Some(ex.index);
                }
            }
        }
    }
    None
}

use anyhow::Result;
use petgraph::graph::{DiGraph, NodeIndex};
use tempfile::NamedTempFile;

#[derive(Debug)]
pub enum CallType {
    Direct,
    Indirect,
}

pub fn get_callgraph_text(wasm_path: &str) -> Result<String> {
    let temp_file = NamedTempFile::new()?;
    let temp_path = temp_file.path().to_str().expect("Invalid temp path");

    Command::new("wassail")
        .arg("callgraph-adjlist")
        .arg(wasm_path)
        .arg(temp_path)
        .output()?;

    // 3. Read the adjacency list from the temp file into a String
    let adjlist_text = fs::read_to_string(temp_path)?;

    Ok(adjlist_text)
}

pub fn build_graph_from_adjlist(
    adjlist_text: &str,
) -> (DiGraph<u32, CallType>, HashMap<u32, NodeIndex>) {
    let mut pet_graph = DiGraph::<u32, CallType>::new();
    let mut node_map: HashMap<u32, NodeIndex> = HashMap::new();

    // Helper closure to manage node indices
    let mut get_or_insert = |func_idx: u32, graph: &mut DiGraph<u32, CallType>| -> NodeIndex {
        *node_map
            .entry(func_idx)
            .or_insert_with(|| graph.add_node(func_idx))
    };

    for line in adjlist_text.lines() {
        let parts: Vec<&str> = line.split_whitespace().collect();
        if parts.len() == 3 {
            let caller: u32 = parts[0].parse().unwrap();
            let callee: u32 = parts[1].parse().unwrap();
            let call_type = if parts[2] == "i" {
                CallType::Indirect
            } else {
                CallType::Direct
            };

            let caller_node = get_or_insert(caller, &mut pet_graph);
            let callee_node = get_or_insert(callee, &mut pet_graph);

            pet_graph.add_edge(caller_node, callee_node, call_type);
        }
    }

    (pet_graph, node_map) // Return both so we can query them later
}

pub fn add(left: u64, right: u64) -> u64 {
    left + right
}

#[cfg(test)]
mod tests {

    use std::io::Write;

    use super::*;

    #[test]
    fn it_works() {
        let result = add(2, 2);
        assert_eq!(result, 4);
        let call_graph = get_callgraph_text("./fib.wasm").unwrap();
        println!("{:?}", call_graph)
    }

    #[test]
    fn test_dominator_analysis() {
        let wasm_path = "./fib.wasm";
        let wasm_bytes = fs::read(wasm_path).expect("Failed to read Wasm file");

        // 1. Capture stdout from Wassail (using our tempfile wrapper)
        let adjlist_text = get_callgraph_text(wasm_path).expect("Wassail failed to parse file");

        // 2. Build the Petgraph
        let (pet_graph, node_map) = build_graph_from_adjlist(&adjlist_text);

        // 3. Find the Wasm index for "_start" (or whichever API you are analyzing)
        let root_wasm_idx =
            find_export_index(&wasm_bytes, "_start").expect("Could not find the '_start' export!");

        // Map the Wasm index to Petgraph's internal NodeIndex
        let root_petgraph_idx = *node_map
            .get(&root_wasm_idx)
            .expect("Root node not found in the callgraph");

        // 4. Calculate the Dominator Tree!
        let dom_tree = dominators::simple_fast(&pet_graph, root_petgraph_idx);

        // 5. Query the results for your instrumentation platform
        println!("Dominator Tree computed successfully!\n");

        for (&wasm_idx, &pet_idx) in &node_map {
            if let Some(imm_dom_idx) = dom_tree.immediate_dominator(pet_idx) {
                // imm_dom_idx is Petgraph's format, map it back to the readable Wasm index
                let dom_wasm_idx = pet_graph[imm_dom_idx];
                println!(
                    "Function {} is immediately dominated by Function {}",
                    wasm_idx, dom_wasm_idx
                );
            }
        }
    }

    #[test]
    fn test_diamond() {
        let wasm_program_text: &str = r#"
        (module
            (memory $0 0)
            (export "top" (func $top))
            (func $top (result i32)
                call $left
                call $right
                i32.add
            )
            (func $left (result i32)
                call $bottom
            )
            (func $right (result i32)
                call $bottom
            )
            (func $bottom (result i32)
                i32.const 7
            )
        )"#;

        let mut input_file = Builder::new()
            .suffix(".wasm")
            .tempfile()
            .expect("Error creating temp file");
        let wasm_bytes = wat2wasm(wasm_program_text).unwrap();

        // 1. Write the bytes FIRST (Mutable Borrow)
        input_file.write_all(&wasm_bytes).unwrap();
        input_file.as_file_mut().sync_all().unwrap(); // <-- CRITICAL FIX

        // 2. Get the path SECOND (Immutable Borrow)
        let wasm_path = input_file.path().to_str().expect("Invalid temp path");

        // 3. Capture stdout from Wassail
        let adjlist_text = get_callgraph_text(wasm_path).expect("Wassail failed to parse file");

        // --- DEBUGGING OUTPUT ---
        println!(
            "--- Wassail Raw Output ---\n{}--------------------------",
            adjlist_text
        );

        // 4. Build the Petgraph
        let (pet_graph, node_map) = build_graph_from_adjlist(&adjlist_text);

        // 5. Find the Wasm index for your export
        let root_wasm_idx =
            find_export_index(&wasm_bytes, "top").expect("Could not find the 'top' export!");

        println!("Expected Root Wasm Index: {}", root_wasm_idx);
        println!(
            "Indices actually in graph: {:?}",
            node_map.keys().collect::<Vec<_>>()
        );

        // Map the Wasm index to Petgraph's internal NodeIndex
        let root_petgraph_idx = *node_map.get(&root_wasm_idx).unwrap_or_else(|| {
            panic!(
                "Root node {} not found! Wassail output might be empty or using a different index.",
                root_wasm_idx
            );
        });

        // 6. Calculate the Dominator Tree!
        let dom_tree = dominators::simple_fast(&pet_graph, root_petgraph_idx);

        // 7. Query the results for your instrumentation platform
        println!("Dominator Tree computed successfully!\n");

        for (&wasm_idx, &pet_idx) in &node_map {
            if let Some(imm_dom_idx) = dom_tree.immediate_dominator(pet_idx) {
                // imm_dom_idx is Petgraph's format, map it back to the readable Wasm index
                let dom_wasm_idx = pet_graph[imm_dom_idx];
                println!(
                    "Function {} is immediately dominated by Function {}",
                    wasm_idx, dom_wasm_idx
                );
            }
        }
    }

    #[test]
    fn test_chain() {
        let wasm_program_text: &str = r#"
        (module
            (export "top" (func $top))
            (func $top call $mid)
            (func $mid call $bot)
            (func $bot)
        )"#;

        let mut input_file = Builder::new()
            .suffix(".wasm")
            .tempfile()
            .expect("Error creating temp file");
        let wasm_bytes = wat2wasm(wasm_program_text).unwrap();

        // 1. Write the bytes FIRST (Mutable Borrow)
        input_file.write_all(&wasm_bytes).unwrap();
        input_file.as_file_mut().sync_all().unwrap(); // <-- CRITICAL FIX

        // 2. Get the path SECOND (Immutable Borrow)
        let wasm_path = input_file.path().to_str().expect("Invalid temp path");

        // 3. Capture stdout from Wassail
        let adjlist_text = get_callgraph_text(wasm_path).expect("Wassail failed to parse file");

        // --- DEBUGGING OUTPUT ---
        println!(
            "--- Wassail Raw Output ---\n{}--------------------------",
            adjlist_text
        );

        // 4. Build the Petgraph
        let (pet_graph, node_map) = build_graph_from_adjlist(&adjlist_text);

        // 5. Find the Wasm index for your export
        let root_wasm_idx =
            find_export_index(&wasm_bytes, "top").expect("Could not find the 'top' export!");

        println!("Expected Root Wasm Index: {}", root_wasm_idx);
        println!(
            "Indices actually in graph: {:?}",
            node_map.keys().collect::<Vec<_>>()
        );

        // Map the Wasm index to Petgraph's internal NodeIndex
        let root_petgraph_idx = *node_map.get(&root_wasm_idx).unwrap_or_else(|| {
            panic!(
                "Root node {} not found! Wassail output might be empty or using a different index.",
                root_wasm_idx
            );
        });

        // 6. Calculate the Dominator Tree!
        let dom_tree = dominators::simple_fast(&pet_graph, root_petgraph_idx);

        // 7. Query the results for your instrumentation platform
        println!("Dominator Tree computed successfully!\n");

        for (&wasm_idx, &pet_idx) in &node_map {
            if let Some(imm_dom_idx) = dom_tree.immediate_dominator(pet_idx) {
                // imm_dom_idx is Petgraph's format, map it back to the readable Wasm index
                let dom_wasm_idx = pet_graph[imm_dom_idx];
                println!(
                    "Function {} is immediately dominated by Function {}",
                    wasm_idx, dom_wasm_idx
                );
            }
        }
    }
}
