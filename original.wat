(module
  (type $0 (func (param i32 i32) (result i32)))
  (type $1 (func (result i32)))
  (func $module/f (type $0) (param $0 i32) (param $1 i32) (result i32)
    local.get $0
    local.get $1
    i32.add)
  (func $module/g (type $1) (result i32)
    (local $0 i32) (local $1 i32)
    loop $L0
      local.get $0
      i32.const 1000
      i32.lt_s
      if $I1
        local.get $0
        local.get $1
        call $module/f
        local.set $1
        local.get $0
        i32.const 1
        i32.add
        local.set $0
        br $L0
      end
    end
    local.get $1)
  (memory $0 0)
  (export "g" (func $module/g))
  (export "f" (func $module/f))
  (export "memory" (memory $0)))
