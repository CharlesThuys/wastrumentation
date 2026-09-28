mod utils;
use utils::*;

use std::{fs, io};
use chrono::Utc;

const RUNS: usize = 20;
const RESULT_DIR: &str = "results/";
const BENCH_NAME: &str = "desktop-linux";

fn main() -> io::Result<()> {
    let programs = load_programs()?;
    let analyses = load_analyses()?;
    let platforms = ["wasmtime", "wizard", "wasmer"];

    let time = Utc::now();
    fs::create_dir(RESULT_DIR.to_owned() + BENCH_NAME + &time.to_rfc3339())?;

    let mut size_wtr =
        csv::Writer::from_path(RESULT_DIR.to_owned() + BENCH_NAME  + &time.to_rfc3339() + "/sizes.csv")?;
    let mut wtr =
        csv::Writer::from_path(RESULT_DIR.to_owned() + BENCH_NAME + &time.to_rfc3339() + "/result.csv")?;

    for program_path in programs {
        // The complete WASM program as raw bytes.
        let program: Vec<u8> = fs::read(&program_path)?;
        let program_name = program_path.file_stem().unwrap().to_str().unwrap();

        // Uninstrumented program_size
        println!("Benchmarking {} ({} bytes)", program_name, program.len());
        size_wtr.serialize(SizeResult {
            bytes: program.len() as u32,
            program_name: program_name.to_string(),
            instrumentation: "uninstrumented".to_string(),
            analysis_name: "".to_string(),
            error: "".to_string(),
        })?;
        size_wtr.flush()?;
        
        for platform in platforms {
            for run in 0..RUNS {
            let result = run_bench(platform, program_name, &program, "", "uninstrumented", run as u32);
            wtr.serialize(result)?;
            wtr.flush()?;
            }
        }

        for analysis_path in &analyses {
            let analysis_name = analysis_path.file_stem().unwrap().to_str().unwrap();
            let mut instrumented = vec![];
            
            // Instrumented Program Size
            match instrument(&program, analysis_name, false) {
                Ok(wastrumented) => {
                    instrumented = wastrumented;
                    println!("Instrumented {} with {} ({} bytes)", program_name, analysis_name, instrumented.len());
                    size_wtr.serialize(SizeResult {
                        bytes: instrumented.len() as u32,
                        program_name: program_name.to_string(),
                        instrumentation: "instrumented".to_string(),
                        analysis_name: analysis_name.to_string(),
                        error: "".to_string(),
                    })?;
                }
                Err(err) => {
                    size_wtr.serialize(SizeResult {
                        bytes: instrumented.len() as u32,
                        program_name: program_name.to_string(),
                        instrumentation: "instrumented".to_string(),
                        analysis_name: analysis_name.to_string(),
                        error: err.to_string(),
                    })?;
                    continue;
                }
            }
            size_wtr.flush()?;

            
            let disabled = instrument(&program, analysis_name, true).unwrap();

            for platform in platforms {
                for run in 0..RUNS {
                    let result = run_bench(platform, program_name, &instrumented, analysis_name, "enabled", run as u32);
                    wtr.serialize(result)?;
                    wtr.flush()?;
                }
                for run in 0..RUNS {
                    let result = run_bench(platform, program_name, &disabled, analysis_name, "disabled", run as u32);
                    wtr.serialize(result)?;
                    wtr.flush()?;
                }
            }
            
            wtr.flush()?;
        }
    }
    Ok(())
}
