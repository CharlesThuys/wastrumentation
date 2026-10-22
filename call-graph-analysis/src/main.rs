use petgraph::dot::{Config, Dot};
use petgraph::graph::DiGraph;
use std::fs;
mod call_graph;

fn main() -> std::io::Result<()> {
    let wasm_path = "./fib.wasm";
    let call_graph = call_graph::CallGraph::from_file(wasm_path).unwrap();
    let doms = call_graph.get_dominators(); //simple_fast(&call_graph.graph, *call_graph.node_map.get_by_left(&9).unwrap());

    let mut dom_tree: DiGraph<&u32, &str> = call_graph.graph.map(|_, w| w, |_, _| "");
    dom_tree.clear_edges();

    for node in call_graph.graph.node_indices() {
        if let Some(dominator) = doms.immediate_dominator(node) {
            dom_tree.add_edge(dominator, node, "");
        }
    }

    let dot = format!("{}", Dot::with_config(&dom_tree, &[Config::EdgeNoLabel]));
    fs::write("fib_dominator_tree.dot", dot)?;
    Ok(())
}
