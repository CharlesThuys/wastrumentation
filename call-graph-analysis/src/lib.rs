mod call_graph;
mod graph_algo;

use call_graph::CallGraph;
use graph_algo::{height_for_graph, reachable_from_node};
use petgraph::algo::dominators::Dominators;
use petgraph::graph::NodeIndex;
use std::collections::HashMap;

pub fn compute_paths_from_bytes(bytes: &[u8], k: usize) -> anyhow::Result<HashMap<u32, Vec<u32>>> {
    let call_graph = CallGraph::from_bytes(bytes)?;
    let paths = compute_paths_for_height(&call_graph, k);
    let mut result = HashMap::new();
    for (node, path_nodes) in paths.into_iter() {
        if let Some(&f_idx) = call_graph.node_map.get_by_right(&node) {
            let mut path_funcs = vec![f_idx];
            for child in path_nodes.iter() {
                let path_member = call_graph.node_map.get_by_right(child);
                if let Some(&member_idx) = path_member {
                    path_funcs.push(member_idx);
                }
            }
            result.insert(f_idx, path_funcs);
        }
    }
    Ok(result)
}

pub fn compute_paths_from_file(
    wasm_path: &str,
    k: usize,
) -> anyhow::Result<HashMap<u32, Vec<u32>>> {
    let call_graph = CallGraph::from_file(wasm_path)?;
    let paths = compute_paths_for_height(&call_graph, k);
    let mut result = HashMap::new();
    for (node, path_nodes) in paths.into_iter() {
        if let Some(&f_idx) = call_graph.node_map.get_by_right(&node) {
            let mut path_funcs = vec![f_idx];
            for child in path_nodes.iter() {
                let path_member = call_graph.node_map.get_by_right(child);
                if let Some(&member_idx) = path_member {
                    path_funcs.push(member_idx);
                }
            }
            result.insert(f_idx, path_funcs);
        }
    }
    Ok(result)
}

// Returns nodes at height that dominate all callees
fn compute_paths_for_height(
    call_graph: &CallGraph,
    k: usize,
) -> HashMap<NodeIndex, Vec<NodeIndex>> {
    let heights = height_for_graph(call_graph);
    let dom_tree = call_graph.get_dominators();

    heights
        .iter()
        .filter(|&(&node, &height)| height == k && node != call_graph.virtual_root)
        .filter_map(|(&start, _)| {
            let path = reachable_from_node(call_graph, call_graph.virtual_root);
            let valid = path
                .iter()
                .all(|&check| is_dominated_by_node(&dom_tree, start, check));
            valid.then_some((start, path))
        })
        .collect()
}

fn is_dominated_by_node(
    dom_tree: &Dominators<NodeIndex>,
    node: NodeIndex,
    target: NodeIndex,
) -> bool {
    if let Some(mut target_dominators) = dom_tree.dominators(target) {
        return target_dominators.any(|n| n == node);
    }
    false
}

// Should return a map with entry function of path and all functions in path?
// Return (f_idx for node at height k, f_idx for node less or equal height k)
#[cfg(test)]
fn collect_nodes_for_height(call_graph: &CallGraph, k: usize) -> (Vec<u32>, Vec<u32>) {
    let heights = height_for_graph(call_graph);
    let f_le_height = heights
        .iter()
        .filter(|&(&node, &height)| height <= k && node != call_graph.virtual_root)
        .map(|(node, _)| *call_graph.node_map.get_by_right(node).unwrap())
        .collect();
    let f_for_height = heights
        .iter()
        .filter(|&(&node, &height)| height == k && node != call_graph.virtual_root)
        .map(|(node, _)| *call_graph.node_map.get_by_right(node).unwrap())
        .collect();
    (f_for_height, f_le_height)
}

#[cfg(test)]
mod tests {
    use super::*;
    use petgraph::algo::dominators::Dominators;
    use petgraph::graph::NodeIndex;
    use wat::parse_str as wat2wasm;

    fn print_direct_dominators(call_graph: &CallGraph, dom_tree: Dominators<NodeIndex>) {
        for (&wasm_idx, &pet_idx) in &call_graph.node_map {
            if let Some(imm_dom_idx) = dom_tree.immediate_dominator(pet_idx)
                && imm_dom_idx != call_graph.virtual_root
            {
                let dom_wasm_idx = call_graph.graph[imm_dom_idx];
                println!(
                    "Function {} is immediately dominated by Function {}",
                    wasm_idx, dom_wasm_idx
                );
            }
        }
    }

