use std::{
    ffi::OsStr, 
    io, 
    fs,
    time::{Duration, Instant},
    process::Command,
    num::NonZeroUsize,
    collections::{HashMap, HashSet},
    path::{PathBuf, absolute}
};

use tempfile::Builder;
use serde::{Deserialize, Serialize};
use anyhow::{Result, anyhow};

use wastrumentation_lang_assemblyscript::compile::compiler::Compiler as ASCompiler;
use wastrumentation_lang_rust::compile::{compiler::Compiler, options::RustSource::Manifest};
use wastrumentation_lang_rust::generate::analysis::Hook;
use wastrumentation_lang_rust::generate::analysis::RustAnalysisSpec;
use rust_to_wasm_compiler::WasiSupport;
use wastrumentation::{
    Configuration,
    PrimaryTarget::{self},
    Wastrumenter,
    compiler::Compiles,
};

// Wasmtime imports
use wasmtime::{Config, Engine, Linker, Module, Store};
use wasmtime_wasi::WasiCtxBuilder;
use wasmtime_wasi::p1::{self as preview1, WasiP1Ctx};

pub static PROGRAM_DIR: &str = "input-programs/wasm-r3-bench";
pub static ANALYSES_DIR: &str = "input-analyses/";


#[derive(Debug, Deserialize, Serialize)]
pub struct BenchmarkResult {
    pub duration_ms: u128,
    pub duration_ns: u128,
    pub program_name: String,
    pub instrumentation: String,
    pub analysis_name: String,
    pub run: u32,
    pub error: String,
    pub platform: String,
}

#[derive(Debug, Deserialize, Serialize)]
pub struct SizeResult {
    pub bytes: u32,
    pub program_name: String,
    pub instrumentation: String,
    pub analysis_name: String,
    pub error: String,
}

pub fn execute_on_wasmtime(program: &[u8]) -> Result<Duration> {
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

    let start_time = Instant::now();
    start_function.call(&mut store, ())?;
    Ok(Instant::now() - start_time)
}

pub fn execute_on_wizard(program: &[u8]) -> Result<Duration> {
    

    let temp_file = Builder::new().suffix(".wasm").tempfile()?;
    let temp_path = temp_file.path().to_str().expect("Invalid temp path");

    fs::write(temp_path, program)?;

    let start_time = Instant::now();

    let status = Command::new("wizeng")
        .arg(temp_path)
        .status()?;

    let duration = start_time.elapsed();
    if status.success() {
        Ok(duration)
    } else {
        panic!()
    }
}

pub fn run_bench(platform: &str, program_name: &str,  program: &[u8], analysis_name: &str, instrumentation: &str, run: u32) -> BenchmarkResult {
    let result: Result<Duration>;

    match platform {
        "wizard" => result = execute_on_wizard(program),
        "wasmtime" => result = execute_on_wasmtime(program),
        _ => result = Err(anyhow!("Unkown execution platform: {}", platform))
    }

    match result {
        Ok(success) => {
            BenchmarkResult {
                duration_ms: success.as_millis(),
                duration_ns: success.as_nanos(),
                program_name: program_name.to_string(),
                instrumentation: instrumentation.to_string(),
                analysis_name: analysis_name.to_string(),
                run: run,
                error: "".to_string(),
                platform: platform.to_string(),
            }
        }
        Err(err) => {
            BenchmarkResult {
                duration_ms: 0,
                duration_ns: 0,
                program_name: program_name.to_string(),
                instrumentation: instrumentation.to_string(),
                analysis_name: analysis_name.to_string(),
                run: run,
                error: err.to_string(),
                platform: platform.to_string(),
            }
        }
    }
}

pub fn load_programs() -> io::Result<Vec<PathBuf>> {
    let mut paths = fs::read_dir(PROGRAM_DIR)?
        .map(|entry| entry.map(|entry| entry.path()))
        .filter(|path| {
            let p = path.as_ref().unwrap();
            p.is_file()
                && (
                    p.file_name() == Some(OsStr::new("factorial.wasm"))
                        || p.file_name() == Some(OsStr::new("game-of-life.wasm"))
                        //|| p.file_name() == Some(OsStr::new("ffmpeg.wasm"))
                )
                && p.extension().and_then(|ext| ext.to_str()) == Some("wasm")
        })
        .collect::<io::Result<Vec<_>>>()?;

    paths.sort();
    Ok(paths)
}

pub fn load_analyses() -> io::Result<Vec<PathBuf>> {
    let mut paths = fs::read_dir(ANALYSES_DIR)?
        .map(|entry| entry.map(|entry| entry.path()))
        .filter(|path| path.as_ref().unwrap().is_dir())
        .collect::<io::Result<Vec<_>>>()?;

    paths.sort();
    Ok(paths)
}

pub fn instrument(input_program: &[u8], analysis: &str, disable: bool) -> Result<Vec<u8>> {
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
        start_disabled: disable,
    };

    let wastrumenter = Wastrumenter::new(instrumentation_compiler.into(), analysis_compiler.into());
    let wastrumented = wastrumenter
        .wastrument(input_program, analysis, &configuration)
        .map_err(|error| anyhow!("Wastrumentation failed: {error:?}"))?;
    Ok(wastrumented)
}
