use std::{
    collections::{HashMap, HashSet},
    fs, io,
    num::NonZeroUsize,
    path::{PathBuf, absolute},
    time::{Duration, Instant},
};

use anyhow::{Result, anyhow};

use rust_to_wasm_compiler::WasiSupport;
use wastrumentation::{
    Configuration,
    PrimaryTarget::{self},
    Wastrumenter,
    compiler::Compiles,
};
use wastrumentation_lang_assemblyscript::compile::compiler::Compiler as ASCompiler;
use wastrumentation_lang_rust::compile::{compiler::Compiler, options::RustSource::Manifest};
use wastrumentation_lang_rust::generate::analysis::Hook;
use wastrumentation_lang_rust::generate::analysis::RustAnalysisSpec;

// Wasmtime imports
use wasmtime::{Config, Engine, Linker, Module, Store};
use wasmtime_wasi::WasiCtxBuilder;
use wasmtime_wasi::p1::{self as preview1, WasiP1Ctx};

use chrono::Utc;

const RUNS: usize = 30;
const PROGRAM_DIR: &str = "../../wasm-benchmarks/wasm-r3-bench";
const ANALYSES_DIR: &str = "input-analyses/";
const RESULT_DIR: &str = "results/";

use serde::{Deserialize, Serialize};

fn instrument(input_program: &[u8], analysis: &str) -> Result<Vec<u8>> {
    let analysis_hooks: HashMap<&'static str, HashSet<Hook>> = HashMap::from([
        ("generic-apply", HashSet::from([Hook::GenericApply])),
        ("forward", Hook::all_hooks()),
    ]);

    let analysis_compiler = Compiler::setup_compiler()?;
    let instrumentation_compiler = ASCompiler::setup_compiler()?;

    let source = Manifest(
        WasiSupport::Enabled,
        absolute(ANALYSES_DIR.to_string() + analysis + "/Cargo.toml")?,
    );
    let hooks = analysis_hooks
        .get(analysis)
        .cloned()
        .ok_or_else(|| anyhow::anyhow!("unknown analysis: {analysis}"))?; // Hook::all_hooks();
    let analysis = RustAnalysisSpec { source, hooks }.into();

    let configuration = Configuration {
        target_indices: None,
        primary_selection: Some(PrimaryTarget::Analysis),
    };

    let wastrumenter = Wastrumenter::new(instrumentation_compiler.into(), analysis_compiler.into());
    let wastrumented = wastrumenter
        .wastrument(input_program, analysis, &configuration)
        .map_err(|error| anyhow!("Wastrumentation failed: {error:?}"))?;
    Ok(wastrumented)
}

fn execute_on_wasmtime(program: &[u8], disable: bool) -> Result<Duration> {
    let mut config = Config::new();

    config.wasm_backtrace_max_frames(Some(NonZeroUsize::new(100).unwrap()));

    let engine = Engine::new(&config)?;
    let mut linker: Linker<WasiP1Ctx> = Linker::new(&engine);

    preview1::add_to_linker_sync(&mut linker, |ctx| ctx)?;

    let wasi_ctx = WasiCtxBuilder::new().inherit_stdio().build_p1();

    let mut store = Store::new(&engine, wasi_ctx);
    let module = Module::from_binary(store.engine(), program)?;
    let instance = linker.instantiate(&mut store, &module)?;

    let start_function = instance.get_typed_func::<(), ()>(&mut store, "_start")?;

    if disable {
        let disable_instrumentation_function =
            instance.get_typed_func::<i32, ()>(&mut store, "set_instrumentation")?;
        disable_instrumentation_function.call(&mut store, 0)?;
    }

    let start_time = Instant::now();
    start_function.call(&mut store, ())?;
    Ok(Instant::now() - start_time)
}

#[derive(Debug, Deserialize, Serialize)]
struct BenchmarkResult {
    duration_ms: u128,
    duration_ns: u128,
    program_name: String,
    instrumentation: String,
    analysis_name: String,
    run: u32,
    error: String,
}

#[derive(Debug, Deserialize, Serialize)]
struct SizeResult {
    bytes: u32,
    program_name: String,
    instrumentation: String,
    analysis_name: String,
    error: String,
}

