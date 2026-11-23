mod utils;
use utils::*;

use call_graph_analysis::{call_graph, graph_algo};

use chrono::Utc;
use std::{fs, io, time::Instant};

const RUNS: u32 = 5;
const RESULT_DIR: &str = "results/";
const BENCH_NAME: &str = "mac-soft";

fn main() -> io::Result<()> {
    let programs = load_programs()?;
    let analyses = load_analyses()?;
    let platforms = ["wasmtime", "wasmer"];

    let time = Utc::now();
    fs::create_dir(RESULT_DIR.to_owned() + BENCH_NAME + &time.to_rfc3339())?;

    let mut size_wtr = csv::Writer::from_path(
        RESULT_DIR.to_owned() + BENCH_NAME + &time.to_rfc3339() + "/sizes.csv",
    )?;
    let mut run_wtr = csv::Writer::from_path(
        RESULT_DIR.to_owned() + BENCH_NAME + &time.to_rfc3339() + "/result.csv",
    )?;

    let start_time = Instant::now();

    for program_path in programs {
        // The complete WASM program as raw bytes.
        let program: Vec<u8> = fs::read(&program_path)?;
        let program_name = program_path.file_stem().unwrap().to_str().unwrap();
        let program_graph = call_graph::CallGraph::from_bytes(&program).unwrap();
        let dominations = program_graph.get_dominators(None);
        let dominations_height =
            graph_algo::height_for_dominator_tree(&dominations, program_graph.virtual_root);
        let max_height = *dominations_height.get(&program_graph.virtual_root).unwrap() as u32;
        println!("Max height: {max_height}");

        // Uninstrumented program_size
        println!("Benchmarking {} ({} bytes)", program_name, program.len());
        size_wtr.serialize(SizeResult {
            bytes: program.len() as u32,
            program_name: program_name.to_string(),
            instrumentation: "uninstrumented".to_string(),
            analysis_name: "".to_string(),
            path_height: 0,
            error: "".to_string(),
        })?;
        size_wtr.flush()?;

        for platform in platforms {
            println!("Benchmarking {program_name} on {platform} (uninstrumented)");
            if let Err(err) = run_bench(
                platform,
                program_name,
                &program,
                "",
                "uninstrumented",
                RUNS,
                0,
                &mut run_wtr,
            ) {
                run_wtr.serialize(BenchmarkResult {
                    duration_ms: 0,
                    duration_ns: 0,
                    program_name: program_name.to_string(),
                    instrumentation: "enabled".to_string(),
                    analysis_name: "".to_string(),
                    run: 0,
                    path_height: 0,
                    error: err.to_string(),
                    platform: platform.to_string(),
                })?;
                run_wtr.flush()?;
            }
        }

        for analysis_path in &analyses {
            let analysis_name = analysis_path.file_stem().unwrap().to_str().unwrap();

            for path_height in 0..max_height {
                // Instrumented Program Size
                let instrumented_enabled =
                    match instrument(&program, analysis_name, false, path_height) {
                        Ok(instrumented) => {
                            size_wtr.serialize(SizeResult {
                                bytes: instrumented.len() as u32,
                                program_name: program_name.to_string(),
                                instrumentation: "instrumented".to_string(),
                                analysis_name: analysis_name.to_string(),
                                path_height,
                                error: "".to_string(),
                            })?;
                            size_wtr.flush()?;
                            instrumented
                        }
                        Err(err) => {
                            size_wtr.serialize(SizeResult {
                                bytes: 0,
                                program_name: program_name.to_string(),
                                instrumentation: "instrumented".to_string(),
                                analysis_name: analysis_name.to_string(),
                                path_height,
                                error: err.to_string(),
                            })?;
                            size_wtr.flush()?;
                            continue;
                        }
                    };

                let instrumented_disabled =
                    instrument(&program, analysis_name, true, path_height).unwrap();

                for platform in platforms {
                    for (instrumentation, bench_program) in [
                        ("enabled", &instrumented_enabled),
                        ("disabled", &instrumented_disabled),
                    ] {
                        println!("Benchmarking {program_name} on {platform} ({instrumentation})");
                        if let Err(err) = run_bench(
                            platform,
                            program_name,
                            bench_program,
                            analysis_name,
                            instrumentation,
                            RUNS,
                            path_height,
                            &mut run_wtr,
                        ) {
                            run_wtr.serialize(BenchmarkResult {
                                duration_ms: 0,
                                duration_ns: 0,
                                program_name: program_name.to_string(),
                                instrumentation: "enabled".to_string(),
                                analysis_name: analysis_name.to_string(),
                                run: 0,
                                path_height,
                                error: err.to_string(),
                                platform: platform.to_string(),
                            })?;
                            run_wtr.flush()?;
                        }
                    }
                }
            }
        }
    }
    println!("Total bencmark time: {:?}", start_time.elapsed());
    Ok(())
}
