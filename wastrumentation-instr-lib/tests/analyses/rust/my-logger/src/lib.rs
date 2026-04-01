use wastrumentation_rs_stdlib::*;

advice! { apply (function : WasmFunction, args : MutDynArgs, ress : MutDynResults) {
        function.apply();
        if ress.argc > 0 && ress.get_res(0).as_i32() == 18 {
            function.turn_off();
        }
    }
}

advice! { unary (
        operator: UnaryOperator,
        operand: WasmValue,
        location: Location,
    ) {
        println!("[MYLOGGER:] unary generic {operator:#?} {operand:#?}, location: {location:?}");
        operator.apply(operand)
    }
}

advice! { binary (
        operator: BinaryOperator,
        l_operand: WasmValue,
        r_operand: WasmValue,
        location: Location,
    ) {
        println!("[MYLOGGER:] binary generic {operator:#?} {l_operand:#?} {r_operand:#?}, location: {location:?}");
        operator.apply(l_operand, r_operand)
    }
}