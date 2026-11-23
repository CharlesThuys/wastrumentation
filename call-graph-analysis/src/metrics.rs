use std::{
    collections::{HashMap, HashSet, VecDeque},
    path::Path,
};

use crate::call_graph::CallGraph;

use petgraph::{
    Direction::{Incoming, Outgoing},
    graph::NodeIndex,
};
use serde::Serialize;
use wasmparser::{Import, ImportItemCompact, Imports, Parser, Payload, SectionLimited, TypeRef};

#[derive(Serialize, Debug)]
pub struct ProgramMetrics {
    // pub program: String,
    pub functions: usize,
    pub imports: usize,
    pub call_edges: usize,
    pub entry_points: usize,
    // pub num_unreachable: usize,
    /// Share of reachable functions that call nothing.
    pub leaves: f64,
    pub call_graph_depth: usize,
    // pub call_graph_height: usize,
    pub dominator_depth: usize,
    pub dominator_height: usize,
    /// Share of reachable functions whose immediate dominator is the virtual root.
    pub flatness: f64,
    /// Share of reachable functions with more than one distinct caller.
    pub sharing: f64,
    /// Average number of children of dominator-tree nodes that have children.
    // pub avg_dom_branching: f64,
    //pub nontrivial_sccs: usize,
    // pub largest_scc: usize,
    // pub recursive_functions: usize,
    pub median_body_size: u32,
    // pub tiny_function_ratio: f64,
}

#[derive(Serialize, Debug)]
pub struct FunctionMetrics {
    // pub program: String,
    pub func_idx: u32,
    pub is_import: bool,
    /// Size of the code body in bytes (0 for imports).
    pub body_size: u32,
    /// Called directly by the virtual root (export, start, table entry).
    pub is_entry_point: bool,
    pub reachable: bool,

    // Call graph
    /// Incoming call edges, excluding the virtual root.
    pub in_edges: usize,
    pub out_edges: usize,
    pub distinct_callers: usize,
    pub distinct_callees: usize,
    pub self_recursive: bool,
    // pub scc_size: usize,
    /// Shortest call distance from the entry points.
    pub call_graph_depth: Option<usize>,
    /// Height in the SCC condensation of the call graph.
    // pub call_graph_height: usize,

    // Dominator tree
    /// Function index of the immediate dominator, -1 for the virtual root.
    // pub idom: Option<i64>,
    pub idom_is_root: bool,
    pub dom_depth: Option<usize>,
    pub dom_height: Option<usize>,
    pub dom_children: usize,

    // Dominator subtree = candidate path rooted at this function
    pub subtree_size: usize,
    // pub subtree_body_size: u64,
    // Call edges from inside the subtree to functions outside it
    // pub subtree_exit_edges: usize,
    // pub subtree_exit_targets: usize,
    // pub strict_valid: bool,
}

/// One row per dominator-tree height k: what the "height == k" rule would select.
#[derive(Serialize, Debug)]
pub struct KHeightMetrics {
    pub k: usize,
    pub candidates: usize,
    // pub strict_valid: usize,
    /// Share of reachable functions inside a strictly valid path.
    // pub strict_coverage: f64,
    /// Share of reachable functions inside any candidate path (relaxed rule).
    pub relaxed_coverage: f64,
    // Checked exit calls the relaxed rule would need.
    // pub relaxed_exit_edges: usize,
}

#[derive(Serialize, Debug)]
pub struct Report {
    pub program: ProgramMetrics,
    pub k_heights: Vec<KHeightMetrics>,
    pub functions: Vec<FunctionMetrics>,
}