    #[test]
    fn test_dominator_analysis() {
        let wasm_path = "./fib.wasm";
        let call_graph = call_graph::CallGraph::from_file(wasm_path).unwrap();
        let entry_points = call_graph.entry_points.clone();
        let dom_tree = call_graph.get_dominators();
        print_direct_dominators(&call_graph, dom_tree);
        println!("Entry poimts: {:?}", entry_points);
        let heights = height_for_graph(&call_graph);
        for (node, height) in heights.iter() {
            println!(
                "Node: {:?}, with height {}",
                call_graph.node_map.get_by_right(node),
                height
            );
        }
    }

    #[test]
    fn test_dominator_rec_eval() {
        let wasm_path = "./test_programs/rec_eval.wasm";
        let call_graph = call_graph::CallGraph::from_file(wasm_path).unwrap();
        let entry_points = call_graph.entry_points.clone();
        let dom_tree = call_graph.get_dominators();
        print_direct_dominators(&call_graph, dom_tree);
        println!("Entry points: {:?}", entry_points);
        let heights = height_for_graph(&call_graph);
        for (node, height) in heights.iter() {
            println!(
                "Node: {:?}, with height {}",
                call_graph.node_map.get_by_right(node),
                height
            );
        }
        let (a, b) = collect_nodes_for_height(&call_graph, 2);
        assert!(a.contains(&4));
        let expected: Vec<u32> = vec![6, 4, 2, 0, 7, 1, 3, 5];
        assert!(b.iter().all(|idx| expected.contains(idx)));
    }

    #[test]
    fn test_dominator_data_pipeline() {
        let wasm_path = "./test_programs/data_pipeline.wasm";
        let call_graph = call_graph::CallGraph::from_file(wasm_path).unwrap();
        let entry_points = call_graph.entry_points.clone();
        let dom_tree = call_graph.get_dominators();
        print_direct_dominators(&call_graph, dom_tree);
        println!("Entry poimts: {:?}", entry_points);
        let heights = height_for_graph(&call_graph);
        for (node, height) in heights.iter() {
            println!(
                "Node: {:?}, with height {}",
                call_graph.node_map.get_by_right(node),
                height
            );
        }
    }

    #[test]
    fn test_dominator_state_machine() {
        let wasm_path = "./test_programs/state_machine.wasm";
        let call_graph = call_graph::CallGraph::from_file(wasm_path).unwrap();
        let entry_points = call_graph.entry_points.clone();
        let dom_tree = call_graph.get_dominators();
        print_direct_dominators(&call_graph, dom_tree);
        println!("Entry poimts: {:?}", entry_points);
        let heights = height_for_graph(&call_graph);
        for (node, height) in heights.iter() {
            println!(
                "Node: {:?}, with height {}",
                call_graph.node_map.get_by_right(node),
                height
            );
        }
    }

    #[test]
    fn test_diamond() {
        let wasm_program_text: &str = r#"
        (module
            (export "top" (func $top))
            (func $top ;; 0
                call $left
                call $right)
            (func $left call $bottom) ;; 1
            (func $right call $bottom) ;; 2
            (func $bottom call $last) ;; 3
            (func $last) ;; 4
        )"#;

        let wasm_bytes = wat2wasm(wasm_program_text).unwrap();
        let call_graph = call_graph::CallGraph::from_bytes(&wasm_bytes).unwrap();
        let dom_tree = call_graph.get_dominators();

        for dom in dom_tree.immediately_dominated_by(*call_graph.node_map.get_by_left(&3).unwrap())
        {
            print!("{:?}: {:?}, ", dom, call_graph.node_map.get_by_right(&dom));
        }
        if let Some(dom_iter) =
            dom_tree.strict_dominators(*call_graph.node_map.get_by_left(&4).unwrap())
        {
            for d in dom_iter {
                print!("{:?}, ", call_graph.node_map.get_by_right(&d));
            }
        }
        print_direct_dominators(&call_graph, dom_tree);
    }

    #[test]
    fn test_chain() {
        let wasm_program_text: &str = r#"
        (module
            (export "top" (func $top))
            (func $top call $mid) ;; 0
            (func $mid call $bot) ;; 1
            (func $bot) ;; 2
        )"#;

        let wasm_bytes = wat2wasm(wasm_program_text).unwrap();
        let call_graph = call_graph::CallGraph::from_bytes(&wasm_bytes).unwrap();
        let dom_tree = call_graph.get_dominators();
        print_direct_dominators(&call_graph, dom_tree);
    }
}
