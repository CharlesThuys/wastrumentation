use std::{
    collections::{HashMap, HashSet},
    fs, io,
    path::PathBuf,
    process::{Command, Output},
    time::{Duration, Instant},
};

use anyhow::{Result, anyhow};
use serde::{Deserialize, Serialize};
use tempfile::Builder;

use wastrumentation::{Configuration, Wastrumenter};

use wastrumentation_lang_webassembly::compile::compiler::Compiler;
use wastrumentation_lang_webassembly::compile::options::WebAssemblySource;
use wastrumentation_lang_webassembly::generate::analysis::Hook;
use wastrumentation_lang_webassembly::generate::analysis::WasmAnalysisSpec;

// Wasmtime imports
#[allow(unused_imports)]
use wasmtime::{Config, Engine, Instance, Linker, Module, Store};
#[allow(unused_imports)]
use wasmtime_wasi::WasiCtxBuilder;
#[allow(unused_imports)]
use wasmtime_wasi::p1::{self as preview1, WasiP1Ctx};

pub static PROGRAM_DIR: &str = "input-programs/wasm-r3-bench";
pub static ANALYSES_DIR: &str = "input-analyses/";

// const PROGRAMS: [&str; 2] = ["factorial", "rfxgen"];
const ANALYSES: [&str; 1] = ["forward"]; // , "pure-functions-memoization",  "signatures-check",

#[derive(Debug, Deserialize, Serialize)]
pub struct BenchmarkResult {
    pub duration_ms: u128,
    pub duration_ns: u128,
    pub program_name: String,
    pub instrumentation: String,
    pub analysis_name: String,
    pub run: u32,
    pub path_height: u32,
    pub error: String,
    pub platform: String,
}

#[derive(Debug, Deserialize, Serialize)]
pub struct SizeResult {
    pub bytes: u32,
    pub program_name: String,
    pub instrumentation: String,
    pub analysis_name: String,
    pub path_height: u32,
    pub error: String,
}

pub fn execute_on_wasmtime(program: &[u8]) -> Result<Duration> {
    /*
    let mut config = Config::new();
    config.wasm_backtrace_max_frames(Some(NonZeroUsize::new(100).unwrap()));
    config.wasm_multi_memory(true);

    let engine = Engine::new(&config)?;
    let mut linker: Linker<WasiP1Ctx> = Linker::new(&engine);

    preview1::add_to_linker_sync(&mut linker, |ctx| ctx)?;

    let wasi_ctx = WasiCtxBuilder::new().inherit_stdio().build_p1();

    let mut store = Store::new(&engine, wasi_ctx);
    let module = Module::from_binary(store.engine(), program)?;
    let instance = linker.instantiate(&mut store, &module)?;

    let start_function = instance.get_typed_func::<(), ()>(&mut store, "_start")?;

    let start_time = Instant::now();
    start_function.call(&mut store, ())?;
    Ok(Instant::now() - start_time)*/

    let mut config = Config::default();
    config.cranelift_opt_level(wasmtime::OptLevel::SpeedAndSize);

    let engine = Engine::new(&config)?;
    let module = Module::from_binary(&engine, program)?;
    let mut store = Store::new(&engine, ());
    let instance = Instance::new(&mut store, &module, &[]).unwrap();
    let start_function = instance.get_typed_func::<(), ()>(&mut store, "_start")?;

    let start_time = Instant::now();
    start_function.call(&mut store, ())?;
    Ok(start_time.elapsed())
}

pub fn execute_on_wizard(program: &[u8]) -> Result<Duration> {
    let temp_file = Builder::new().suffix(".wasm").tempfile()?;
    let temp_path = temp_file.path().to_str().expect("Invalid temp path");
    fs::write(temp_path, program)?;

    let output = Command::new("wizeng")
        .arg("--metrics")
        .arg("--ext:multi-memory")
        .arg(temp_path)
        .output()?;
    get_wizard_runtime_from_output(output)
}

/*
pub fn execute_on_wasmer_cli(program: &[u8]) -> Result<Duration> {
    let temp_file = Builder::new().suffix(".wasm").tempfile()?;
    let temp_path = temp_file.path().to_str().expect("Invalid temp path");
    fs::write(temp_path, program)?;

    let start_time = Instant::now();
    Command::new("wasmer")
        .arg("run")
        .arg(temp_path)
        .arg("--enable-multi-memory")
        .status()?;
    Ok(start_time.elapsed())
}*/

pub fn execute_on_wasmer(input_program: &[u8]) -> anyhow::Result<Duration> {
    let engine = wasmer::Engine::default();
    let module = wasmer::Module::from_binary(&engine, input_program)?;
    let mut store = wasmer::Store::new(engine);
    let imports = wasmer::Imports::new();
    let instance = wasmer::Instance::new(&mut store, &module, &imports)?;
    let start = instance.exports.get_function("_start")?;
    let start_time = std::time::Instant::now();
    start.call(&mut store, &[])?;
    Ok(start_time.elapsed())
}

