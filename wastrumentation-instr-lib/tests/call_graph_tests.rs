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
use wasmtime::{Config, Engine, Extern, Linker, Module, Store};
use wasmtime_wasi::p1::{self as preview1, WasiP1Ctx};
use wasmtime_wasi::WasiCtxBuilder;

// Bring macros in scope
mod wasmtime_macros;

use wat::parse_str as wat2wasm;

fn read_i32<T: wasmtime::AsContext>(memory: &wasmtime::Memory, store: &T, address: usize) -> i32 {
    let mut bytes = [0u8; 4];
    memory.read(store, address, &mut bytes).unwrap();
    i32::from_le_bytes(bytes)
}

fn read_u8<T: wasmtime::AsContext>(memory: &wasmtime::Memory, store: &T, address: usize) -> u8 {
    let mut bytes = [0u8];
    memory.read(store, address, &mut bytes).unwrap();
    u8::from_le_bytes(bytes)
}

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

    const PATH_INPUT_ANLYSIS: &str = "./tests/analyses/rust/forward/Cargo.toml";
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

    // std::fs::write("debug.wasm", &wastrumented).unwrap();

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
        set_f_instrumentation [i32, i32] [],
    };

    let counter_memory = match linker.get(&mut store, "main", "counter_memory") {
        Some(Extern::Memory(memory)) => memory,
        _ => panic!("Could not find exported lookup memory"),
    };
    let entry_memory = match linker.get(&mut store, "main", "path_memory") {
        Some(Extern::Memory(memory)) => memory,
        _ => panic!("Could not find exported lookup memory"),
    };
    let flag_memory = match linker.get(&mut store, "main", "flag_memory") {
        Some(Extern::Memory(memory)) => memory,
        _ => panic!("Could not find exported lookup memory"),
    };

    let initial_value = read_i32(&counter_memory, &store, 2);
    println!("Lookup entry 2 before call: {initial_value}");

    // Test caller enabled and callee disabled.
    wasm_call! {store, a};

    // Inspect it again after execution.

    let final_value = read_i32(&counter_memory, &store, 2);
    println!("Lookup entry 2 after call: {final_value}");

    // The lookup table should be immutable at runtime.
    assert_eq!(initial_value, final_value);

    for i in 0..5 {
        let value = read_i32(&counter_memory, &store, i * 4);
        let entry = read_i32(&entry_memory, &store, i * 4);
        let flag = read_u8(&flag_memory, &store, i);
        println!(
            "{i} ({}): counter {value}, entry {entry}",
            if flag == 1 { "on" } else { "off" }
        );
        if i == 2 {
            assert_eq!(value, 3);
        } else {
            assert_eq!(value, 0);
        }
        assert_eq!(flag, 1);
    }

    wasm_call! {store, set_f_instrumentation, 3, 0};

    println!("==== turn off func idx 3");

    for i in 0..5 {
        let value = read_i32(&counter_memory, &store, i * 4);
        let entry = read_i32(&entry_memory, &store, i * 4);
        let flag = read_u8(&flag_memory, &store, i);
        println!(
            "{i} ({}): counter {value}, entry {entry}",
            if flag == 1 { "on" } else { "off" }
        );
        if i == 2 {
            assert_eq!(value, 2);
        } else {
            assert_eq!(value, 0);
        }
        if i == 3 {
            assert_eq!(flag, 0);
        } else {
            assert_eq!(flag, 1);
        }
    }

    wasm_call! {store, set_f_instrumentation, 3, 0};

    println!("==== turn off func idx 3 again");

    for i in 0..5 {
        let value = read_i32(&counter_memory, &store, i * 4);
        let entry = read_i32(&entry_memory, &store, i * 4);
        let flag = read_u8(&flag_memory, &store, i);
        println!(
            "{i} ({}): counter {value}, entry {entry}",
            if flag == 1 { "on" } else { "off" }
        );
        if i == 2 {
            assert_eq!(value, 2);
        } else {
            assert_eq!(value, 0);
        }
        if i == 3 {
            assert_eq!(flag, 0);
        } else {
            assert_eq!(flag, 1);
        }
    }
}
