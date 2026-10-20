(module $rec_eval.wasm
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (param i32) (result i32)))
  (type (;2;) (func (param i32 i32 i32) (result i32)))
  (type (;3;) (func (param i32 i32)))
  (func $_RNvCscpxCunbMfNw_8rec_eval13eval_fallback (type 0) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 0
    local.get 1
    i32.gt_u
    select
    call $_RNvCscpxCunbMfNw_8rec_eval18intensity_modifier)
  (func $_RNvCscpxCunbMfNw_8rec_eval18intensity_modifier (type 1) (param i32) (result i32)
    local.get 0
    i32.const 1
    i32.shl)
  (func $_RNvCscpxCunbMfNw_8rec_eval15preprocess_code (type 1) (param i32) (result i32)
    local.get 0
    i32.const 1
    local.get 0
    i32.const 1
    i32.gt_u
    select)
  (func $_RNvCscpxCunbMfNw_8rec_eval15recursive_fetch (type 0) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 0
    i32.store offset=8
    local.get 2
    i32.const 1
    i32.store offset=12
    local.get 2
    local.get 0
    i32.const 1
    i32.and
    i32.store offset=4
    local.get 2
    i32.const 4
    i32.add
    local.get 1
    i32.const 1
    i32.add
    call $_RNvCscpxCunbMfNw_8rec_eval9eval_node
    local.set 0
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_RNvCscpxCunbMfNw_8rec_eval9eval_node (type 0) (param i32 i32) (result i32)
    (local i32)
    i32.const 0
    local.set 2
    block  ;; label = @1
      local.get 1
      i32.const 5
      i32.gt_u
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=4
      local.set 2
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load
            br_table 3 (;@1;) 1 (;@3;) 2 (;@2;) 0 (;@4;)
          end
          local.get 2
          local.get 0
          i32.load offset=8
          call $_RNvCscpxCunbMfNw_8rec_eval13eval_fallback
          return
        end
        local.get 2
        local.get 0
        i32.load offset=8
        local.get 1
        call $_RNvCscpxCunbMfNw_8rec_eval8eval_add
        return
      end
      local.get 2
      local.get 0
      i32.load offset=8
      local.get 1
      call $_RNvCscpxCunbMfNw_8rec_eval8eval_sub
      local.set 2
    end
    local.get 2)
  (func $_RNvCscpxCunbMfNw_8rec_eval8eval_add (type 2) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 2
    call $_RNvCscpxCunbMfNw_8rec_eval15recursive_fetch
    local.get 1
    local.get 2
    call $_RNvCscpxCunbMfNw_8rec_eval15recursive_fetch
    i32.add)
  (func $_RNvCscpxCunbMfNw_8rec_eval8eval_sub (type 2) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 2
    call $_RNvCscpxCunbMfNw_8rec_eval15recursive_fetch
    local.get 1
    local.get 2
    call $_RNvCscpxCunbMfNw_8rec_eval15recursive_fetch
    i32.sub)
  (func $_RNvCscpxCunbMfNw_8rec_eval9parse_ast (type 3) (param i32 i32)
    local.get 0
    local.get 1
    i32.const 3
    i32.and
    i32.store
    local.get 0
    local.get 1
    i32.const 1
    i32.shr_u
    i32.const 10
    i32.rem_u
    i32.store offset=8
    local.get 0
    local.get 1
    i32.const 3
    i32.mul
    i32.const 10
    i32.rem_u
    i32.store offset=4)
  (func $evaluate_expression (type 1) (param i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 4
    i32.add
    local.get 0
    call $_RNvCscpxCunbMfNw_8rec_eval9parse_ast
    local.get 1
    i32.const 4
    i32.add
    i32.const 0
    call $_RNvCscpxCunbMfNw_8rec_eval9eval_node
    local.set 0
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $optimize_and_run (type 1) (param i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 4
    i32.add
    local.get 0
    call $_RNvCscpxCunbMfNw_8rec_eval15preprocess_code
    call $_RNvCscpxCunbMfNw_8rec_eval9parse_ast
    local.get 1
    i32.const 4
    i32.add
    i32.const 0
    call $_RNvCscpxCunbMfNw_8rec_eval9eval_node
    local.set 0
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (table (;0;) 1 1 funcref)
  (memory (;0;) 16)
  (global $__stack_pointer (mut i32) (i32.const 1048576))
  (export "memory" (memory 0))
  (export "evaluate_expression" (func $evaluate_expression))
  (export "optimize_and_run" (func $optimize_and_run)))
