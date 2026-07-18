use wastrumentation_rs_stdlib::*;

static mut REENABLE_ID: i32 = -1;
static mut FUNCTION_APPLY_COUNT: [i32; 5] = [0; 5];

#[unsafe(no_mangle)]
pub extern "C" fn get_function_apply_count(function_id: i32) -> i32 {
    unsafe { FUNCTION_APPLY_COUNT[function_id as usize] }
}

advice! {
    apply(function: WasmFunction, args: MutDynArgs, ress: MutDynResults) {
        let f_idx = function.instr_f_idx;
        unsafe {
            FUNCTION_APPLY_COUNT[f_idx as usize] += 1;
        }
        function.apply();
        unsafe {
            if REENABLE_ID == -1 {
                // Disable
                REENABLE_ID = f_idx;
                function.set_instrumentation(false);
            } else if f_idx != REENABLE_ID {
                // Re-enable previous function
                enable_function_instrumentation(FunctionIndex(REENABLE_ID));
            }
        }
    }
}