pub fn compute(cg: &CallGraph, wasm_bytes: &[u8]) -> anyhow::Result<Report> {
    let g = &cg.graph;
    let root = g
        .node_indices()
        .find(|&n| g[n] == u32::MAX)
        .ok_or_else(|| anyhow::anyhow!("call graph has no virtual root"))?;
    let funcs: Vec<NodeIndex> = g.node_indices().filter(|&n| n != root).collect();
    let (num_imported_funcs, body_size) = body_sizes(wasm_bytes)?;

    // --- Call graph depth: BFS from the virtual root ---
    let mut cg_dist: HashMap<NodeIndex, usize> = HashMap::from([(root, 0)]);
    let mut queue = VecDeque::from([root]);
    while let Some(n) = queue.pop_front() {
        let d = cg_dist[&n];
        for c in g.neighbors_directed(n, Outgoing) {
            if !cg_dist.contains_key(&c) {
                cg_dist.insert(c, d + 1);
                queue.push_back(c);
            }
        }
    }

    // --- Dominator tree ---
    let doms = cg.get_dominators(None);
    let mut children: HashMap<NodeIndex, Vec<NodeIndex>> = HashMap::new();
    for &n in &funcs {
        if let Some(d) = doms.immediate_dominator(n) {
            children.entry(d).or_default().push(n);
        }
    }

    // Preorder DFS with entry/exit times: v is in subtree(u) iff tin[u] <= tin[v] < tout[u]
    let mut order: Vec<NodeIndex> = Vec::new();
    let mut tin: HashMap<NodeIndex, usize> = HashMap::new();
    let mut tout: HashMap<NodeIndex, usize> = HashMap::new();
    let mut dom_depth: HashMap<NodeIndex, usize> = HashMap::new();
    let mut stack = vec![(root, 0usize, false)];
    while let Some((n, d, done)) = stack.pop() {
        if done {
            tout.insert(n, order.len());
            continue;
        }
        tin.insert(n, order.len());
        order.push(n);
        dom_depth.insert(n, d);
        stack.push((n, d, true));
        if let Some(cs) = children.get(&n) {
            for &c in cs {
                stack.push((c, d + 1, false));
            }
        }
    }
    let in_subtree = |u: NodeIndex, v: NodeIndex| match (tin.get(&u), tin.get(&v)) {
        (Some(&a), Some(&b)) => a <= b && b < tout[&u],
        _ => false,
    };

    // Heights and subtree code size, bottom-up (reverse preorder visits children first)
    let mut dom_height: HashMap<NodeIndex, usize> = HashMap::new();
    let mut sub_body: HashMap<NodeIndex, u64> = HashMap::new();
    for &n in order.iter().rev() {
        let cs: &[NodeIndex] = children.get(&n).map(|v| v.as_slice()).unwrap_or(&[]);
        let h = cs.iter().map(|c| dom_height[c] + 1).max().unwrap_or(0);
        let own = if n == root {
            0
        } else {
            body_size.get(&g[n]).copied().unwrap_or(0) as u64
        };
        let s = own + cs.iter().map(|c| sub_body[c]).sum::<u64>();
        dom_height.insert(n, h);
        sub_body.insert(n, s);
    }

    // Calls leaving the dominator subtree of u
    let _exits = |u: NodeIndex| -> (usize, usize) {
        let (a, b) = (tin[&u], tout[&u]);
        let mut edges = 0;
        let mut targets = HashSet::new();
        for &m in &order[a..b] {
            for t in g.neighbors_directed(m, Outgoing) {
                if !in_subtree(u, t) {
                    edges += 1;
                    targets.insert(t);
                }
            }
        }
        (edges, targets.len())
    };

    // --- Per-function rows ---
    let mut functions = Vec::with_capacity(funcs.len());
    for &n in &funcs {
        let idx = g[n];
        let callers: Vec<NodeIndex> = g
            .neighbors_directed(n, Incoming)
            .filter(|&p| p != root)
            .collect();
        let callees: Vec<NodeIndex> = g.neighbors_directed(n, Outgoing).collect();
        let distinct_callers: HashSet<NodeIndex> = callers.iter().copied().collect();
        let distinct_callees: HashSet<NodeIndex> = callees.iter().copied().collect();
        let reachable = tin.contains_key(&n);
        let idom = doms.immediate_dominator(n);
        // let (_exit_edges, _exit_targets) = if reachable { exits(n) } else { (0, 0) };

        functions.push(FunctionMetrics {
            // program: name.to_string(),
            func_idx: idx,
            is_import: idx < num_imported_funcs,
            body_size: body_size.get(&idx).copied().unwrap_or(0),
            is_entry_point: g.contains_edge(root, n),
            reachable,
            in_edges: callers.len(),
            out_edges: callees.len(),
            distinct_callers: distinct_callers.len(),
            distinct_callees: distinct_callees.len(),
            self_recursive: distinct_callees.contains(&n),
            // scc_size: sccs[scc_of[&n]].len(),
            call_graph_depth: cg_dist.get(&n).map(|d| d - 1),
            // call_graph_height: scc_height[scc_of[&n]],
            //idom: idom.map(|d| if d == root { -1 } else { g[d] as i64 }),
            idom_is_root: idom == Some(root),
            dom_depth: dom_depth.get(&n).map(|d| d - 1),
            dom_height: dom_height.get(&n).copied(),
            dom_children: children.get(&n).map_or(0, |c| c.len()),
            subtree_size: if reachable { tout[&n] - tin[&n] } else { 0 },
            //subtree_body_size: sub_body.get(&n).copied().unwrap_or(0),
            //subtree_exit_edges: exit_edges,
            //subtree_exit_targets: exit_targets,
            //strict_valid: reachable && exit_edges == 0,
        });
    }

    // --- Program-level metrics ---
    let reach: Vec<&FunctionMetrics> = functions.iter().filter(|f| f.reachable).collect();
    let nr = reach.len().max(1) as f64;
    let share = |pred: &dyn Fn(&FunctionMetrics) -> bool| {
        reach.iter().filter(|f| pred(f)).count() as f64 / nr
    };

    let mut defined_sizes: Vec<u32> = functions
        .iter()
        .filter(|f| !f.is_import)
        .map(|f| f.body_size)
        .collect();
    defined_sizes.sort_unstable();
    let _internal: Vec<&&FunctionMetrics> = reach.iter().filter(|f| f.dom_children > 0).collect();

    let program = ProgramMetrics {
        //program: name.to_string(),
        functions: funcs.len(),
        imports: functions.iter().filter(|f| f.is_import).count(),
        call_edges: g.edge_count() - g.edges_directed(root, Outgoing).count(),
        entry_points: g
            .neighbors_directed(root, Outgoing)
            .collect::<HashSet<_>>()
            .len(),
        //num_unreachable: funcs.len() - reach.len(),
        leaves: share(&|f| f.out_edges == 0),
        call_graph_depth: reach
            .iter()
            .filter_map(|f| f.call_graph_depth)
            .max()
            .unwrap_or(0),
        // call_graph_height: reach.iter().map(|f| f.cg_height).max().unwrap_or(0),
        dominator_depth: reach.iter().filter_map(|f| f.dom_depth).max().unwrap_or(0),
        dominator_height: reach.iter().filter_map(|f| f.dom_height).max().unwrap_or(0),
        flatness: share(&|f| f.idom_is_root),
        sharing: share(&|f| f.distinct_callers > 1),
        /*avg_dom_branching: if internal.is_empty() {
            0.0
        } else {
            internal.iter().map(|f| f.dom_children).sum::<usize>() as f64 / internal.len() as f64
        },
        nontrivial_sccs: sccs.iter().filter(|s| s.len() > 1).count(),
        largest_scc: sccs.iter().map(|s| s.len()).max().unwrap_or(0),
        recursive_functions: reach.iter().filter(|f| f.scc_size > 1 || f.self_recursive).count(),*/
        median_body_size: defined_sizes
            .get(defined_sizes.len() / 2)
            .copied()
            .unwrap_or(0),
        /*tiny_function_ratio: if defined_sizes.is_empty() {
            0.0
        } else {
            defined_sizes.iter().filter(|&&s| s <= TINY_BODY_BYTES).count() as f64 / defined_sizes.len() as f64
        },*/
    };

    // --- What the "dom_height == k" rule selects, for every k ---
    let k_heights = (0..=program.dominator_height)
        .map(|k| {
            let cands: Vec<&&FunctionMetrics> =
                reach.iter().filter(|f| f.dom_height == Some(k)).collect();
            //let valid: Vec<&&&FunctionMetrics> = cands.iter().filter(|f| f.strict_valid).collect();
            KHeightMetrics {
                k,
                candidates: cands.len(),
                // strict_valid: valid.len(),
                // strict_coverage: valid.iter().map(|f| f.subtree_size).sum::<usize>() as f64 / nr,
                relaxed_coverage: cands.iter().map(|f| f.subtree_size).sum::<usize>() as f64 / nr,
                // relaxed_exit_edges: cands.iter().map(|f| f.subtree_exit_edges).sum(),
            }
        })
        .collect();

    Ok(Report {
        program,
        k_heights,
        functions,
    })
}

