use wastrumentation_rs_stdlib::*;

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

advice! { call pre (
        target_func : FunctionIndex,
        location: Location,
    ) {
        println!("[MYLOGGER:] call pre generic function_index: {target_func:#?}, location: {location:?}");
    }
}