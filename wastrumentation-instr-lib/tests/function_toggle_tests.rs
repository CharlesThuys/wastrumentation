#![allow(dead_code)]
// Rust STD
use std::path::absolute;

// use indoc::formatdoc;
// Wastrumentation imports
use rust_to_wasm_compiler::{Profile, WasiSupport};
use wastrumentation::{compiler::Compiles, Configuration, PrimaryTarget, Wastrumenter};
use wastrumentation_lang_assemblyscript::compile::compiler::Compiler as ASCompiler;
// use wastrumentation_lang_rust::compile::options::{ManifestSource, RustSource, RustSourceCode};
use wastrumentation_lang_rust::compile::{compiler::Compiler, options::RustSource::Manifest};
use wastrumentation_lang_rust::generate::analysis::Hook;
use wastrumentation_lang_rust::generate::analysis::RustAnalysisSpec;

// Wasmtime imports
use wasmtime::{Config, Engine, Instance, Linker, Module, Store};
use wasmtime_wasi::p1::{self as preview1, WasiP1Ctx};
use wasmtime_wasi::WasiCtxBuilder;

// Bring macros in scope
mod wasmtime_macros;

mod integration_util;
use integration_util::*;

use wat::parse_str as wat2wasm;

const INPUT_WAT: &str = r#"
(module
 (type $0 (func (param i32 i32) (result i32)))
 (type $1 (func (result i32)))
 (memory $0 0)
 (export "g" (func $module/g))
 (export "f" (func $module/f))
 (export "memory" (memory $0))
 (func $module/f (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  local.get $1
  i32.add
 )
 (func $module/g (result i32)
  (local $0 i32)
  (local $1 i32)
  loop $for-loop|0
   local.get $0
   i32.const 1000
   i32.lt_s
   if
    local.get $1
    local.get $0
    call $module/f
    local.set $1
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $for-loop|0
   end
  end
  local.get $1
 )
)
"#;

const SECOND_INPUT: &str = r#"
(module
 (type $0 (func (param i32 i32) (result i32)))
 (memory $0 0)
 (export "add" (func $module/add))
 (export "mul" (func $module/mul))
 (export "memory" (memory $0))
 (func $module/mul (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  local.get $1
  i32.mul
 )
 (func $module/add (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.const 8
  i32.gt_s
  if (result i32)
   local.get $0
   local.get $1
   i32.add
  else
   local.get $0
   local.get $1
   call $module/mul
  end
 )
)
"#;

#[test]
fn test_toggle_and_preserve_result() {
    const INPUT_PROGRAM_SOURCE: &str = r#"
    #[no_mangle] pub extern "C" fn f(a: i32, b: i32) -> i32 { a + b }
    #[no_mangle] pub extern "C" fn g() -> i32 { 45 }
    "#;

    const SOURCE: Source = Source::Rust(
        INPUT_PROGRAM_SOURCE,
        WasiSupport::Disabled,
        Profile::Release,
    );

    /////////////
    // COMPILE //
    /////////////
    let input_program = SOURCE.to_input_program();

    let mut store = Store::<()>::default();
    let module = Module::from_binary(store.engine(), &input_program).unwrap();
    let instance = Instance::new(&mut store, &module, &[]).unwrap();

    declare_fns_from_wasm! {instance, store,
        f [i32, i32] [i32],
        g [] [i32],
    };

    // CHECK uninstrumented
    assert_eq!(wasm_call! {store, f, 40, 7}, 47);
    assert_eq!(wasm_call! {store, g}, 45);

    ////////////////
    // INSTRUMENT //
    ////////////////
    let analysis_compiler = Compiler::setup_compiler().expect("Setup Rust compiler");
    let instrumentation_compiler =
        ASCompiler::setup_compiler().expect("Setup AssemblyScript compiler");

    const PATH_INPUT_ANLYSIS: &str =
        "./tests/analyses/rust/function-toggle/toggle-instrumentation/Cargo.toml";
    let source = Manifest(WasiSupport::Enabled, absolute(PATH_INPUT_ANLYSIS).unwrap());
    let hooks = vec![Hook::GenericApply].into_iter().collect();
    let analysis = RustAnalysisSpec { source, hooks }.into();

    let configuration = Configuration {
        target_indices: None,
        primary_selection: Some(PrimaryTarget::Analysis),
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
        f [i32, i32] [i32],
        g [] [i32],
        get_apply_count [] [i32],
        get_function_apply_count [i32] [i32],
    };

    assert_eq!(wasm_call! {store, get_apply_count}, 0);
    assert_eq!(wasm_call! {store, get_function_apply_count, 0}, 0);
    assert_eq!(wasm_call! {store, f, 40, 7}, 47);
    assert_eq!(wasm_call! {store, get_apply_count}, 1);
    assert_eq!(wasm_call! {store, get_function_apply_count, 0}, 1);
    assert_eq!(wasm_call! {store, f, 40, 7}, 47);
    assert_eq!(wasm_call! {store, get_apply_count}, 1);
    assert_eq!(wasm_call! {store, get_function_apply_count, 0}, 1);

    assert_eq!(wasm_call! {store, get_function_apply_count, 1}, 0);
    assert_eq!(wasm_call! {store, g}, 45);
    assert_eq!(wasm_call! {store, get_apply_count}, 2);
    assert_eq!(wasm_call! {store, get_function_apply_count, 1}, 1);
    assert_eq!(wasm_call! {store, g}, 45);
    assert_eq!(wasm_call! {store, get_apply_count}, 2);
    assert_eq!(wasm_call! {store, get_function_apply_count, 1}, 1);
}

#[test]
fn test_hooks_suppressed() {
    const INPUT_PROGRAM_SOURCE: &str = r#"
    (module
        (memory $0 0)
        (export "f" (func $module/f))
        (export "g" (func $module/g))
        (func $module/f (result i32)
            i32.const 40
            i32.const 7
            i32.add
        )
        (func $module/g (result i32)
            i32.const 40
            i32.const 5
            i32.add
        )
    )
    "#;

    let input_program = wat2wasm(INPUT_PROGRAM_SOURCE).unwrap();

    ////////////////
    // INSTRUMENT //
    ////////////////
    let analysis_compiler = Compiler::setup_compiler().expect("Setup Rust compiler");
    let instrumentation_compiler =
        ASCompiler::setup_compiler().expect("Setup AssemblyScript compiler");

    const PATH_INPUT_ANLYSIS: &str =
        "./tests/analyses/rust/function-toggle/toggle-instrumentation/Cargo.toml";
    let source = Manifest(WasiSupport::Enabled, absolute(PATH_INPUT_ANLYSIS).unwrap());
    let hooks = vec![Hook::GenericApply, Hook::Binary].into_iter().collect();
    let analysis = RustAnalysisSpec { source, hooks }.into();

    let configuration = Configuration {
        target_indices: None,
        primary_selection: Some(PrimaryTarget::Analysis),
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
        f [] [i32],
        g [] [i32],
        get_binary_count [] [i32],
    };

    assert_eq!(wasm_call! {store, get_binary_count}, 0);
    assert_eq!(wasm_call! {store, f}, 47);
    assert_eq!(wasm_call! {store, get_binary_count}, 1);
    assert_eq!(wasm_call! {store, f}, 47);
    assert_eq!(wasm_call! {store, get_binary_count}, 1);

    assert_eq!(wasm_call! {store, get_binary_count}, 1);
    assert_eq!(wasm_call! {store, g}, 45);
    assert_eq!(wasm_call! {store, get_binary_count}, 2);
    assert_eq!(wasm_call! {store, g}, 45);
    assert_eq!(wasm_call! {store, get_binary_count}, 2);
}

#[test]
fn test_reenable_instrumentation() {
    const INPUT_PROGRAM_SOURCE: &str = r#"
    (module
        (memory $0 0)
        (export "f" (func $module/f))
        (export "g" (func $module/g))
        (func $module/f (result i32)
            i32.const 47
        )
        (func $module/g (result i32)
            i32.const 45
        )
    )
    "#;

    let input_program = wat2wasm(INPUT_PROGRAM_SOURCE).unwrap();

    ////////////////
    // INSTRUMENT //
    ////////////////
    let analysis_compiler = Compiler::setup_compiler().expect("Setup Rust compiler");
    let instrumentation_compiler =
        ASCompiler::setup_compiler().expect("Setup AssemblyScript compiler");

    const PATH_INPUT_ANLYSIS: &str =
        "./tests/analyses/rust/function-toggle/re-enable-instrumentation/Cargo.toml";
    let source = Manifest(WasiSupport::Enabled, absolute(PATH_INPUT_ANLYSIS).unwrap());
    let hooks = vec![Hook::GenericApply].into_iter().collect();
    let analysis = RustAnalysisSpec { source, hooks }.into();

    let configuration = Configuration {
        target_indices: None,
        primary_selection: Some(PrimaryTarget::Analysis),
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
        f [] [i32],
        g [] [i32],
        get_function_apply_count [i32] [i32],
    };

    // Run once and second time to confirm disabled
    assert_eq!(wasm_call! {store, get_function_apply_count, 0}, 0);
    assert_eq!(wasm_call! {store, f}, 47);
    assert_eq!(wasm_call! {store, get_function_apply_count, 0}, 1);
    assert_eq!(wasm_call! {store, f}, 47);
    assert_eq!(wasm_call! {store, get_function_apply_count, 0}, 1);

    // Run g and enable f again
    assert_eq!(wasm_call! {store, get_function_apply_count, 1}, 0);
    assert_eq!(wasm_call! {store, g}, 45);
    assert_eq!(wasm_call! {store, get_function_apply_count, 1}, 1);

    // Run f again and confirm it is enabled
    assert_eq!(wasm_call!(store, f), 47);
    assert_eq!(wasm_call! {store, get_function_apply_count, 0}, 2);
}

#[test]
fn test_toggled_nested_calls_independent() {
    const INPUT_PROGRAM_SOURCE: &str = r#"
    (module
        (memory $0 0)
        (export "g" (func $module/g))
        (export "f" (func $module/f))
        (func $module/g (result i32)
            i32.const 40
        )
        (func $module/f (result i32)
            call $module/g
            i32.const 5
            i32.add
        )
    )
    "#;

    let input_program = wat2wasm(INPUT_PROGRAM_SOURCE).unwrap();

    ////////////////
    // INSTRUMENT //
    ////////////////
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
        f [] [i32],
        g [] [i32],
        get_function_apply_count [i32] [i32],
        set_function_enabled [i32, i32] [],
    };

    // Test caller enabled and callee disabled
    wasm_call! {store, set_function_enabled, 0, 0};
    assert_eq!((wasm_call!(store, f)), 45);

    assert_eq!(wasm_call! {store, get_function_apply_count, 0}, 0); // Callee not instrumented
    assert_eq!(wasm_call! {store, get_function_apply_count, 1}, 1); // Caller instrumented

    // Test caller disabled and callee enabled
    wasm_call! {store, set_function_enabled, 0, 1};
    wasm_call! {store, set_function_enabled, 1, 0};
    assert_eq!((wasm_call!(store, f)), 45);

    assert_eq!(wasm_call! {store, get_function_apply_count, 0}, 1); // Callee instrumented
    assert_eq!(wasm_call! {store, get_function_apply_count, 1}, 1); // Caller not instrumented, stays at 2
}