fn main() -> io::Result<()> {
    let programs = load_programs()?;
    let analyses = load_analyses()?;

    println!(
        "{:?}",
        analyses
            .iter()
            .map(|p| p.file_stem().unwrap().to_str().unwrap())
            .collect::<Vec<_>>()
    );

    let time = Utc::now();
    fs::create_dir(RESULT_DIR.to_owned() + &time.to_rfc3339())?;

    let mut size_wtr =
        csv::Writer::from_path(RESULT_DIR.to_owned() + &time.to_rfc3339() + "/sizes.csv")?;
    let mut wtr =
        csv::Writer::from_path(RESULT_DIR.to_owned() + &time.to_rfc3339() + "/result.csv")?;

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
            analysis_name: "uninstrumented".to_string(),
            error: "".to_string(),
        })?;

        // Run uninstrumented
        for run in 0..RUNS {
            match execute_on_wasmtime(&program, false) {
                Ok(result) => {
                    wtr.serialize(BenchmarkResult {
                        duration_ms: result.as_millis(),
                        duration_ns: result.as_nanos(),
                        program_name: program_name.to_string(),
                        instrumentation: "uninstrumented".to_string(),
                        analysis_name: "uninstrumented".to_string(),
                        run: run as u32,
                        error: "".to_string(),
                    })?;
                }
                Err(err) => {
                    wtr.serialize(BenchmarkResult {
                        duration_ms: 0,
                        duration_ns: 0,
                        program_name: program_name.to_string(),
                        instrumentation: "uninstrumented".to_string(),
                        analysis_name: "uninstrumented".to_string(),
                        run: run as u32,
                        error: err.to_string(),
                    })?;
                }
            }
        }

        for analysis_path in &analyses {
            let analysis_name = analysis_path.file_stem().unwrap().to_str().unwrap();
            let mut instrumented = vec![];

            // Instrumented Program Size
            match instrument(&program, analysis_name) {
                Ok(wastrumented) => {
                    instrumented = wastrumented;
                    println!(
                        "Instrumented {} ({} bytes)",
                        program_name,
                        instrumented.len()
                    );
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
                        bytes: 0,
                        program_name: program_name.to_string(),
                        instrumentation: "instrumented".to_string(),
                        analysis_name: analysis_name.to_string(),
                        error: err.to_string(),
                    })?;
                    continue;
                }
            }

            // Run instrumented
            for run in 0..RUNS {
                match execute_on_wasmtime(&instrumented, false) {
                    Ok(result) => {
                        wtr.serialize(BenchmarkResult {
                            duration_ms: result.as_millis(),
                            duration_ns: result.as_nanos(),
                            program_name: program_name.to_string(),
                            instrumentation: "enabled".to_string(),
                            analysis_name: analysis_name.to_string(),
                            run: run as u32,
                            error: "".to_string(),
                        })?;
                    }
                    Err(err) => {
                        wtr.serialize(BenchmarkResult {
                            duration_ms: 0,
                            duration_ns: 0,
                            program_name: program_name.to_string(),
                            instrumentation: "enabled".to_string(),
                            analysis_name: analysis_name.to_string(),
                            run: run as u32,
                            error: err.to_string(),
                        })?;
                    }
                }
            }

            // INSTRUMENTED OFF
            for run in 0..RUNS {
                match execute_on_wasmtime(&instrumented, true) {
                    Ok(result) => {
                        wtr.serialize(BenchmarkResult {
                            duration_ms: result.as_millis(),
                            duration_ns: result.as_nanos(),
                            program_name: program_name.to_string(),
                            instrumentation: "disabled".to_string(),
                            analysis_name: analysis_name.to_string(),
                            run: run as u32,
                            error: "".to_string(),
                        })?;
                    }
                    Err(err) => {
                        wtr.serialize(BenchmarkResult {
                            duration_ms: 0,
                            duration_ns: 0,
                            program_name: program_name.to_string(),
                            instrumentation: "disabled".to_string(),
                            analysis_name: analysis_name.to_string(),
                            run: run as u32,
                            error: err.to_string(),
                        })?;
                    }
                }
            }

            wtr.flush()?; // Ensure data is written
        }
    }
    Ok(())
}

fn load_programs() -> io::Result<Vec<PathBuf>> {
    let mut paths = fs::read_dir(PROGRAM_DIR)?
        .map(|entry| entry.map(|entry| entry.path()))
        .filter(|path| {
            let p = path.as_ref().unwrap();
            p.is_file()
                /*&& (
                    p.file_name() == Some(OsStr::new("factorial.wasm"))
                        || p.file_name() == Some(OsStr::new("game-of-life.wasm"))
                    // || p.file_name() == Some(OsStr::new("guiicons.wasm"))
                )*/
                && p.extension().and_then(|ext| ext.to_str()) == Some("wasm")
        })
        .collect::<io::Result<Vec<_>>>()?;

    paths.sort();
    Ok(paths)
}

fn load_analyses() -> io::Result<Vec<PathBuf>> {
    let mut paths = fs::read_dir(ANALYSES_DIR)?
        .map(|entry| entry.map(|entry| entry.path()))
        .filter(|path| path.as_ref().unwrap().is_dir())
        .collect::<io::Result<Vec<_>>>()?;

    paths.sort();
    Ok(paths)
}
