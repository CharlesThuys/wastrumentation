use std::alloc::{GlobalAlloc};
use std::path::absolute;

use indoc::formatdoc;
// Wastrumentation imports
use rust_to_wasm_compiler::{Profile, WasiSupport};
use std::collections::HashMap;

use wastrumentation::{compiler::Compiles, Configuration, PrimaryTarget, Wastrumenter};
use wastrumentation_lang_assemblyscript::compile::compiler::Compiler as ASCompiler;
use wastrumentation_lang_rust::compile::options::{ManifestSource, RustSource, RustSourceCode};
use wastrumentation_lang_rust::compile::{compiler::Compiler, options::RustSource::Manifest};
//use wastrumentation_lang_rust::generate::analysis::Hook;
//use wastrumentation_lang_rust::generate::analysis::RustAnalysisSpec;

// Wasmtime imports
use wasmtime::{Cache, Config, Engine, Instance, Linker, Module, Store};
use wasmtime_wasi::p1::{self as preview1, WasiP1Ctx};
use wasmtime_wasi::WasiCtxBuilder;

// Bring macros in scope
mod wasmtime_macros;

mod integration_util;
use integration_util::*;

//use wat::parse_str as wat2wasm;
//use wat::parse_bytes as wasm2wat;  

use wasabi_wasm::{Element, GlobalType, LoadOp, Local, LocalOp, Memarg, Memory, StoreOp};
use wasabi_wasm::FunctionType;
use wasabi_wasm::ImportOrPresent;
use wasabi_wasm::Module as M2;
use wasabi_wasm::Mutability;
use wasabi_wasm::ValType;
use wasabi_wasm::Val;
use wasabi_wasm::Instr;
use wasabi_wasm::ElementMode;
use wasabi_wasm::Idx;
use wasabi_wasm::Expr;
use wasabi_wasm::RefType;
use wasabi_wasm::Limits;
use wasabi_wasm::Table;
use wasabi_wasm::Function;
use wasabi_wasm::GlobalOp;
use wasabi_wasm::BinaryOp;
use wasabi_wasm::Instr::{Call, CallIndirect, Const, End, RefFunc, Global, Binary};
use wasabi_wasm::DataMode;
use wasabi_wasm::Data;
use wastrumentation::error::InstrumentationError;


use wat::parse_str as wat2wasm;

const INPUT: &str = r#"
#[no_mangle]
pub extern "C" fn g () -> i32 {
    let mut a = 0;
    for i in 0..1000 {
        a = f(a, i);
    }
    return a;
}

#[no_mangle]
#[inline(never)]
pub extern "C" fn f(b: i32, c: i32) -> i32 {
    return b + c;
}
"#;

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

