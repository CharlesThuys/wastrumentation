use petgraph::dot::{Config, Dot};
use petgraph::graph::DiGraph;
use std::io::{Read, Write};
use std::path::Path;

use clap::{Args, Parser, Subcommand, ValueEnum};
use clio::{Input, Output};

use call_graph_analysis::call_graph::CallGraph;
use call_graph_analysis::metrics::{self, Report};

#[derive(Parser)]
#[command(version, about)]
struct Cli {
    #[command(subcommand)]
    cmd: Cmd,
}

#[derive(Args)]
struct Io {
    /// Input .wasm file ("-" for stdin)
    #[clap(value_parser)]
    input: Input,
    /// Output file ("-" or omitted = stdout)
    #[clap(long, short, value_parser, default_value = "-")]
    output: Output,
}

#[derive(Subcommand)]
enum Cmd {
    /// Emit the dominator tree as DOT
    Domtree {
        #[command(flatten)]
        io: Io,
        /// "virtual" (root linked to all entry points/exports) or a func name/index
        #[arg(long, default_value = "virtual")]
        root: String,
    },
    /// Compute metrics
    Metrics {
        #[command(flatten)]
        io: Io,
        #[arg(long, short, value_enum, num_args = 1.., default_values_t = [Metric::All])]
        metric: Vec<Metric>,
    },
}

#[derive(Clone, Copy, ValueEnum, PartialEq)]
enum Metric {
    All,
    InEdges,
    OutEdges,
    Depth,
    DominatorDepth,
}

enum Root {
    Virtual,
    Func(u32),
}

fn main() -> anyhow::Result<()> {
    let cli = Cli::parse(); // exits with help/error on bad args

    match cli.cmd {
        Cmd::Domtree { mut io, root } => {
            let mut wasm_bytes = Vec::new();
            io.input.read_to_end(&mut wasm_bytes)?;
            let call_graph = CallGraph::from_bytes(&wasm_bytes)?;
            let root = parse_root(&root, &call_graph)?;
            let dom = make_dominator_dot(&call_graph, root);
            write!(io.output, "{}", dom)?;
        }
        Cmd::Metrics {
            mut io,
            metric: _metric,
        } => {
            let mut wasm_bytes = Vec::new();
            io.input.read_to_end(&mut wasm_bytes)?;
            let call_graph = CallGraph::from_bytes(&wasm_bytes)?;
            let report = metrics::compute(&call_graph, &wasm_bytes)?;
            if io.output.is_local() {
                write_csv(&report, io.output.path())?;
            } else {
                write!(io.output, "{:?}", report)?;
            }
        }
    }
    Ok(())
}

fn parse_root(s: &str, cg: &CallGraph) -> anyhow::Result<Root> {
    if s == "virtual" {
        return Ok(Root::Virtual);
    } else if let Ok(idx) = s.parse::<u32>()
        && cg.node_map.contains_left(&idx)
    {
        return Ok(Root::Func(idx));
    }
    Err(anyhow::anyhow!("unknown function"))
}

fn make_dominator_dot(call_graph: &CallGraph, root: Root) -> String {
    let doms = match root {
        Root::Virtual => call_graph.get_dominators(None),
        Root::Func(root_idx) => {
            let node = call_graph.node_map.get_by_left(&root_idx).unwrap();
            call_graph.get_dominators(Some(*node))
        }
    };

    let mut dom_tree: DiGraph<String, &str> = call_graph.graph.map(
        |_, w| {
            if *w == u32::MAX {
                "virtual root".to_string()
            } else {
                w.to_string()
            }
        },
        |_, _| "",
    );
    dom_tree.clear_edges();
    for node in call_graph.graph.node_indices() {
        if let Some(dominator) = doms.immediate_dominator(node) {
            dom_tree.add_edge(dominator, node, "");
        }
    }
    format!("{}", Dot::with_config(&dom_tree, &[Config::EdgeNoLabel]))
}

/// Writes program.csv, k_curve.csv and functions.csv into `dir`.
pub fn write_csv(report: &Report, output_file: &Path) -> anyhow::Result<()> {
    let mut w = csv::Writer::from_path(output_file)?;
    w.serialize(&report.program)?;
    w.flush()?;

    if let Some(parent) = output_file.parent() {
        if let Some(stem) = output_file.file_stem().and_then(|s| s.to_str()) {
            let heights_name = format!("{}_heights.csv", stem);
            let heights_path = parent.join(heights_name);

            let mut w = csv::Writer::from_path(heights_path)?;
            for row in &report.k_heights {
                w.serialize(row)?;
            }
            w.flush()?;

            let functions_name = format!("{}_functions.csv", stem);
            let functions_path = parent.join(functions_name);
            let mut w = csv::Writer::from_path(functions_path)?;
            for row in &report.functions {
                w.serialize(row)?;
            }
            w.flush()?;
        }
    }

    Ok(())
}
