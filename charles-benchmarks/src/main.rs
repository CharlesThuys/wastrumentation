use std::{
    ffi::OsStr,
    fs, io,
    num::NonZeroUsize,
    path::absolute,
    time::{Duration, Instant},
};

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

const RUNS: usize = 3;
const PROGRAM_DIR: &str = "../../wasm-benchmarks/wasm-r3-bench"; //"../../../wasm-benchmarks/wasm-r3-bench";
const RESULT_DIR: &str = "results/";
const PATH_INPUT_ANLYSIS: &str = "input-analyses/forward/Cargo.toml";

use serde::{Deserialize, Serialize};

fn instrument(input_program: &[u8]) -> Vec<u8> {
    let analysis_compiler = Compiler::setup_compiler().expect("Setup Rust compiler");
    let instrumentation_compiler =
        ASCompiler::setup_compiler().expect("Setup AssemblyScript compiler");

    let source = Manifest(WasiSupport::Enabled, absolute(PATH_INPUT_ANLYSIS).unwrap());
    let hooks = Hook::all_hooks();
    let analysis = RustAnalysisSpec { source, hooks }.into();

    let configuration = Configuration {
        target_indices: None,
        primary_selection: Some(PrimaryTarget::Analysis),
    };

    let wastrumenter = Wastrumenter::new(instrumentation_compiler.into(), analysis_compiler.into());
    wastrumenter
        .wastrument(input_program, analysis, &configuration)
        .expect("Wastrumentation should succeed")
}

fn execute_on_wasmtime(program: &[u8], disable: bool) -> Duration {
    let mut config = Config::new();

    config.wasm_backtrace_max_frames(Some(NonZeroUsize::new(100).unwrap()));

    let engine = Engine::new(&config).unwrap();
    let mut linker: Linker<WasiP1Ctx> = Linker::new(&engine);

    preview1::add_to_linker_sync(&mut linker, |ctx| ctx).unwrap();

    let wasi_ctx = WasiCtxBuilder::new().inherit_stdio().build_p1();

    let mut store = Store::new(&engine, wasi_ctx);
    let module = Module::from_binary(store.engine(), program).unwrap();
    let instance = linker.instantiate(&mut store, &module).unwrap();

    let start_function = instance
        .get_typed_func::<(), ()>(&mut store, "_start")
        .unwrap();

    if disable {
        let disable_instrumentation_function = instance
            .get_typed_func::<i32, ()>(&mut store, "set_instrumentation")
            .unwrap();
        disable_instrumentation_function
            .call(&mut store, 0)
            .unwrap();
    }

    let start_time = Instant::now();
    start_function.call(&mut store, ()).unwrap();
    Instant::now() - start_time
}

#[derive(Debug, Deserialize, Serialize)]
struct BenchmarkResult {
    duration_ms: u128,
    duration_ns: u128,
    program_name: String,
    instrumentation: String,
}

fn main() -> io::Result<()> {
    let mut paths = fs::read_dir(PROGRAM_DIR)?
        .map(|entry| entry.map(|entry| entry.path()))
        .filter(|path| {
            path.as_ref().unwrap().is_file()
                && path.as_ref().unwrap().file_name() == Some(OsStr::new("factorial.wasm"))
        })
        .collect::<io::Result<Vec<_>>>()?;

    paths.sort();

    let time = Utc::now();
    fs::create_dir(RESULT_DIR.to_owned() + &time.to_rfc3339())?;

    for path in paths {
        // Ignore directories and non-WASM files.
        if !path.is_file() || path.extension().and_then(|ext| ext.to_str()) != Some("wasm") {
            continue;
        }

        // The complete WASM program as raw bytes.
        let program: Vec<u8> = fs::read(&path)?;
        let program_name = path.file_stem().unwrap().to_str().unwrap();

        println!("Benchmarking {} ({} bytes)", program_name, program.len());

        let mut wtr =
            csv::Writer::from_path(RESULT_DIR.to_owned() + &time.to_rfc3339() + "/result.csv")?;

        let mut size = program.len();
        // UNINSTRUMENTED
        for _ in 0..RUNS {
            let result = execute_on_wasmtime(&program, false);
            wtr.serialize(BenchmarkResult {
                duration_ms: result.as_millis(),
                duration_ns: result.as_nanos(),
                program_name: program_name.to_string(),
                instrumentation: "uninstrumented".to_string(),
            })?;
        }
        println!("Uninstrumented size: {}", size);

        // INSTRUMENTED ON
        for _ in 0..RUNS {
            let instrumented = instrument(&program);
            size = instrumented.len();
            let result = execute_on_wasmtime(&instrumented, false);
            wtr.serialize(BenchmarkResult {
                duration_ms: result.as_millis(),
                duration_ns: result.as_nanos(),
                program_name: program_name.to_string(),
                instrumentation: "enabled".to_string(),
            })?;
        }
        println!("Instrumented Size: {}", size);

        // INSTRUMENTED OFF
        for _ in 0..RUNS {
            let instrumented = instrument(&program);
            size = instrumented.len();
            let result = execute_on_wasmtime(&instrumented, true);
            wtr.serialize(BenchmarkResult {
                duration_ms: result.as_millis(),
                duration_ns: result.as_nanos(),
                program_name: program_name.to_string(),
                instrumentation: "disabled".to_string(),
            })?;
        }

        wtr.flush()?; // Ensure data is written
    }

    Ok(())
}
