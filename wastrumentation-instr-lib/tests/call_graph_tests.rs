#![allow(dead_code)]
// Rust STD
use std::path::absolute;

// use indoc::formatdoc;
// Wastrumentation imports
use rust_to_wasm_compiler::WasiSupport;
use wastrumentation::{compiler::Compiles, Configuration, PrimaryTarget, Wastrumenter};
use wastrumentation_lang_assemblyscript::compile::compiler::Compiler as ASCompiler;
// use wastrumentation_lang_rust::compile::options::{ManifestSource, RustSource, RustSourceCode};
use wastrumentation_lang_rust::compile::{compiler::Compiler, options::RustSource::Manifest};
use wastrumentation_lang_rust::generate::analysis::Hook;
use wastrumentation_lang_rust::generate::analysis::RustAnalysisSpec;

// Wasmtime imports
use wasmtime::{Config, Engine, Linker, Module, Store};
use wasmtime_wasi::p1::{self as preview1, WasiP1Ctx};
use wasmtime_wasi::WasiCtxBuilder;

// Bring macros in scope
mod wasmtime_macros;

use wat::parse_str as wat2wasm;

#[test]
fn test_check_functions_modified() {
    let inpurt_program_source: &str = r#"
        (module
            (export "a" (func $a))
            (func $a call $b) ;; 0
            (func $b call $c) ;; 1
            (func $c call $d) ;; 2
            (func $d call $e) ;; 3
            (func $e ) ;; 4
        )"#;

    let input_program = wat2wasm(inpurt_program_source).unwrap();

    let analysis_compiler = Compiler::setup_compiler().expect("Setup Rust compiler");
    let instrumentation_compiler =
        ASCompiler::setup_compiler().expect("Setup AssemblyScript compiler");

    const PATH_INPUT_ANLYSIS: &str =
        "./tests/analyses/rust/function-toggle/count-apply-hooks/Cargo.toml";
    let source = Manifest(WasiSupport::Enabled, absolute(PATH_INPUT_ANLYSIS).unwrap());
    let hooks = vec![Hook::GenericApply].into_iter().collect();
    let analysis = RustAnalysisSpec { source, hooks }.into();

    let configuration = Configuration {
        target_indices: None,
        primary_selection: Some(PrimaryTarget::Analysis),
        start_disabled: false,
        path_height: Some(2),
    };

    let wastrumenter = Wastrumenter::new(instrumentation_compiler.into(), analysis_compiler.into());
    let wastrumented = wastrumenter
        .wastrument(&input_program, analysis, &configuration)
        .expect("Wastrumentation should succeed");

    /////////////////////
    // WASMTIME ENGINE //
    /////////////////////

    let stdout = wasmtime_wasi::p2::pipe::MemoryOutputPipe::new(usize::MAX);
    let stderr = wasmtime_wasi::p2::pipe::MemoryOutputPipe::new(usize::MAX);

    // Construct the wasm engine
    let mut config = Config::new();
    config
        .wasm_backtrace(true)
        .wasm_backtrace_details(wasmtime::WasmBacktraceDetails::Enable);
    let engine = Engine::new(&config).unwrap();

    // Add the WASI preview1 API to the linker (will be implemented in terms of the preview2 API)
    let mut linker: Linker<WasiP1Ctx> = Linker::new(&engine);
    preview1::add_to_linker_sync(&mut linker, |t| t).unwrap();

    // Add capabilities (e.g. filesystem access) to the WASI preview2 context here.
    // Here only stdio is inherited, but see docs of `WasiCtxBuilder` for more.
    let wasi_ctx = WasiCtxBuilder::new()
        .stdout(stdout.clone())
        .stderr(stderr.clone())
        .build_p1();

    let mut store = Store::new(&engine, wasi_ctx);

    // Note: This is a module built against the preview1 WASI API.
    let module = Module::from_binary(&engine, &wastrumented).unwrap();

    linker.module(&mut store, "main", &module).unwrap();

    declare_fns_from_linker! { linker, store, "main",
        a [] [],
    };

    // Test caller enabled and callee disabled
    wasm_call! {store, a};
    // assert_eq!((wasm_call!(store, f)), 45);
}
