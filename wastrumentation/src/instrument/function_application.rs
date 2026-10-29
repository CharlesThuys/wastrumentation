use std::collections::HashMap;
use std::collections::HashSet;

use crate::compiler::{LibGeneratable, Library};
use crate::stack_library::StackLibrary;
use wasabi_wasm::BinaryOp;
use wasabi_wasm::ElementMode;
use wasabi_wasm::Function;
use wasabi_wasm::FunctionType;
use wasabi_wasm::Idx;
use wasabi_wasm::Instr;
use wasabi_wasm::Instr::{Call, CallIndirect, Const, End, Local, MemoryFill, RefFunc};
use wasabi_wasm::Limits;
use wasabi_wasm::LoadOp;
use wasabi_wasm::LocalOp;
use wasabi_wasm::Memarg;
use wasabi_wasm::Memory;
use wasabi_wasm::Module;
use wasabi_wasm::RefType;
use wasabi_wasm::StoreOp;
use wasabi_wasm::Table;
use wasabi_wasm::UnaryOp;
use wasabi_wasm::Val;
use wasabi_wasm::ValType;
use wasabi_wasm::{Code, Element, ImportOrPresent};

use crate::analysis::{WasmExport, WasmImport};

use super::FunctionTypeConvertible;

pub const INSTRUMENTATION_STACK_MODULE: &str = "wastrumentation_stack";
pub const INSTRUMENTATION_ANALYSIS_MODULE: &str = "WASTRUMENTATION_ANALYSIS";
pub const INSTRUMENTATION_INSTRUMENTED_MODULE: &str = "instrumented_input";

pub const CODE_IS_PRESENT: i32 = 0;
pub const CODE_IS_IMPORT: i32 = 1;

