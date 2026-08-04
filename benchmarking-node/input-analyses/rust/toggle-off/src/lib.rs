extern crate wastrumentation_rs_stdlib;

use wastrumentation_rs_stdlib::*;

advice! {
    apply (func: WasmFunction, args: MutDynArgs, ress: MutDynResults) {
            func.apply();
            func.set_instrumentation(false);
        }
}