/// Number of imported functions and the code-body size of every defined function,
/// keyed by Wasm function index.
/// Written against the classic `wasmparser` import reader (one `Import` per item);
/// newer versions that group imports need the import loop adapted.
fn body_sizes(bytes: &[u8]) -> anyhow::Result<(u32, HashMap<u32, u32>)> {
    let mut imported = 0u32;
    let mut defined = 0u32;
    let mut sizes = HashMap::new();
    for payload in Parser::new(0).parse_all(bytes) {
        match payload? {
            Payload::ImportSection(reader) => {
                imported += count_imports(reader);
            }
            Payload::CodeSectionEntry(body) => {
                sizes.insert(imported + defined, body.range().len() as u32);
                println!(
                    "f_idx: {}, code_size: {}",
                    imported + defined,
                    body.range().len() as u32
                );
                println!("body: {:?}", body.as_bytes());
                defined += 1;
            }
            _ => {}
        }
    }
    Ok((imported, sizes))
}

pub fn get_imports(wasm_bytes: &[u8]) -> u32 {
    let mut imported = 0;
    for payload in Parser::new(0).parse_all(wasm_bytes) {
        if let Ok(Payload::ImportSection(reader)) = payload {
            imported = count_imports(reader);
        }
    }
    imported
}

pub fn count_imports(reader: SectionLimited<'_, Imports<'_>>) -> u32 {
    let mut imported = 0;
    for imports in reader.into_iter().flatten() {
        match imports {
            Imports::Single(
                _,
                Import {
                    module: _,
                    name: _,
                    ty: TypeRef::Func(_),
                },
            ) => imported += 1,
            Imports::Compact1 { module: _, items } => {
                for item in items.into_iter().flatten() {
                    if let ImportItemCompact {
                        name: _,
                        ty: TypeRef::Func(_),
                    } = item
                    {
                        imported += 1;
                    }
                }
            }
            Imports::Compact2 {
                module: _,
                ty: TypeRef::Func(_),
                names,
            } => {
                imported += names.into_iter().flatten().count() as u32;
            }
            _ => (),
        }
    }
    imported
}