pub fn run_bench(
    platform: &str,
    program_name: &str,
    program: &[u8],
    analysis_name: &str,
    instrumentation: &str,
    run: u32,
    path_height: u32,
) -> BenchmarkResult {
    let result = match platform {
        "wizard" => execute_on_wizard(program),
        "wasmtime" => execute_on_wasmtime(program),
        "wasmer" => execute_on_wasmer(program),
        _ => Err(anyhow!("Unkown execution platform: {}", platform)),
    };

    match result {
        Ok(success) => BenchmarkResult {
            duration_ms: success.as_millis(),
            duration_ns: success.as_nanos(),
            program_name: program_name.to_string(),
            instrumentation: instrumentation.to_string(),
            analysis_name: analysis_name.to_string(),
            run,
            path_height,
            error: "".to_string(),
            platform: platform.to_string(),
        },
        Err(err) => BenchmarkResult {
            duration_ms: 0,
            duration_ns: 0,
            program_name: program_name.to_string(),
            instrumentation: instrumentation.to_string(),
            analysis_name: analysis_name.to_string(),
            run,
            path_height,
            error: err.to_string(),
            platform: platform.to_string(),
        },
    }
}

pub fn load_programs() -> io::Result<Vec<PathBuf>> {
    let mut paths = fs::read_dir(PROGRAM_DIR)?
        .map(|entry| entry.map(|entry| entry.path()))
        .filter(|path| {
            let p = path.as_ref().unwrap();
            p.is_file()
                // && PROGRAMS.contains(&p.file_stem().unwrap().to_str().unwrap())
                && p.file_stem().unwrap().to_str().unwrap() != "boa"
                && p.extension().unwrap() == "wasm"
        })
        .collect::<io::Result<Vec<_>>>()?;
    paths.sort();

    Ok(paths)
}

pub fn load_analyses() -> io::Result<Vec<PathBuf>> {
    let mut paths = fs::read_dir(ANALYSES_DIR)?
        .map(|entry| entry.map(|entry| entry.path()))
        .filter(|path| {
            let p = path.as_ref().unwrap();
            ANALYSES.contains(&p.file_name().unwrap().to_str().unwrap()) && p.is_dir()
        })
        .collect::<io::Result<Vec<_>>>()?;

    paths.sort();
    Ok(paths)
}

pub fn instrument(
    input_program: &[u8],
    analysis: &str,
    disable: bool,
    path_height: u32,
) -> Result<Vec<u8>> {
    let analysis_hooks: HashMap<&'static str, (&str, HashSet<Hook>)> = HashMap::from([
        (
            "generic-apply",
            (
                "rust_generic_apply_analysis",
                HashSet::from([Hook::GenericApply]),
            ),
        ),
        ("forward", ("rust_all_hooks_analysis", Hook::all_hooks())),
        (
            "forward-on-off",
            ("rust_all_hooks_analysis_on_off", Hook::all_hooks()),
        ),
    ]);
    let (_file_name, hooks) = analysis_hooks.get(analysis).unwrap();

    let in_comp = Box::new(Compiler);
    let an_comp = Box::new(Compiler);

    let wastrumenter = Wastrumenter::new(in_comp, an_comp);
    let analysis_file = format!(
        "/Users/charles/Documents/wastrumentation/wastrumentation-instr-lib/tests/analyses/rust/{analysis}/target/wasm32-unknown-unknown/release/{analysis}.wasm"
    );
    let forward_analysis = fs::read(&analysis_file).unwrap();

    let analysis = WasmAnalysisSpec {
        source: WebAssemblySource::Module(forward_analysis),
        hooks: hooks.clone(),
    }
    .into();

    let configuration = Configuration {
        target_indices: None,
        primary_selection: None,
        start_disabled: disable,
        path_height: Some(path_height),
    };

    let instrumented = wastrumenter
        .wastrument(input_program, analysis, &configuration)
        .map_err(|e| anyhow::format_err!("{e:?}"))?;

    Ok(instrumented)
}

pub fn get_wizard_runtime_from_output(process_output: Output) -> Result<Duration> {
    let output = str::from_utf8(&process_output.stdout)?;
    let time = output
        .lines()
        .find(|line| line.starts_with("main:time_us"))
        .expect("wrong wizard metrics");
    let duration = time
        .split(":")
        .nth(2)
        .unwrap()
        .split_whitespace()
        .next()
        .unwrap()
        .parse::<u64>()
        .ok()
        .unwrap();
    Ok(Duration::from_micros(duration))
}

#[allow(unused)]
fn test_parse_wizard_metrics() {
    use std::str;

    let output_wizard = Command::new("wizeng")
        .arg("--metrics")
        .arg("--ext:multi-memory")
        .arg("input-programs/wasm-r3-bench/factorial.wasm")
        .output()
        .unwrap();
    let output = str::from_utf8(&output_wizard.stdout).unwrap_or("error");
    let _line = output
        .lines()
        .find(|line| line.starts_with("main:time_us"))
        .map(|line| {
            let a = line
                .split(":")
                .nth(2)
                .unwrap()
                .split_whitespace()
                .next()
                .unwrap()
                .parse::<u64>()
                .ok()
                .unwrap();
            println!("a: {}", a);
            Duration::from_micros(a)
        });
}
