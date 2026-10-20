mod call_graph;

#[cfg(test)]
use crate::call_graph::CallGraph;
#[cfg(test)]
use petgraph::algo::dominators::Dominators;
#[cfg(test)]
use petgraph::graph::NodeIndex;
#[cfg(test)]
use wat::parse_str as wat2wasm; // Import the Builder

#[cfg(test)]
fn print_direct_dominators(
    call_graph: CallGraph,
    dom_tree: Dominators<NodeIndex>,
    virtual_root: NodeIndex,
) {
    for (&wasm_idx, &pet_idx) in &call_graph.node_map {
        if let Some(imm_dom_idx) = dom_tree.immediate_dominator(pet_idx)
            && imm_dom_idx != virtual_root
        {
            let dom_wasm_idx = call_graph.graph[imm_dom_idx];
            println!(
                "Function {} is immediately dominated by Function {}",
                wasm_idx, dom_wasm_idx
            );
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_dominator_analysis() {
        let wasm_path = "./fib.wasm";
        let mut call_graph = call_graph::CallGraph::from_file(wasm_path).unwrap();
        let (dom_tree, virtual_root) = call_graph.get_dominators();
        print_direct_dominators(call_graph, dom_tree, virtual_root);
    }

    #[test]
    fn test_dominator_rec_eval() {
        let wasm_path = "./test_programs/rec_eval.wasm";
        let mut call_graph = call_graph::CallGraph::from_file(wasm_path).unwrap();
        let (dom_tree, virtual_root) = call_graph.get_dominators();
        print_direct_dominators(call_graph, dom_tree, virtual_root);
    }

    #[test]
    fn test_dominator_data_pipeline() {
        let wasm_path = "./test_programs/data_pipeline.wasm";
        let mut call_graph = call_graph::CallGraph::from_file(wasm_path).unwrap();
        let (dom_tree, virtual_root) = call_graph.get_dominators();
        print_direct_dominators(call_graph, dom_tree, virtual_root);
    }

    #[test]
    fn test_dominator_state_machine() {
        let wasm_path = "./test_programs/state_machine.wasm";
        let mut call_graph = call_graph::CallGraph::from_file(wasm_path).unwrap();
        let entry_points = call_graph.entry_points.clone();
        let (dom_tree, virtual_root) = call_graph.get_dominators();
        print_direct_dominators(call_graph, dom_tree, virtual_root);
        println!("Entry poimts: {:?}", entry_points);
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
        let mut call_graph = call_graph::CallGraph::from_bytes(&wasm_bytes).unwrap();
        let (dom_tree, virtual_root) = call_graph.get_dominators();
        for dom in dom_tree.immediately_dominated_by(*call_graph.node_map.get_by_left(&3).unwrap())
        {
            print!("{:?}: {:?}, ", dom, call_graph.node_map.get_by_right(&dom));
        }
        println!("");
        for dom in dom_tree.strict_dominators(*call_graph.node_map.get_by_left(&4).unwrap()) {
            for d in dom {
                print!("{:?}, ", call_graph.node_map.get_by_right(&d));
            }
            println!("");
        }
        println!("");
        print_direct_dominators(call_graph, dom_tree, virtual_root);
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
        let mut call_graph = call_graph::CallGraph::from_bytes(&wasm_bytes).unwrap();
        let (dom_tree, virtual_root) = call_graph.get_dominators();
        print_direct_dominators(call_graph, dom_tree, virtual_root);
    }
}
