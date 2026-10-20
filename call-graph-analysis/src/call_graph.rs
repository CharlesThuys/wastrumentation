#![allow(dead_code)]
use anyhow::Result;
use bimap::BiHashMap;
use petgraph::{
    algo::dominators,
    graph::{DiGraph, NodeIndex},
};
use std::{collections::HashSet, fs, io::Write, process::Command};
use tempfile::{Builder, NamedTempFile};
use wasmparser::{ExternalKind, Parser, Payload};

#[derive(Debug)]
pub enum CallType {
    Direct,
    Indirect,
}

#[derive(Debug)]
pub struct CallGraph {
    pub graph: DiGraph<u32, CallType>,
    pub node_map: BiHashMap<u32, NodeIndex>,
    pub entry_points: Vec<u32>,
}

impl CallGraph {
    pub fn from_file(path: &str) -> Result<CallGraph> {
        let adj_list = get_adjlist_wassail(path)?;
        let wasm_bytes = fs::read(path)?;
        let entry_points = get_entry_points(&wasm_bytes);
        let (graph, node_map) = build_graph_from_wassail(adj_list);
        Ok(CallGraph {
            graph,
            node_map,
            entry_points,
        })
    }

    pub fn from_bytes(wasm_bytes: &[u8]) -> Result<CallGraph> {
        let mut input_file = Builder::new()
            .suffix(".wasm")
            .tempfile()
            .expect("Error creating temp file");
        input_file
            .write_all(wasm_bytes)
            .expect("Error writing to temp file");
        let path = input_file.path().to_str().expect("Invalid temp path");
        let adj_list = get_adjlist_wassail(path)?;
        let entry_points = get_entry_points(wasm_bytes);
        let (graph, node_map) = build_graph_from_wassail(adj_list);
        Ok(CallGraph {
            graph,
            node_map,
            entry_points,
        })
    }

    pub fn get_dominators(&mut self) -> (dominators::Dominators<NodeIndex>, NodeIndex) {
        let virtual_root = self.graph.add_node(0);

        for export in &self.entry_points {
            if self.node_map.contains_left(export) {
                self.graph.add_edge(
                    virtual_root,
                    *self.node_map.get_by_left(export).unwrap(),
                    CallType::Direct,
                );
            }
        }
        let dom_tree = dominators::simple_fast(&self.graph, virtual_root);
        self.graph.remove_node(virtual_root);
        (dom_tree, virtual_root)
    }
}

fn get_entry_points(wasm_bytes: &[u8]) -> Vec<u32> {
    let mut indeces = HashSet::new();
    for payload in Parser::new(0).parse_all(wasm_bytes) {
        if let Ok(Payload::ExportSection(reader)) = payload {
            for ex in reader.into_iter().flatten() {
                if matches!(ex.kind, ExternalKind::Func) {
                    indeces.insert(ex.index);
                }
            }
        } else if let Ok(Payload::StartSection {
            func,
            range: _range,
        }) = payload
        {
            indeces.insert(func);
        }
    }
    let mut entry_points: Vec<u32> = indeces.into_iter().collect();
    entry_points.sort();
    entry_points
}

/* Wassail output looks like:
18 280 d
22 14 d
23 12 i
22 23 d
23 11 i
caller callee direct/indirect
*/
fn build_graph_from_wassail(
    wassail_output: String,
) -> (DiGraph<u32, CallType>, BiHashMap<u32, NodeIndex>) {
    let mut graph = DiGraph::<u32, CallType>::new();
    let mut node_map: BiHashMap<u32, NodeIndex> = BiHashMap::new();

    for line in wassail_output.lines() {
        // line looks like: caller callee direct/indirect
        let parts: Vec<&str> = line.split_whitespace().collect();

        let caller: u32 = parts[0].parse().expect("wrong wassail format");
        let callee: u32 = parts[1].parse().expect("wrong wassail format");
        let call_type: CallType = match parts[2] {
            "d" => CallType::Direct,
            "i" => CallType::Indirect,
            _ => panic!("wrong wassail format"),
        };
        let caller_node = match node_map.get_by_left(&caller) {
            Some(node_index) => *node_index,
            None => {
                let node_index = graph.add_node(caller);
                node_map.insert(caller, node_index);
                node_index
            }
        };
        let callee_node = match node_map.get_by_left(&callee) {
            Some(node_index) => *node_index,
            None => {
                let node_index = graph.add_node(callee);
                node_map.insert(callee, node_index);
                node_index
            }
        };
        graph.add_edge(caller_node, callee_node, call_type);
    }

    (graph, node_map)
}

fn get_adjlist_wassail(wasm_path: &str) -> Result<String> {
    let temp_file = NamedTempFile::new()?;
    let temp_path = temp_file.path().to_str().expect("Invalid temp path");

    Command::new("wassail")
        .arg("callgraph-adjlist")
        .arg(wasm_path)
        .arg(temp_path)
        .output()?;

    let adjlist_text = fs::read_to_string(temp_path)?;
    Ok(adjlist_text)
}
