(module
  (type $t0 (func (param i32 i32) (result i32)))
  (type $t1 (func (result i32)))
  (func $module/f (type $t0) (param $0 i32) (param $1 i32) (result i32)
    local.get $0
    local.get $1
    i32.add)
  (func $module/g (type $t1) (result i32)
    (local $0 i32) (local $1 i32)
    loop $L0
      local.get $0
      i32.const 1000
      i32.lt_s
      if $I1
        local.get $1
        local.get $0
        global.get $g0
        i32.const 1
        i32.xor
        global.set $g0
        global.get $g0
        call_indirect $T0 (type $t0)
        local.set $1
        local.get $0
        i32.const 1
        i32.add
        local.set $0
        br $L0
      end
    end
    local.get $1)
  (func $f2 (type $t0) (param $p0 i32) (param $p1 i32) (result i32)
    local.get $p0
    local.get $p1
    i32.sub)
  (table $T0 2 2 funcref)
  (memory $memory 0)
  (global $g0 (mut i32) (i32.const 0))
  (export "f" (func $module/f))
  (export "g" (func $module/g))
  (export "memory" (memory $memory))
  (elem $e0 (i32.const 0) func $module/f $f2))