#[test]
fn instrument_test() -> Result<(),  wastrumentation::error::InstrumentationError> {


    // const SOURCE: Source = Source::Rust(INPUT, WasiSupport::Disabled, Profile::Release);

    // let rust_input_program = SOURCE.to_input_program();

    let wat_input_program = wat2wasm(INPUT_WAT).unwrap();
    
    println!("input program:");
    println!("{:?}", wat_input_program);

    let (mut module, _offsets, _issue) = M2::from_bytes(&wat_input_program).map_err(InstrumentationError::ParseModuleError)?;
    
    // Create HashMap <Original index , New index>
    let mut additional_functions = HashMap::new();

    // Get the amount of functions
    let original_function_count = module.functions.len();

    // Get the indexes
    let original_idxs: Vec<Idx<Function>> = module.functions().map(|(idx , _f)| idx ).collect();

    // Copy the f function and change Add to Sub Instruction
    for f_idx in original_idxs.clone() {
        println!("function index: {}", f_idx.to_u32());
        let original_function = module.function(f_idx);
        if original_function.export.contains(&"f".to_string()) {
            let new_function = original_function.clone();
            let f_type = new_function.type_;
            let f_code = new_function.code().unwrap();
            let f_locals = f_code.locals.iter().map(| local| local.type_).collect();
            let f_body = f_code.body.iter().map(| instr| 
                match instr {
                    Binary(BinaryOp::I32Add) => { Binary(BinaryOp::I32Sub) }
                    _ => { instr.clone() }
                }).collect();
            let new_idx = module.add_function(f_type, f_locals, f_body);
            additional_functions.insert(f_idx, new_idx);
        } else {
            additional_functions.insert(f_idx, f_idx);
        }
    }

    // Generate new table
    let table_idx = module.tables.len();

    module.tables.push(Table {
        limits: Limits {
            initial_size: (original_function_count * 2) as u32,
            max_size: None,
        },
        import: None,
        ref_type: RefType::FuncRef,
        export: vec![],
    });

    let table_funs_refs: Vec<Vec<Instr>> = original_idxs
        .into_iter().flat_map(|idx| {
            let instr_idx = *additional_functions.get(&idx).or(Some(&idx)).unwrap();
            return [vec![RefFunc(idx), End], vec![RefFunc(instr_idx), End]];
        } ).collect();

    module.elements.push(Element {
        typ: RefType::FuncRef,
        init: table_funs_refs,
        mode: ElementMode::Active {
            table: table_idx.into(),
            offset: vec![Const(Val::I32(0)), End],
        },
    });

    let global_index = module.add_global(ValType::I32, Mutability::Mut, vec![Instr::Const(Val::I32(0)), Instr::End]);

    println!("memory: {:?}", module.memories);


    println!("data: {:?}", module.datas);
    
    if module.memories.is_empty() {
        let memory = Memory::new(Limits { initial_size: original_function_count as u32, max_size: None});
        let mem_idx = Idx::<Memory>::from(module.memories.len());

        module.memories.push(memory);

        module.datas.push(Data {
            init: vec![1; original_function_count],
            mode: DataMode::Active { memory: mem_idx, offset: vec![Const(Val::I32(0)), End], },
        });
    } else {
        let (mem_idx,  memory) = module.memories().last().unwrap();
        let mut new_memory = memory.clone();
        new_memory.limits = Limits { initial_size: memory.limits.initial_size + (original_function_count as u32), max_size: None };
        module.memories[0] = new_memory;

        module.datas.push(Data {
            init: vec![1; original_function_count],
            mode: DataMode::Active { memory: mem_idx, offset: vec![Const(Val::I32(0)), End], },
        });
        // TODO: Expand memory size
    }

    println!("memory: {:?}", module.memories);
   
    println!("data: {:?}", module.datas);

    // Try to modify main
    module.functions_mut().for_each(|(_index, f)| {  
        if f.export.contains(&"g".to_owned()) {
            let mut_code = f.code_mut().unwrap();
            let mut new_body = Vec::new();
            for instr in mut_code.body.iter() {
                match instr {
                    Call(index) => {
                        // BASE IDX IN TABLE
                        new_body.push(Const(Val::I32(index.to_u32() as i32 * 2)));
                        // FLAG MEMORY INDEX
                        new_body.push(Const(Val::I32(index.to_u32() as i32)));
                        // LOAD FLAG VALUE
                        new_body.push(Instr::Load(LoadOp::I32Load8U, Memarg::default(LoadOp::I32Load8U)));
                        // ADD FLAG TO BASE IDX
                        new_body.push(Binary(BinaryOp::I32Add));
                        // CALL INDIRECT FROM TABLE
                        new_body.push(CallIndirect(
                            FunctionType::new(&[ValType::I32, ValType::I32], &[ValType::I32]),
                            table_idx.into(),
                        ));

                        // Perform XOR operation to toggle between the functions
                        // BASE IDX IN TABLE
                        new_body.push(Const(Val::I32(index.to_u32() as i32 * 2)));
                        // BASE IDX IN TABLE
                        new_body.push(Const(Val::I32(index.to_u32() as i32 * 2)));
                        // LOAD FLAG VALUE
                        new_body.push(Instr::Load(LoadOp::I32Load8U, Memarg::default(LoadOp::I32Load8U)));
                        // PERFORM BITWISE OPERATION
                        new_body.push(Const(Val::I32(1)));
                        new_body.push(Binary(BinaryOp::I32Xor));
                        // STORE THE VALUE BACK
                        new_body.push(Instr::Store(StoreOp::I32Store8, Memarg::default(StoreOp::I32Store8)));
                        
                        continue;
                    }
                    _ => {
                        new_body.push(instr.clone());
                    }
                }
            }

            mut_code.body = new_body;
            // f.code_mut().unwrap().body = new_body;
        }
    });

    
    let instrumented_program = module.to_bytes().unwrap();

    let _ = module.to_file("instrumented.wasm");

    println!("module after instrumentation:");

    println!("{:?}", instrumented_program);

    let stdout = wasmtime_wasi::p2::pipe::MemoryOutputPipe::new(usize::MAX);
    let stderr = wasmtime_wasi::p2::pipe::MemoryOutputPipe::new(usize::MAX);

    // Construct the wasm engine
    let engine = Engine::default();

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

    let module = Module::from_binary(&engine, &instrumented_program).unwrap();

    linker.module(&mut store, "main", &module).unwrap();

    // Get & invoke function
    declare_fns_from_linker! {linker, store, "main", g [] [i32]}


    assert_eq!(wasm_call!(store, g, ()), 500);


    // let instrument_f: () = module.globals.push(wasabi_wasm::Global::new(GlobalType(ValType::I32, Mutability::Mut), vec![Const(Val::I32(0))])); 
    Ok(())
}