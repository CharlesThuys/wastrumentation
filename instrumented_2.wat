(module
  (type $t0 (func (param i32 i32) (result i32)))
  (type $t1 (func))
  (func $f (type $t0) (param $p0 i32) (param $p1 i32) (result i32)
    local.get $p1
    local.get $p0
    i32.add)
  (func $main (type $t1)
    (local $l0 i32) (local $l1 i32) (local $l2 i32) (local $l3 i32)
    global.get $g0
    i32.const 16
    i32.sub
    local.tee $l0
    global.set $g0
    i32.const 0
    local.set $l1
    i32.const 0
    local.set $l2
    loop $L0
      local.get $l2
      local.get $l1
      global.get $g3
      i32.const 1
      i32.xor
      global.set $g3
      global.get $g3
      call_indirect $T1 (type $t0)
      local.set $l2
      local.get $l1
      i32.const 1
      i32.add
      local.tee $l3
      local.set $l1
      local.get $l3
      i32.const 1000
      i32.ne
      br_if $L0
    end
    local.get $l0
    local.get $l2
    i32.store offset=12
    local.get $l0
    i32.const 12
    i32.add
    local.set $l1
    local.get $l0
    i32.const 16
    i32.add
    global.set $g0)
  (func $f2 (type $t0) (param $p0 i32) (param $p1 i32) (result i32)
    local.get $p1
    local.get $p0
    i32.add)
  (table $T0 1 1 funcref)
  (table $T1 2 2 funcref)
  (memory $memory 16)
  (global $g0 (mut i32) (i32.const 1048576))
  (global $__data_end i32 (i32.const 1048576))
  (global $__heap_base i32 (i32.const 1048576))
  (global $g3 (mut i32) (i32.const 0))
  (export "f" (func $f))
  (export "main" (func $main))
  (export "memory" (memory $memory))
  (export "__data_end" (global $__data_end))
  (export "__heap_base" (global $__heap_base))
  (elem $e0 (table $T1) (i32.const 0) func $f $f2))
