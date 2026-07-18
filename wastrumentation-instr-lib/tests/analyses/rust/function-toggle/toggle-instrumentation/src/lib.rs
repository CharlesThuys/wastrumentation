use wastrumentation_rs_stdlib::*;

static mut APPLY_COUNT: i32 = 0;
static mut FUNCTION_APPLY_COUNT: [i32; 5] = [0; 5];
static mut BINARY_COUNT: i32 = 0;

#[unsafe(no_mangle)]
pub extern "C" fn get_apply_count() -> i32 {
    unsafe { APPLY_COUNT }
}

#[unsafe(no_mangle)]
pub extern "C" fn get_function_apply_count(function_id: i32) -> i32 {
    unsafe { FUNCTION_APPLY_COUNT[function_id as usize] }
}

#[unsafe(no_mangle)]
pub extern "C" fn get_binary_count() -> i32 {
    unsafe { BINARY_COUNT }
}

advice! {
    apply (function : WasmFunction, args : MutDynArgs, ress : MutDynResults) {
        unsafe {
            APPLY_COUNT += 1;
            FUNCTION_APPLY_COUNT[function.instr_f_idx as usize] += 1;
        }
        function.apply();
        function.set_instrumentation(false);
    }
}

advice! {
    binary (
        operator: BinaryOperator,
        l_operand: WasmValue,
        r_operand: WasmValue,
        location: Location,
    ) {
        unsafe { BINARY_COUNT += 1 }
        operator.apply(l_operand, r_operand)
    }
}
