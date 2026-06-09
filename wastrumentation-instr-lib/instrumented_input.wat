(module
  (type $t0 (func (param i32 i32 i64 i64) (result i32)))
  (type $t1 (func (param i64 i32 i64 i64) (result i32)))
  (type $t2 (func (param i64 i32 i64 i64) (result i64)))
  (type $t3 (func (param f32 i32 i64 i64) (result f32)))
  (type $t4 (func (param f64 i32 i64 i64) (result f64)))
  (type $t5 (func (param f32 i32 i64 i64) (result i32)))
  (type $t6 (func (param f64 i32 i64 i64) (result i32)))
  (type $t7 (func (param i32 i32 i64 i64) (result i64)))
  (type $t8 (func (param f32 i32 i64 i64) (result i64)))
  (type $t9 (func (param f64 i32 i64 i64) (result i64)))
  (type $t10 (func (param i32 i32 i64 i64) (result f32)))
  (type $t11 (func (param i64 i32 i64 i64) (result f32)))
  (type $t12 (func (param f64 i32 i64 i64) (result f32)))
  (type $t13 (func (param i32 i32 i64 i64) (result f64)))
  (type $t14 (func (param i64 i32 i64 i64) (result f64)))
  (type $t15 (func (param f32 i32 i64 i64) (result f64)))
  (type $t16 (func (param i32 i32 i32 i64 i64) (result i32)))
  (type $t17 (func (param i64 i64 i32 i64 i64) (result i32)))
  (type $t18 (func (param f32 f32 i32 i64 i64) (result i32)))
  (type $t19 (func (param f64 f64 i32 i64 i64) (result i32)))
  (type $t20 (func (param i64 i64 i32 i64 i64) (result i64)))
  (type $t21 (func (param f32 f32 i32 i64 i64) (result f32)))
  (type $t22 (func (param f64 f64 i32 i64 i64) (result f64)))
  (type $t23 (func (param i32 i32 i32 i32 i32 i32 i32)))
  (type $t24 (func (param i32 i32) (result i32)))
  (type $t25 (func (param i32)))
  (type $t26 (func (result i32)))
  (type $t27 (func (param i32) (result i32)))
  (type $t28 (func (param i32 i32)))
  (type $t29 (func (param i32 i32) (result i64)))
  (type $t30 (func (param i32 i32) (result f32)))
  (type $t31 (func (param i32 i32) (result f64)))
  (type $t32 (func (param i32 i32 i32)))
  (type $t33 (func (param i32 i64 i32)))
  (type $t34 (func (param i32 f32 i32)))
  (type $t35 (func (param i32 f64 i32)))
  (import "WASTRUMENTATION_ANALYSIS" "unary_i32_to_i32" (func $WASTRUMENTATION_ANALYSIS.unary_i32_to_i32 (type $t0)))
  (import "WASTRUMENTATION_ANALYSIS" "unary_i64_to_i32" (func $WASTRUMENTATION_ANALYSIS.unary_i64_to_i32 (type $t1)))
  (import "WASTRUMENTATION_ANALYSIS" "unary_i64_to_i64" (func $WASTRUMENTATION_ANALYSIS.unary_i64_to_i64 (type $t2)))
  (import "WASTRUMENTATION_ANALYSIS" "unary_f32_to_f32" (func $WASTRUMENTATION_ANALYSIS.unary_f32_to_f32 (type $t3)))
  (import "WASTRUMENTATION_ANALYSIS" "unary_f64_to_f64" (func $WASTRUMENTATION_ANALYSIS.unary_f64_to_f64 (type $t4)))
  (import "WASTRUMENTATION_ANALYSIS" "unary_f32_to_i32" (func $WASTRUMENTATION_ANALYSIS.unary_f32_to_i32 (type $t5)))
  (import "WASTRUMENTATION_ANALYSIS" "unary_f64_to_i32" (func $WASTRUMENTATION_ANALYSIS.unary_f64_to_i32 (type $t6)))
  (import "WASTRUMENTATION_ANALYSIS" "unary_i32_to_i64" (func $WASTRUMENTATION_ANALYSIS.unary_i32_to_i64 (type $t7)))
  (import "WASTRUMENTATION_ANALYSIS" "unary_f32_to_i64" (func $WASTRUMENTATION_ANALYSIS.unary_f32_to_i64 (type $t8)))
  (import "WASTRUMENTATION_ANALYSIS" "unary_f64_to_i64" (func $WASTRUMENTATION_ANALYSIS.unary_f64_to_i64 (type $t9)))
  (import "WASTRUMENTATION_ANALYSIS" "unary_i32_to_f32" (func $WASTRUMENTATION_ANALYSIS.unary_i32_to_f32 (type $t10)))
  (import "WASTRUMENTATION_ANALYSIS" "unary_i64_to_f32" (func $WASTRUMENTATION_ANALYSIS.unary_i64_to_f32 (type $t11)))
  (import "WASTRUMENTATION_ANALYSIS" "unary_f64_to_f32" (func $WASTRUMENTATION_ANALYSIS.unary_f64_to_f32 (type $t12)))
  (import "WASTRUMENTATION_ANALYSIS" "unary_i32_to_f64" (func $WASTRUMENTATION_ANALYSIS.unary_i32_to_f64 (type $t13)))
  (import "WASTRUMENTATION_ANALYSIS" "unary_i64_to_f64" (func $WASTRUMENTATION_ANALYSIS.unary_i64_to_f64 (type $t14)))
  (import "WASTRUMENTATION_ANALYSIS" "unary_f32_to_f64" (func $WASTRUMENTATION_ANALYSIS.unary_f32_to_f64 (type $t15)))
  (import "WASTRUMENTATION_ANALYSIS" "binary_i32_i32_to_i32" (func $WASTRUMENTATION_ANALYSIS.binary_i32_i32_to_i32 (type $t16)))
  (import "WASTRUMENTATION_ANALYSIS" "binary_i64_i64_to_i32" (func $WASTRUMENTATION_ANALYSIS.binary_i64_i64_to_i32 (type $t17)))
  (import "WASTRUMENTATION_ANALYSIS" "binary_f32_f32_to_i32" (func $WASTRUMENTATION_ANALYSIS.binary_f32_f32_to_i32 (type $t18)))
  (import "WASTRUMENTATION_ANALYSIS" "binary_f64_f64_to_i32" (func $WASTRUMENTATION_ANALYSIS.binary_f64_f64_to_i32 (type $t19)))
  (import "WASTRUMENTATION_ANALYSIS" "binary_i64_i64_to_i64" (func $WASTRUMENTATION_ANALYSIS.binary_i64_i64_to_i64 (type $t20)))
  (import "WASTRUMENTATION_ANALYSIS" "binary_f32_f32_to_f32" (func $WASTRUMENTATION_ANALYSIS.binary_f32_f32_to_f32 (type $t21)))
  (import "WASTRUMENTATION_ANALYSIS" "binary_f64_f64_to_f64" (func $WASTRUMENTATION_ANALYSIS.binary_f64_f64_to_f64 (type $t22)))
  (import "WASTRUMENTATION_ANALYSIS" "generic_apply" (func $WASTRUMENTATION_ANALYSIS.generic_apply (type $t23)))
  (import "wastrumentation_stack" "allocate_ret_i32_arg_i32_i32" (func $wastrumentation_stack.allocate_ret_i32_arg_i32_i32 (type $t24)))
  (import "wastrumentation_stack" "free_values_ret_i32_arg_i32_i32" (func $wastrumentation_stack.free_values_ret_i32_arg_i32_i32 (type $t25)))
  (import "wastrumentation_stack" "allocate_types_ret_i32_arg_i32_i32" (func $wastrumentation_stack.allocate_types_ret_i32_arg_i32_i32 (type $t26)))
  (import "wastrumentation_stack" "free_types_ret_i32_arg_i32_i32" (func $wastrumentation_stack.free_types_ret_i32_arg_i32_i32 (type $t25)))
  (import "wastrumentation_stack" "load_arg0_ret_i32_arg_i32_i32" (func $wastrumentation_stack.load_arg0_ret_i32_arg_i32_i32 (type $t27)))
  (import "wastrumentation_stack" "load_arg1_ret_i32_arg_i32_i32" (func $wastrumentation_stack.load_arg1_ret_i32_arg_i32_i32 (type $t27)))
  (import "wastrumentation_stack" "load_ret0_ret_i32_arg_i32_i32" (func $wastrumentation_stack.load_ret0_ret_i32_arg_i32_i32 (type $t27)))
  (import "wastrumentation_stack" "store_arg0_ret_i32_arg_i32_i32" (func $wastrumentation_stack.store_arg0_ret_i32_arg_i32_i32 (type $t28)))
  (import "wastrumentation_stack" "store_arg1_ret_i32_arg_i32_i32" (func $wastrumentation_stack.store_arg1_ret_i32_arg_i32_i32 (type $t28)))
  (import "wastrumentation_stack" "store_ret0_ret_i32_arg_i32_i32" (func $wastrumentation_stack.store_ret0_ret_i32_arg_i32_i32 (type $t28)))
  (import "wastrumentation_stack" "store_rets_ret_i32_arg_i32_i32" (func $wastrumentation_stack.store_rets_ret_i32_arg_i32_i32 (type $t28)))
  (func $module/add (type $t24) (param $0 i32) (param $1 i32) (result i32)
    (local $l2 i32) (local $l3 i32)
    i32.const 1
    i32.load8_u
    i32.eqz
    if $I0 (result i32)
      local.get $0
      local.get $1
      call $f37
    else
      local.get $0
      local.get $1
      call $wastrumentation_stack.allocate_ret_i32_arg_i32_i32
      local.set $l2
      call $wastrumentation_stack.allocate_types_ret_i32_arg_i32_i32
      local.set $l3
      i32.const 1
      i32.const 0
      i32.const 2
      i32.const 1
      local.get $l2
      local.get $l3
      i32.const 0
      call $WASTRUMENTATION_ANALYSIS.generic_apply
      local.get $l2
      call $wastrumentation_stack.load_ret0_ret_i32_arg_i32_i32
      local.get $l2
      call $wastrumentation_stack.free_values_ret_i32_arg_i32_i32
      local.get $l3
      call $wastrumentation_stack.free_types_ret_i32_arg_i32_i32
    end)
  (func $module/mul (type $t24) (param $0 i32) (param $1 i32) (result i32)
    (local $l2 i32) (local $l3 i32)
    i32.const 0
    i32.load8_u
    i32.eqz
    if $I0 (result i32)
      local.get $0
      local.get $1
      call $f38
    else
      local.get $0
      local.get $1
      call $wastrumentation_stack.allocate_ret_i32_arg_i32_i32
      local.set $l2
      call $wastrumentation_stack.allocate_types_ret_i32_arg_i32_i32
      local.set $l3
      i32.const 0
      i32.const 1
      i32.const 2
      i32.const 1
      local.get $l2
      local.get $l3
      i32.const 0
      call $WASTRUMENTATION_ANALYSIS.generic_apply
      local.get $l2
      call $wastrumentation_stack.load_ret0_ret_i32_arg_i32_i32
      local.get $l2
      call $wastrumentation_stack.free_values_ret_i32_arg_i32_i32
      local.get $l3
      call $wastrumentation_stack.free_types_ret_i32_arg_i32_i32
    end)
  (func $f37 (type $t24) (param $p0 i32) (param $p1 i32) (result i32)
    local.get $p0
    local.get $p1
    i32.add)
  (func $f38 (type $t24) (param $p0 i32) (param $p1 i32) (result i32)
    local.get $p0
    local.get $p1
    i32.mul)
  (func $f39 (type $t24) (param $p0 i32) (param $p1 i32) (result i32)
    local.get $p0
    local.get $p1
    i32.const 35
    i64.const 1
    i64.const 2
    call $WASTRUMENTATION_ANALYSIS.binary_i32_i32_to_i32)
  (func $f40 (type $t25) (param $p0 i32)
    (local $l1 i32)
    local.get $p0
    local.get $p0
    call $wastrumentation_stack.load_arg0_ret_i32_arg_i32_i32
    local.get $p0
    call $wastrumentation_stack.load_arg1_ret_i32_arg_i32_i32
    call $f39
    call $wastrumentation_stack.store_rets_ret_i32_arg_i32_i32)
  (func $f41 (type $t24) (param $p0 i32) (param $p1 i32) (result i32)
    local.get $p0
    local.get $p1
    i32.const 33
    i64.const 0
    i64.const 2
    call $WASTRUMENTATION_ANALYSIS.binary_i32_i32_to_i32)
  (func $f42 (type $t25) (param $p0 i32)
    (local $l1 i32)
    local.get $p0
    local.get $p0
    call $wastrumentation_stack.load_arg0_ret_i32_arg_i32_i32
    local.get $p0
    call $wastrumentation_stack.load_arg1_ret_i32_arg_i32_i32
    call $f41
    call $wastrumentation_stack.store_rets_ret_i32_arg_i32_i32)
  (func $call_base (type $t28) (param $p0 i32) (param $p1 i32)
    local.get $p1
    local.get $p0
    call_indirect $T0 (type $t25))
  (func $set_instr_flag (type $t28) (param $p0 i32) (param $p1 i32)
    local.get $p0
    local.get $p1
    i32.store8)
  (func $instrumented_base_load_i32 (type $t24) (param $p0 i32) (param $p1 i32) (result i32)
    local.get $p0
    local.get $p1
    i32.add
    i32.load)
  (func $instrumented_base_load_i64 (type $t29) (param $p0 i32) (param $p1 i32) (result i64)
    local.get $p0
    local.get $p1
    i32.add
    i64.load)
  (func $instrumented_base_load_f32 (type $t30) (param $p0 i32) (param $p1 i32) (result f32)
    local.get $p0
    local.get $p1
    i32.add
    f32.load)
  (func $instrumented_base_load_f64 (type $t31) (param $p0 i32) (param $p1 i32) (result f64)
    local.get $p0
    local.get $p1
    i32.add
    f64.load)
  (func $instrumented_base_load_i32_8S (type $t24) (param $p0 i32) (param $p1 i32) (result i32)
    local.get $p0
    local.get $p1
    i32.add
    i32.load8_s)
  (func $instrumented_base_load_i32_8U (type $t24) (param $p0 i32) (param $p1 i32) (result i32)
    local.get $p0
    local.get $p1
    i32.add
    i32.load8_u)
  (func $instrumented_base_load_i32_16S (type $t24) (param $p0 i32) (param $p1 i32) (result i32)
    local.get $p0
    local.get $p1
    i32.add
    i32.load16_s)
  (func $instrumented_base_load_i32_16U (type $t24) (param $p0 i32) (param $p1 i32) (result i32)
    local.get $p0
    local.get $p1
    i32.add
    i32.load16_u)
  (func $instrumented_base_load_i64_8S (type $t29) (param $p0 i32) (param $p1 i32) (result i64)
    local.get $p0
    local.get $p1
    i32.add
    i64.load8_s)
  (func $instrumented_base_load_i64_8U (type $t29) (param $p0 i32) (param $p1 i32) (result i64)
    local.get $p0
    local.get $p1
    i32.add
    i64.load8_u)
  (func $instrumented_base_load_i64_16S (type $t29) (param $p0 i32) (param $p1 i32) (result i64)
    local.get $p0
    local.get $p1
    i32.add
    i64.load16_s)
  (func $instrumented_base_load_i64_16U (type $t29) (param $p0 i32) (param $p1 i32) (result i64)
    local.get $p0
    local.get $p1
    i32.add
    i64.load16_u)
  (func $instrumented_base_load_i64_32S (type $t29) (param $p0 i32) (param $p1 i32) (result i64)
    local.get $p0
    local.get $p1
    i32.add
    i64.load32_s)
  (func $instrumented_base_load_i64_32U (type $t29) (param $p0 i32) (param $p1 i32) (result i64)
    local.get $p0
    local.get $p1
    i32.add
    i64.load32_u)
  (func $instrumented_base_store_i32 (type $t32) (param $p0 i32) (param $p1 i32) (param $p2 i32)
    local.get $p0
    local.get $p2
    i32.add
    local.get $p1
    i32.store)
  (func $instrumented_base_store_i64 (type $t33) (param $p0 i32) (param $p1 i64) (param $p2 i32)
    local.get $p0
    local.get $p2
    i32.add
    local.get $p1
    i64.store)
  (func $instrumented_base_store_f32 (type $t34) (param $p0 i32) (param $p1 f32) (param $p2 i32)
    local.get $p0
    local.get $p2
    i32.add
    local.get $p1
    f32.store)
  (func $instrumented_base_store_f64 (type $t35) (param $p0 i32) (param $p1 f64) (param $p2 i32)
    local.get $p0
    local.get $p2
    i32.add
    local.get $p1
    f64.store)
  (func $instrumented_base_store_i32_8 (type $t32) (param $p0 i32) (param $p1 i32) (param $p2 i32)
    local.get $p0
    local.get $p2
    i32.add
    local.get $p1
    i32.store8)
  (func $instrumented_base_store_i32_16 (type $t32) (param $p0 i32) (param $p1 i32) (param $p2 i32)
    local.get $p0
    local.get $p2
    i32.add
    local.get $p1
    i32.store16)
  (func $instrumented_base_store_i64_8 (type $t33) (param $p0 i32) (param $p1 i64) (param $p2 i32)
    local.get $p0
    local.get $p2
    i32.add
    local.get $p1
    i64.store8)
  (func $instrumented_base_store_i64_16 (type $t33) (param $p0 i32) (param $p1 i64) (param $p2 i32)
    local.get $p0
    local.get $p2
    i32.add
    local.get $p1
    i64.store16)
  (func $instrumented_base_store_i64_32 (type $t33) (param $p0 i32) (param $p1 i64) (param $p2 i32)
    local.get $p0
    local.get $p2
    i32.add
    local.get $p1
    i64.store32)
  (func $instrumented_memory_grow (type $t24) (param $p0 i32) (param $p1 i32) (result i32)
    local.get $p0
    memory.grow)
  (func $instrumented_memory_size (type $t27) (param $p0 i32) (result i32)
    memory.size)
  (table $T0 2 2 funcref)
  (memory $M0 2)
  (export "add" (func $module/add))
  (export "mul" (func $module/mul))
  (export "call_base" (func $call_base))
  (export "set_instr_flag" (func $set_instr_flag))
  (export "instrumented_base_load_i32" (func $instrumented_base_load_i32))
  (export "instrumented_base_load_i64" (func $instrumented_base_load_i64))
  (export "instrumented_base_load_f32" (func $instrumented_base_load_f32))
  (export "instrumented_base_load_f64" (func $instrumented_base_load_f64))
  (export "instrumented_base_load_i32_8S" (func $instrumented_base_load_i32_8S))
  (export "instrumented_base_load_i32_8U" (func $instrumented_base_load_i32_8U))
  (export "instrumented_base_load_i32_16S" (func $instrumented_base_load_i32_16S))
  (export "instrumented_base_load_i32_16U" (func $instrumented_base_load_i32_16U))
  (export "instrumented_base_load_i64_8S" (func $instrumented_base_load_i64_8S))
  (export "instrumented_base_load_i64_8U" (func $instrumented_base_load_i64_8U))
  (export "instrumented_base_load_i64_16S" (func $instrumented_base_load_i64_16S))
  (export "instrumented_base_load_i64_16U" (func $instrumented_base_load_i64_16U))
  (export "instrumented_base_load_i64_32S" (func $instrumented_base_load_i64_32S))
  (export "instrumented_base_load_i64_32U" (func $instrumented_base_load_i64_32U))
  (export "instrumented_base_store_i32" (func $instrumented_base_store_i32))
  (export "instrumented_base_store_i64" (func $instrumented_base_store_i64))
  (export "instrumented_base_store_f32" (func $instrumented_base_store_f32))
  (export "instrumented_base_store_f64" (func $instrumented_base_store_f64))
  (export "instrumented_base_store_i32_8" (func $instrumented_base_store_i32_8))
  (export "instrumented_base_store_i32_16" (func $instrumented_base_store_i32_16))
  (export "instrumented_base_store_i64_8" (func $instrumented_base_store_i64_8))
  (export "instrumented_base_store_i64_16" (func $instrumented_base_store_i64_16))
  (export "instrumented_base_store_i64_32" (func $instrumented_base_store_i64_32))
  (export "instrumented_memory_grow" (func $instrumented_memory_grow))
  (export "instrumented_memory_size" (func $instrumented_memory_size))
  (elem $e0 (i32.const 0) func $f40 $f42)
  (data $d0 (i32.const 0) "\01\01\01"))
