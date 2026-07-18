use wastrumentation_rs_stdlib::*;

static mut FUNCTION_APPLY_COUNT: [i32; 5] = [0; 5];

#[unsafe(no_mangle)]
pub extern "C" fn get_function_apply_count(function_id: i32) -> i32 {
    unsafe { FUNCTION_APPLY_COUNT[function_id as usize] }
}

#[unsafe(no_mangle)]
pub extern "C" fn set_function_enabled(function_id: i32, enabled: i32) {
    set_function_instrumentation(FunctionIndex(function_id), enabled != 0);
}

advice! {
    apply(function: WasmFunction, args: MutDynArgs, ress: MutDynResults) {
        let f_idx = function.instr_f_idx;

        unsafe {
            FUNCTION_APPLY_COUNT[f_idx as usize] += 1;
        }

        function.apply();
    }
}
