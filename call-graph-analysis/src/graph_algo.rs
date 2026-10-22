use crate::call_graph::{CallGraph, CallType};
use petgraph::Direction;
use petgraph::graph::DiGraph;
use petgraph::graph::NodeIndex;
use std::collections::HashMap;

pub fn reachable_from_node(call_graph: &CallGraph, from: NodeIndex) -> Vec<NodeIndex> {
    let mut visited = vec![false; call_graph.graph.node_count()];
    let mut stack = vec![from];
    let mut result = Vec::new();
    visited[from.index()] = true;
    while let Some(node) = stack.pop() {
        result.push(node);
        for child in call_graph
            .graph
            .neighbors_directed(node, Direction::Outgoing)
        {
            if !visited[child.index()] {
                visited[child.index()] = true;
                stack.push(child);
            }
        }
    }
    result
}

pub fn height_for_graph(call_graph: &CallGraph) -> HashMap<NodeIndex, usize> {
    let mut heights = HashMap::new();
    let mut visited = vec![0; call_graph.graph.node_count()];
    height_for_node(
        &call_graph.graph,
        call_graph.virtual_root,
        &mut heights,
        &mut visited,
    );
    heights
}

// Height for node is = 1 + max children height, 0 if leaf
fn height_for_node(
    graph: &DiGraph<u32, CallType>,
    node: NodeIndex,
    heights: &mut HashMap<NodeIndex, usize>,
    visited: &mut Vec<usize>,
) -> i32 {
    let mut max_height: i32 = -1;
    // set visiting
    visited[node.index()] = 1;
    // Go over al outgoing thus children
    for child in graph.neighbors_directed(node, Direction::Outgoing) {
        let height = match visited[child.index()] {
            // If visited: get height
            2 => heights[&child] as i32,
            // Being visited = backedge and skip child
            1 => {
                continue;
            }
            // Not visited yet
            _ => height_for_node(graph, child, heights, visited),
        };
        max_height = if max_height > height {
            max_height
        } else {
            height
        };
    }
    let height = max_height + 1;
    heights.insert(node, height as usize);
    // Set visited
    visited[node.index()] = 2;
    height
}