#[allow(clippy::too_many_lines)]
#[allow(clippy::too_many_arguments)]
pub fn instrument<InstrumentationLanguage: LibGeneratable>(
    module: &mut Module,
    pre_instrumentation_function_indices: &HashSet<Idx<Function>>,
    uninstrumented_function_indices: &HashMap<Idx<Function>, Idx<Function>>,
    wasp_exported_generic_apply_trap: &WasmExport,
    wasp_imported_generic_apply_base: &WasmImport,
    wasp_imported_set_f_instrumentation: &WasmImport,
    wasp_imported_set_instrumentation: &WasmImport,
    start_disabled: bool,
    fast_paths: &HashMap<u32, Vec<u32>>,
    clean_functions_indeces: &HashMap<Idx<Function>, Idx<Function>>,
    program_function_count: usize,
) -> Library<InstrumentationLanguage> {
    // 0. GENERATE GENERIC APPLY
    let generic_apply_index = module.add_function_import(
        wasp_exported_generic_apply_trap.as_function_type(),
        INSTRUMENTATION_ANALYSIS_MODULE.into(),
        wasp_exported_generic_apply_trap.name.to_string(),
    );

    // 1. GENERATE IMPORTS FOR INSTRUMENTATION STACK LIBRARY
    let StackLibrary {
        library,
        signature_import_links,
    } = StackLibrary::<InstrumentationLanguage>::from_module(
        module,
        pre_instrumentation_function_indices,
    );

    // 1 page = 65,536 bytes. Each function flag takes 1 byte.
    let required_pages_bytes = program_function_count.div_ceil(65536) as u32;
    let required_pages_u32 = program_function_count.div_ceil(65536 * 4) as u32;

    // Create new memory for flags
    let mut flag_memory = Memory::new(Limits {
        initial_size: required_pages_bytes,
        max_size: None,
    });
    flag_memory.export("flag_memory".to_string());
    // flag_memory.export("_flag_memory");
    let flag_memory_index = module.memories.len() as u32;
    module.memories.push(flag_memory);

    // Create new memory for counters
    let mut counter_memory = Memory::new(Limits {
        initial_size: required_pages_u32,
        max_size: None,
    });
    counter_memory.export("counter_memory".to_string());
    let counter_memory_index = module.memories.len() as u32;
    module.memories.push(counter_memory);

    // Create new memory for path entrances
    let mut path_memory = Memory::new(Limits {
        initial_size: required_pages_u32,
        max_size: None,
    });
    path_memory.export("path_memory".to_string());
    let path_memory_index = module.memories.len() as u32;
    module.memories.push(path_memory);

    // Memory with path entries:
    // Initialize path memory with -1 for every function
    let mut path_entries = vec![-1_i32; program_function_count];
    for (&entry, functions) in fast_paths {
        for &f_idx in functions {
            path_entries[f_idx as usize] = entry as i32;
        }
    }
    // Fill memory with path entries
    module.datas.push(wasabi_wasm::Data {
        init: path_entries
            .into_iter()
            .flat_map(i32::to_le_bytes)
            .collect(),
        mode: wasabi_wasm::DataMode::Active {
            memory: path_memory_index.into(),
            offset: vec![Const(Val::I32(0)), End],
        },
    });

    // Fix data count
    module.data_count = Some(module.datas.len() as u32);

    // 2. Generate function instrumentation functionality
    let apply_table_index = module.tables.len();
    let mut apply_table_funs = vec![];

    for function_index in pre_instrumentation_function_indices {
        let target_function_type = module.function(*function_index).type_;

        let stack_library_for_target = signature_import_links
            .get(&target_function_type)
            .expect("Imported");

        // 1. Generate "uninstrumented" function
        let target_code_is_present = module.function(*function_index).code().is_some();
        let uninstrumented_index = match &module.function(*function_index).code {
            wasabi_wasm::ImportOrPresent::Import(module_name, function_name) => module
                .add_function_import(
                    target_function_type,
                    module_name.to_string(),
                    function_name.to_string(),
                ),
            wasabi_wasm::ImportOrPresent::Present(code) => {
                let target_function_locals: Vec<ValType> = module
                    .function(*function_index)
                    .locals()
                    .map(|(_, l)| l.type_)
                    .collect();
                let target_function_body = code.body.clone();
                module.add_function(
                    target_function_type,
                    target_function_locals,
                    target_function_body,
                )
            }
        };

        // 2. Generate "base apply" function
        let signature_buffer_pointer_type = ValType::I32;
        let apply_type = FunctionType::new(&[signature_buffer_pointer_type], &[]);

        let local_get_stack_ptr = || Local(LocalOp::Get, Idx::from(0_usize));
        let call_base = Call(uninstrumented_index);
        let call_stack_store_rets: Instr = Call(stack_library_for_target.ret_store_all);

        let mut apply_instructions: Vec<Instr> = Vec::new();

        apply_instructions.push(local_get_stack_ptr());

        for load_call in &stack_library_for_target.arg_load_n {
            apply_instructions.push(local_get_stack_ptr());
            apply_instructions.push(Call(*load_call));
        }

        apply_instructions.extend_from_slice(&[call_base, call_stack_store_rets, End]);

        let apply_index = module.add_function(
            apply_type,
            vec![signature_buffer_pointer_type],
            apply_instructions,
        );

        let apply_table_index = apply_table_funs.len();
        apply_table_funs.push(apply_index);

        // 3. Change the original function to call into analysis apply
        let original_function = module.function_mut(*function_index);
        original_function.code = ImportOrPresent::Present(Code::new()); // clear out / install body
        let stack_ptr_local = original_function.add_fresh_local(ValType::I32);
        let stack_ptr_types_local = original_function.add_fresh_local(ValType::I32);

        let push_args_on_stack: Vec<Instr> = target_function_type
            .inputs()
            .iter()
            .enumerate()
            .map(|(index, _int_type)| Local(LocalOp::Get, index.into()))
            .collect();
        let call_allocate_values_buffer = Call(stack_library_for_target.allocate_values_buffer);
        let local_set_values_buffer_ptr = Local(LocalOp::Set, stack_ptr_local);
        let call_allocate_types_buffer = Call(stack_library_for_target.allocate_types_buffer);
        let local_set_types_buffer_ptr = Local(LocalOp::Set, stack_ptr_types_local);

        let argc = Const(Val::I32(
            i32::try_from(target_function_type.inputs().len()).unwrap(),
        ));
        let resc = Const(Val::I32(
            i32::try_from(target_function_type.results().len()).unwrap(),
        ));
        let const_apply_table_index = Const(Val::I32(i32::try_from(apply_table_index).unwrap()));
        let const_instrumented_function_index =
            Const(Val::I32(i32::try_from(function_index.to_u32()).unwrap()));
        let local_get_stack_ptr = || Local(LocalOp::Get, stack_ptr_local);
        let local_get_stack_types_ptr = || Local(LocalOp::Get, stack_ptr_types_local);
        let call_generic_apply = Call(generic_apply_index);
        let call_free_values_buffer = Call(stack_library_for_target.free_values_buffer);
        let call_free_types_buffer = Call(stack_library_for_target.free_types_buffer);
        let code_present_serialized = Const(Val::I32(if target_code_is_present {
            CODE_IS_PRESENT
        } else {
            CODE_IS_IMPORT
        }));

        // The original function body
        let uninstrumented_function_index = uninstrumented_function_indices
            .get(function_index)
            .expect("uninstrumented function index should exist");

        let mut instrumented_body = Vec::new();

        instrumented_body.extend_from_slice(&[
            const_instrumented_function_index.clone(),
            // --- load flag ---
            Instr::Load(
                LoadOp::I32Load8U,
                Memarg::default_with_index(LoadOp::I32Load8U, flag_memory_index),
            ),
            // --- flag == 0 ---
            Instr::Unary(wasabi_wasm::UnaryOp::I32Eqz),
            // --- if ---
            Instr::If(FunctionType::new(&[], target_function_type.results())),
        ]);
        // THEN

        // if path entry check counter
        if let Some(clean_idx) = fast_paths
            .contains_key(&function_index.to_u32())
            .then(|| clean_functions_indeces[function_index])
        {
            instrumented_body.extend_from_slice(&[
                Const(Val::I32((function_index.to_u32() * 4) as i32)),
                Instr::Load(
                    LoadOp::I32Load,
                    Memarg::default_with_index(LoadOp::I32Load, counter_memory_index),
                ), // stack: [entry_counter]
                Instr::Unary(wasabi_wasm::UnaryOp::I32Eqz),
                Instr::If(FunctionType::new(&[], target_function_type.results())),
            ]);
            // If counter == 0 call the fast path
            instrumented_body.extend(push_args_on_stack.clone());
            instrumented_body.push(Instr::Call(clean_idx));
            instrumented_body.push(Instr::Else);
            instrumented_body.extend(push_args_on_stack.clone());
            instrumented_body.push(Instr::Call(*uninstrumented_function_index));
            instrumented_body.push(End);
        } else {
            // call uninstrumented
            instrumented_body.extend(push_args_on_stack.clone());
            instrumented_body.push(Instr::Call(*uninstrumented_function_index));
        }

        // ELSE
        instrumented_body.push(Instr::Else);

        instrumented_body.extend(push_args_on_stack);
        instrumented_body.push(call_allocate_values_buffer);
        instrumented_body.push(local_set_values_buffer_ptr);
        instrumented_body.push(call_allocate_types_buffer);
        instrumented_body.push(local_set_types_buffer_ptr);
        instrumented_body.extend_from_slice(&[
            // Prep call generic apply
            const_apply_table_index,           // f_apply : i32
            const_instrumented_function_index, // instr_f_idx : i32
            argc,                              // argc    : i32
            resc,                              // resc    : i32
            local_get_stack_ptr(),             // sigv    : i32
            local_get_stack_types_ptr(),       // sigtypv : i32
            code_present_serialized,           // code_present_serialized : i32
            call_generic_apply,
        ]);

        for load_call in &stack_library_for_target.ret_load_n {
            instrumented_body.push(local_get_stack_ptr());
            instrumented_body.push(Call(*load_call));
        }

        instrumented_body.push(local_get_stack_ptr());
        instrumented_body.push(call_free_values_buffer);
        instrumented_body.push(local_get_stack_types_ptr());
        instrumented_body.push(call_free_types_buffer);
        instrumented_body.push(End); // end of if
        instrumented_body.push(End);
        original_function.code_mut().unwrap().body = instrumented_body;
    }

    let apply_count = u32::try_from(apply_table_funs.len()).unwrap();
    let apply_table_idx = module.tables.len();
    module.tables.push(Table {
        limits: Limits {
            initial_size: apply_count,
            max_size: Some(apply_count),
        },
        import: None,
        ref_type: RefType::FuncRef,
        export: vec![],
    });

    let apply_table_funs_refs: Vec<Vec<Instr>> = apply_table_funs
        .iter()
        .map(|idx| vec![RefFunc(*idx), End])
        .collect();

    module.elements.push(Element {
        typ: RefType::FuncRef,
        init: apply_table_funs_refs,
        mode: ElementMode::Active {
            table: apply_table_idx.into(),
            offset: vec![Const(Val::I32(0)), End],
        },
    });

    // 2. Generate 'call_base'
    let call_base_idx = module.add_function(
        wasp_imported_generic_apply_base.as_function_type(),
        vec![],
        vec![
            Local(LocalOp::Get, 1_usize.into()), // f_apply
            Local(LocalOp::Get, 0_usize.into()), // sigv
            CallIndirect(
                FunctionType::new(&[ValType::I32], &[]),
                apply_table_index.into(),
            ),
            End,
        ],
    );

    module
        .function_mut(call_base_idx)
        .export
        .push(wasp_imported_generic_apply_base.name.to_string());

    let set_f_instrumentation_body = vec![
        // Check old flag value
        Local(LocalOp::Get, 0_usize.into()), // f_idx
        Instr::Load(
            LoadOp::I32Load8U,
            Memarg::default_with_index(LoadOp::I32Load8U, flag_memory_index),
        ), // stack: old_flag_value
        Local(LocalOp::Get, 1_usize.into()), // stack: [old_flag_value, new_flag_value]
        Instr::Binary(BinaryOp::I32Eq),
        Instr::If(FunctionType::empty()), // If old flag = new flag, return we dont want to change counters
        Instr::Return,
        End,
        // Set flag to new value
        Local(LocalOp::Get, 0_usize.into()), // f_idx
        Local(LocalOp::Get, 1_usize.into()), // new_flag_value
        Instr::Store(
            StoreOp::I32Store8,
            wasabi_wasm::Memarg::default_with_index(StoreOp::I32Store8, flag_memory_index),
        ), // Set flag value
        // CHECK IF IN PATH
        Local(LocalOp::Get, 0_usize.into()), // stack: [f_idx]
        Instr::Const(Val::I32(4)),
        Instr::Binary(BinaryOp::I32Mul), // stack: [f_idx * 4]
        Instr::Load(
            LoadOp::I32Load,
            Memarg::default_with_index(LoadOp::I32Load, path_memory_index),
        ), // stack: [possible entry idx or -1]
        // set entry_idx local and leave on stack
        Local(LocalOp::Tee, 2_usize.into()),
        Instr::Const(Val::I32(0)),
        Instr::Binary(BinaryOp::I32LtS), // if entry_idx < 0
        // not on path
        Instr::If(FunctionType::empty()),
        Instr::Return,                       // Skip nothing else to do
        Instr::Else,                         // stack: []
        Local(LocalOp::Get, 2_usize.into()), // stack: [entry_idx]
        Instr::Const(Val::I32(4)),
        Instr::Binary(BinaryOp::I32Mul),     // stack: [entry_idx * 4]
        Local(LocalOp::Tee, 2_usize.into()), // entry_idx * 4 now in the local
        Local(LocalOp::Get, 2_usize.into()), // stack: [entry_idx * 4, entry_idx * 4]
        Instr::Load(
            LoadOp::I32Load,
            Memarg::default_with_index(LoadOp::I32Load, counter_memory_index),
        ), // stack: [entry_idx * 4, entry_counter]
        // If flag == 0 means turn off thus do minus 1 else plus 1
        Local(LocalOp::Get, 1_usize.into()), // stack: [entry_idx * 4, entry_counter, flag_value]
        Instr::Unary(UnaryOp::I32Eqz),
        Instr::If(FunctionType::new(&[], &[ValType::I32])), // if flag == 0, stack: [entry_idx * 4, entry_counter]
        // Turn off, decrease counter
        Instr::Const(Val::I32(-1)),
        Instr::Else,
        // Turn on, increase counter
        Instr::Const(Val::I32(1)),
        End,                             // stack: [entry_idx * 4, entry_counter, 1 or -1]
        Instr::Binary(BinaryOp::I32Add), // stack: [entry_idx * 4, new_entry_counter]
        Instr::Store(
            StoreOp::I32Store,
            Memarg::default_with_index(StoreOp::I32Store, counter_memory_index),
        ),
        End,
        End, // function end
    ];

    // Generate 'set_f_instrumentation'
    let set_f_instrumentation = module.add_function(
        wasp_imported_set_f_instrumentation.as_function_type(),
        vec![ValType::I32, ValType::I32], // entry_idx, old_flag_value
        set_f_instrumentation_body,
    );

    let mut set_instrumentation_body = vec![
        Instr::Const(Val::I32(0)),                             // memory offset
        Local(LocalOp::Get, 0_usize.into()),                   // value to fill (arg)
        Instr::Const(Val::I32(program_function_count as i32)), // number of bytes to fill
        MemoryFill(flag_memory_index.into()),
        // RESET COUNTERS
        // Set counters to 0
        Instr::Const(Val::I32(0)), // memory offset
        Instr::Const(Val::I32(0)), // value to fill (arg)
        Instr::Const(Val::I32(program_function_count as i32 * 4)), // number of bytes to fill
        MemoryFill(counter_memory_index.into()),
        Local(LocalOp::Get, 0_usize.into()), // 1 (true) = turn on, 0 (false) not
        // If turn on
        Instr::If(FunctionType::empty()),
        // Push in correct function amount
    ];
    // Push in correct function amount
    for (&entry, path_members) in fast_paths {
        set_instrumentation_body.extend_from_slice(&[
            Instr::Const(Val::I32(entry as i32 * 4)), // entry_idx
            Instr::Const(Val::I32(path_members.len() as i32)), // counter_value
            Instr::Store(
                StoreOp::I32Store,
                Memarg::default_with_index(StoreOp::I32Store, counter_memory_index),
            ),
        ]);
    }
    set_instrumentation_body.extend_from_slice(&[End, End]); // if end, function end

    // Generate 'set_instrumentation'
    let set_instrumentation = module.add_function(
        wasp_imported_set_instrumentation.as_function_type(),
        vec![],
        set_instrumentation_body,
    );

    module
        .function_mut(set_f_instrumentation)
        .export
        .push(wasp_imported_set_f_instrumentation.name.to_string());

    module
        .function_mut(set_instrumentation)
        .export
        .push(wasp_imported_set_instrumentation.name.to_string());

    // Initiate flags at module instance
    let start_idx = match module.start {
        Some(start_idx) => start_idx,
        None => {
            let start_idx = module.add_function(
                FunctionType::GoedelNumber {
                    inputs: 0,
                    results: 0,
                },
                vec![],
                vec![End],
            );
            module.start = Some(start_idx);
            start_idx
        }
    };

    let start_function = module.function_mut(start_idx);
    let instructions = start_function.instrs_mut().unwrap();
    instructions.insert(0, Instr::Call(set_instrumentation));
    // Depends on if you start with instrumentation on or off
    instructions.insert(0, Instr::Const(Val::I32(!start_disabled as i32)));
    library
}
