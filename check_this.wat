(module
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (param i32 i32 i32) (result i32)))
  (type (;2;) (func (param i32)))
  (type (;3;) (func (param i32 i32)))
  (type (;4;) (func (param i32 i32 i32 i32 i32 i32) (result i32)))
  (type (;5;) (func))
  (type (;6;) (func (param i32 i32 i32 i32 i32) (result i32)))
  (type (;7;) (func (param i32 i32 i32 i32)))
  (type (;8;) (func (param i32 i32 i32)))
  (type (;9;) (func (param i32) (result i32)))
  (func (;0;) (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.load offset=8
          local.tee 3
          i32.const 33554432
          i32.and
          br_if 0 (;@3;)
          local.get 3
          i32.const 67108864
          i32.and
          br_if 1 (;@2;)
          local.get 0
          local.get 1
          call 1
          local.set 0
          br 2 (;@1;)
        end
        local.get 0
        i32.load
        local.set 0
        i32.const 9
        local.set 3
        loop  ;; label = @3
          local.get 2
          i32.const 8
          i32.add
          local.get 3
          i32.add
          i32.const -2
          i32.add
          local.get 0
          i32.const 15
          i32.and
          i32.load8_u offset=1048807
          i32.store8
          local.get 3
          i32.const -1
          i32.add
          local.set 3
          local.get 0
          i32.const 15
          i32.gt_u
          local.set 4
          local.get 0
          i32.const 4
          i32.shr_u
          local.set 0
          local.get 4
          br_if 0 (;@3;)
        end
        local.get 1
        i32.const 1
        i32.const 1048596
        i32.const 2
        local.get 2
        i32.const 8
        i32.add
        local.get 3
        i32.add
        i32.const -1
        i32.add
        i32.const 9
        local.get 3
        i32.sub
        call 2
        local.set 0
        br 1 (;@1;)
      end
      local.get 0
      i32.load
      local.set 0
      i32.const 9
      local.set 3
      loop  ;; label = @2
        local.get 2
        i32.const 8
        i32.add
        local.get 3
        i32.add
        i32.const -2
        i32.add
        local.get 0
        i32.const 15
        i32.and
        i32.load8_u offset=1048823
        i32.store8
        local.get 3
        i32.const -1
        i32.add
        local.set 3
        local.get 0
        i32.const 15
        i32.gt_u
        local.set 4
        local.get 0
        i32.const 4
        i32.shr_u
        local.set 0
        local.get 4
        br_if 0 (;@2;)
      end
      local.get 1
      i32.const 1
      i32.const 1048596
      i32.const 2
      local.get 2
      i32.const 8
      i32.add
      local.get 3
      i32.add
      i32.const -1
      i32.add
      i32.const 9
      local.get 3
      i32.sub
      call 2
      local.set 0
    end
    local.get 2
    i32.const 16
    i32.add
    global.set 0
    local.get 0)
  (func (;1;) (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    i32.const 10
    local.set 3
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load
        local.tee 4
        local.get 4
        i32.const 31
        i32.shr_s
        local.tee 0
        i32.xor
        local.get 0
        i32.sub
        local.tee 0
        i32.const 1000
        i32.ge_u
        br_if 0 (;@2;)
        local.get 0
        local.set 5
        br 1 (;@1;)
      end
      i32.const 10
      local.set 3
      loop  ;; label = @2
        local.get 2
        i32.const 6
        i32.add
        local.get 3
        i32.add
        local.tee 6
        i32.const -4
        i32.add
        local.get 0
        local.get 0
        i32.const 10000
        i32.div_u
        local.tee 5
        i32.const 10000
        i32.mul
        i32.sub
        local.tee 7
        i32.const 65535
        i32.and
        i32.const 100
        i32.div_u
        local.tee 8
        i32.const 1
        i32.shl
        i32.load16_u offset=1048607 align=1
        i32.store16 align=1
        local.get 6
        i32.const -2
        i32.add
        local.get 7
        local.get 8
        i32.const 100
        i32.mul
        i32.sub
        i32.const 65535
        i32.and
        i32.const 1
        i32.shl
        i32.load16_u offset=1048607 align=1
        i32.store16 align=1
        local.get 3
        i32.const -4
        i32.add
        local.set 3
        local.get 0
        i32.const 9999999
        i32.gt_u
        local.set 6
        local.get 5
        local.set 0
        local.get 6
        br_if 0 (;@2;)
      end
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 5
        i32.const 9
        i32.gt_u
        br_if 0 (;@2;)
        local.get 5
        local.set 0
        br 1 (;@1;)
      end
      local.get 2
      i32.const 6
      i32.add
      local.get 3
      i32.const -2
      i32.add
      local.tee 3
      i32.add
      local.get 5
      local.get 5
      i32.const 65535
      i32.and
      i32.const 100
      i32.div_u
      local.tee 0
      i32.const 100
      i32.mul
      i32.sub
      i32.const 65535
      i32.and
      i32.const 1
      i32.shl
      i32.load16_u offset=1048607 align=1
      i32.store16 align=1
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 2
      i32.const 6
      i32.add
      local.get 3
      i32.const -1
      i32.add
      local.tee 3
      i32.add
      local.get 0
      i32.const 1
      i32.shl
      i32.load8_u offset=1048608
      i32.store8
    end
    local.get 1
    local.get 4
    i32.const -1
    i32.xor
    i32.const 31
    i32.shr_u
    i32.const 1
    i32.const 0
    local.get 2
    i32.const 6
    i32.add
    local.get 3
    i32.add
    i32.const 10
    local.get 3
    i32.sub
    call 2
    local.set 0
    local.get 2
    i32.const 16
    i32.add
    global.set 0
    local.get 0)
  (func (;2;) (type 4) (param i32 i32 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i64)
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        br_if 0 (;@2;)
        local.get 5
        i32.const 1
        i32.add
        local.set 6
        local.get 0
        i32.load offset=8
        local.set 7
        i32.const 45
        local.set 8
        br 1 (;@1;)
      end
      i32.const 43
      i32.const 1114112
      local.get 0
      i32.load offset=8
      local.tee 7
      i32.const 2097152
      i32.and
      local.tee 1
      select
      local.set 8
      local.get 1
      i32.const 21
      i32.shr_u
      local.get 5
      i32.add
      local.set 6
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 7
        i32.const 8388608
        i32.and
        br_if 0 (;@2;)
        i32.const 0
        local.set 2
        br 1 (;@1;)
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          i32.const 0
          local.set 1
          br 1 (;@2;)
        end
        local.get 2
        i32.load8_s
        i32.const -65
        i32.gt_s
        local.set 1
        local.get 3
        i32.const 1
        i32.eq
        br_if 0 (;@2;)
        local.get 1
        local.get 2
        i32.load8_s offset=1
        i32.const -65
        i32.gt_s
        i32.add
        local.set 1
      end
      local.get 1
      local.get 6
      i32.add
      local.set 6
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 6
        local.get 0
        i32.load16_u offset=12
        local.tee 9
        i32.ge_u
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 7
              i32.const 16777216
              i32.and
              br_if 0 (;@5;)
              local.get 9
              local.get 6
              i32.sub
              local.set 9
              i32.const 0
              local.set 1
              i32.const 0
              local.set 10
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 7
                    i32.const 29
                    i32.shr_u
                    i32.const 3
                    i32.and
                    br_table 2 (;@6;) 0 (;@8;) 1 (;@7;) 0 (;@8;) 2 (;@6;)
                  end
                  local.get 9
                  local.set 10
                  br 1 (;@6;)
                end
                local.get 9
                i32.const 65534
                i32.and
                i32.const 1
                i32.shr_u
                local.set 10
              end
              local.get 7
              i32.const 2097151
              i32.and
              local.set 11
              local.get 0
              i32.load offset=4
              local.set 6
              local.get 0
              i32.load
              local.set 0
              loop  ;; label = @6
                local.get 1
                i32.const 65535
                i32.and
                local.get 10
                i32.const 65535
                i32.and
                i32.ge_u
                br_if 2 (;@4;)
                i32.const 1
                local.set 7
                local.get 1
                i32.const 1
                i32.add
                local.set 1
                local.get 0
                local.get 11
                local.get 6
                i32.load offset=16
                call_indirect (type 0)
                i32.eqz
                br_if 0 (;@6;)
                br 5 (;@1;)
              end
            end
            local.get 0
            local.get 0
            i64.load offset=8 align=4
            local.tee 12
            i32.wrap_i64
            i32.const -1612709888
            i32.and
            i32.const 536870960
            i32.or
            i32.store offset=8
            i32.const 1
            local.set 7
            local.get 0
            i32.load
            local.tee 11
            local.get 0
            i32.load offset=4
            local.tee 10
            local.get 8
            local.get 2
            local.get 3
            call 15
            br_if 3 (;@1;)
            i32.const 0
            local.set 1
            local.get 9
            local.get 6
            i32.sub
            i32.const 65535
            i32.and
            local.set 6
            loop  ;; label = @5
              local.get 1
              i32.const 65535
              i32.and
              local.get 6
              i32.ge_u
              br_if 2 (;@3;)
              i32.const 1
              local.set 7
              local.get 1
              i32.const 1
              i32.add
              local.set 1
              local.get 11
              i32.const 48
              local.get 10
              i32.load offset=16
              call_indirect (type 0)
              i32.eqz
              br_if 0 (;@5;)
              br 4 (;@1;)
            end
          end
          i32.const 1
          local.set 7
          local.get 0
          local.get 6
          local.get 8
          local.get 2
          local.get 3
          call 15
          br_if 2 (;@1;)
          local.get 0
          local.get 4
          local.get 5
          local.get 6
          i32.load offset=12
          call_indirect (type 1)
          br_if 2 (;@1;)
          local.get 9
          local.get 10
          i32.sub
          i32.const 65535
          i32.and
          local.set 10
          i32.const 0
          local.set 1
          loop  ;; label = @4
            block  ;; label = @5
              local.get 1
              i32.const 65535
              i32.and
              local.get 10
              i32.lt_u
              br_if 0 (;@5;)
              i32.const 0
              return
            end
            i32.const 1
            local.set 7
            local.get 1
            i32.const 1
            i32.add
            local.set 1
            local.get 0
            local.get 11
            local.get 6
            i32.load offset=16
            call_indirect (type 0)
            i32.eqz
            br_if 0 (;@4;)
            br 3 (;@1;)
          end
        end
        i32.const 1
        local.set 7
        local.get 11
        local.get 4
        local.get 5
        local.get 10
        i32.load offset=12
        call_indirect (type 1)
        br_if 1 (;@1;)
        local.get 0
        local.get 12
        i64.store offset=8 align=4
        i32.const 0
        return
      end
      i32.const 1
      local.set 7
      local.get 0
      i32.load
      local.tee 1
      local.get 0
      i32.load offset=4
      local.tee 0
      local.get 8
      local.get 2
      local.get 3
      call 15
      br_if 0 (;@1;)
      local.get 1
      local.get 4
      local.get 5
      local.get 0
      i32.load offset=12
      call_indirect (type 1)
      local.set 7
    end
    local.get 7)
  (func (;3;) (type 0) (param i32 i32) (result i32)
    local.get 1
    local.get 0
    i32.add)
  (func (;4;) (type 5)
    (local i32 i64 i64 i64 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 112
    i32.sub
    local.tee 0
    global.set 0
    local.get 0
    i32.const 0
    i32.store offset=12
    local.get 0
    i32.const 2
    i32.store offset=20
    local.get 0
    i32.const 1048580
    i32.store offset=16
    local.get 0
    i64.const 1
    i64.store offset=28 align=4
    local.get 0
    i32.const 1
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 0
    i32.const 12
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=40
    local.get 0
    local.get 0
    i32.const 40
    i32.add
    i32.store offset=24
    local.get 0
    i32.const 6
    i32.store offset=52
    local.get 0
    i32.const 1050420
    i32.store offset=48
    block  ;; label = @1
      i32.const 0
      i32.load8_u offset=1051360
      i32.const 3
      i32.eq
      br_if 0 (;@1;)
      call 5
    end
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      i32.const 0
                      i64.load offset=1051824
                      local.tee 1
                      i64.const 0
                      i64.ne
                      br_if 0 (;@9;)
                      i32.const 0
                      i64.load offset=1051832
                      local.set 2
                      loop  ;; label = @10
                        local.get 2
                        i64.const -1
                        i64.eq
                        br_if 2 (;@8;)
                        i32.const 0
                        local.get 2
                        i64.const 1
                        i64.add
                        local.tee 1
                        i32.const 0
                        i64.load offset=1051832
                        local.tee 3
                        local.get 3
                        local.get 2
                        i64.eq
                        local.tee 4
                        select
                        i64.store offset=1051832
                        local.get 3
                        local.set 2
                        local.get 4
                        i32.eqz
                        br_if 0 (;@10;)
                      end
                      i32.const 0
                      local.get 1
                      i64.store offset=1051824
                    end
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 1
                        i32.const 0
                        i64.load offset=1051320
                        i64.eq
                        br_if 0 (;@10;)
                        i32.const 0
                        i32.load8_u offset=1051332
                        local.set 5
                        i32.const 1
                        local.set 4
                        i32.const 0
                        i32.const 1
                        i32.store8 offset=1051332
                        local.get 0
                        local.get 5
                        i32.store8 offset=72
                        local.get 5
                        br_if 3 (;@7;)
                        i32.const 0
                        local.get 1
                        i64.store offset=1051320
                        br 1 (;@9;)
                      end
                      i32.const 0
                      i32.load offset=1051328
                      local.tee 4
                      i32.const -1
                      i32.eq
                      br_if 3 (;@6;)
                      local.get 4
                      i32.const 1
                      i32.add
                      local.set 4
                    end
                    i32.const 0
                    local.get 4
                    i32.store offset=1051328
                    local.get 0
                    i32.const 1051320
                    i32.store offset=64
                    local.get 0
                    i32.const 4
                    i32.store8 offset=56
                    local.get 0
                    local.get 0
                    i64.load offset=56
                    local.tee 2
                    i64.store offset=72
                    local.get 0
                    local.get 0
                    i32.const 64
                    i32.add
                    i32.store offset=80
                    local.get 0
                    i32.const 72
                    i32.add
                    i32.const 1049628
                    local.get 0
                    i32.const 16
                    i32.add
                    call 6
                    local.set 5
                    local.get 0
                    i32.load8_u offset=72
                    local.set 4
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          local.get 5
                          i32.eqz
                          br_if 0 (;@11;)
                          local.get 4
                          i32.const 4
                          i32.ne
                          br_if 1 (;@10;)
                          local.get 0
                          i32.const 0
                          i32.store offset=104
                          local.get 0
                          i32.const 1
                          i32.store offset=92
                          local.get 0
                          i32.const 1049604
                          i32.store offset=88
                          local.get 0
                          i64.const 4
                          i64.store offset=96 align=4
                          local.get 0
                          i32.const 88
                          i32.add
                          i32.const 1049612
                          call 7
                          unreachable
                        end
                        local.get 0
                        i32.load offset=76
                        local.set 5
                        block  ;; label = @11
                          local.get 4
                          i32.const 4
                          i32.gt_u
                          br_if 0 (;@11;)
                          local.get 4
                          i32.const 3
                          i32.ne
                          br_if 2 (;@9;)
                        end
                        local.get 5
                        i32.load
                        local.set 4
                        block  ;; label = @11
                          local.get 5
                          i32.const 4
                          i32.add
                          i32.load
                          local.tee 6
                          i32.load
                          local.tee 7
                          i32.eqz
                          br_if 0 (;@11;)
                          local.get 4
                          local.get 7
                          call_indirect (type 2)
                        end
                        block  ;; label = @11
                          local.get 6
                          i32.load offset=4
                          local.tee 6
                          i32.eqz
                          br_if 0 (;@11;)
                          local.get 4
                          i32.const -4
                          i32.add
                          i32.load
                          local.tee 7
                          i32.const -8
                          i32.and
                          local.tee 8
                          i32.const 4
                          i32.const 8
                          local.get 7
                          i32.const 3
                          i32.and
                          local.tee 7
                          select
                          local.get 6
                          i32.add
                          i32.lt_u
                          br_if 6 (;@5;)
                          block  ;; label = @12
                            local.get 7
                            i32.eqz
                            br_if 0 (;@12;)
                            local.get 8
                            local.get 6
                            i32.const 39
                            i32.add
                            i32.gt_u
                            br_if 8 (;@4;)
                          end
                          local.get 4
                          call 8
                        end
                        local.get 5
                        i32.const -4
                        i32.add
                        i32.load
                        local.tee 4
                        i32.const -8
                        i32.and
                        local.tee 6
                        i32.const 16
                        i32.const 20
                        local.get 4
                        i32.const 3
                        i32.and
                        local.tee 4
                        select
                        i32.lt_u
                        br_if 7 (;@3;)
                        block  ;; label = @11
                          local.get 4
                          i32.eqz
                          br_if 0 (;@11;)
                          local.get 6
                          i32.const 52
                          i32.ge_u
                          br_if 9 (;@2;)
                        end
                        local.get 5
                        call 8
                        br 1 (;@9;)
                      end
                      local.get 0
                      i64.load offset=72
                      local.set 2
                    end
                    local.get 0
                    i32.load offset=64
                    local.tee 4
                    local.get 4
                    i32.load offset=8
                    i32.const -1
                    i32.add
                    local.tee 5
                    i32.store offset=8
                    local.get 2
                    i64.const 255
                    i64.and
                    local.set 3
                    block  ;; label = @9
                      local.get 5
                      br_if 0 (;@9;)
                      local.get 4
                      i32.const 0
                      i32.store8 offset=12
                      local.get 4
                      i64.const 0
                      i64.store
                    end
                    local.get 3
                    i64.const 4
                    i64.ne
                    br_if 7 (;@1;)
                    local.get 0
                    i32.const 112
                    i32.add
                    global.set 0
                    return
                  end
                  call 9
                  unreachable
                end
                local.get 0
                i64.const 0
                i64.store offset=100 align=4
                local.get 0
                i64.const 17179869185
                i64.store offset=92 align=4
                local.get 0
                i32.const 1050596
                i32.store offset=88
                local.get 0
                i32.const 72
                i32.add
                local.get 0
                i32.const 88
                i32.add
                call 10
                unreachable
              end
              call 11
              unreachable
            end
            i32.const 1050840
            i32.const 1050888
            call 12
            unreachable
          end
          i32.const 1050904
          i32.const 1050952
          call 12
          unreachable
        end
        i32.const 1050840
        i32.const 1050888
        call 12
        unreachable
      end
      i32.const 1050904
      i32.const 1050952
      call 12
      unreachable
    end
    local.get 0
    local.get 2
    i64.store offset=64
    local.get 0
    i32.const 2
    i32.store offset=92
    local.get 0
    i32.const 1050448
    i32.store offset=88
    local.get 0
    i64.const 2
    i64.store offset=100 align=4
    local.get 0
    i32.const 2
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 0
    i32.const 64
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=80
    local.get 0
    i32.const 3
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 0
    i32.const 48
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=72
    local.get 0
    local.get 0
    i32.const 72
    i32.add
    i32.store offset=96
    local.get 0
    i32.const 88
    i32.add
    i32.const 1050464
    call 7
    unreachable)
  (func (;5;) (type 5)
    (local i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 0
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            i32.const 0
            i32.load8_u offset=1051360
            br_table 0 (;@4;) 0 (;@4;) 3 (;@1;) 1 (;@3;) 0 (;@4;)
          end
          i32.const 0
          i32.const 2
          i32.store8 offset=1051360
          i32.const 1024
          call 32
          local.tee 1
          i32.eqz
          br_if 1 (;@2;)
          i32.const 0
          i32.const 3
          i32.store8 offset=1051360
          i32.const 0
          local.get 1
          i32.store offset=1051344
          i32.const 0
          i64.const 4398046511104
          i64.store offset=1051336
          i32.const 0
          i64.const 0
          i64.store offset=1051320
          i32.const 0
          i32.const 0
          i32.store8 offset=1051352
          i32.const 0
          i32.const 0
          i32.store offset=1051348
          i32.const 0
          i32.const 0
          i32.store8 offset=1051332
          i32.const 0
          i32.const 0
          i32.store offset=1051328
        end
        local.get 0
        i32.const 32
        i32.add
        global.set 0
        return
      end
      unreachable
    end
    local.get 0
    i32.const 0
    i32.store offset=24
    local.get 0
    i32.const 1
    i32.store offset=12
    local.get 0
    i32.const 1050556
    i32.store offset=8
    local.get 0
    i64.const 4
    i64.store offset=16 align=4
    local.get 0
    i32.const 8
    i32.add
    i32.const 1050676
    call 7
    unreachable)
  (func (;6;) (type 1) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    local.get 1
    i32.store offset=4
    local.get 3
    local.get 0
    i32.store
    local.get 3
    i64.const 3758096416
    i64.store offset=8 align=4
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              i32.load offset=16
              local.tee 4
              i32.eqz
              br_if 0 (;@5;)
              local.get 2
              i32.load offset=20
              local.tee 1
              br_if 1 (;@4;)
              br 2 (;@3;)
            end
            local.get 2
            i32.load offset=12
            local.tee 0
            i32.eqz
            br_if 1 (;@3;)
            local.get 2
            i32.load offset=8
            local.tee 1
            local.get 0
            i32.const 3
            i32.shl
            local.tee 0
            i32.add
            local.set 5
            local.get 0
            i32.const -8
            i32.add
            i32.const 3
            i32.shr_u
            i32.const 1
            i32.add
            local.set 6
            local.get 2
            i32.load
            local.set 0
            loop  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.const 4
                i32.add
                i32.load
                local.tee 7
                i32.eqz
                br_if 0 (;@6;)
                local.get 3
                i32.load
                local.get 0
                i32.load
                local.get 7
                local.get 3
                i32.load offset=4
                i32.load offset=12
                call_indirect (type 1)
                i32.eqz
                br_if 0 (;@6;)
                i32.const 1
                local.set 1
                br 5 (;@1;)
              end
              block  ;; label = @6
                local.get 1
                i32.load
                local.get 3
                local.get 1
                i32.const 4
                i32.add
                i32.load
                call_indirect (type 0)
                i32.eqz
                br_if 0 (;@6;)
                i32.const 1
                local.set 1
                br 5 (;@1;)
              end
              local.get 0
              i32.const 8
              i32.add
              local.set 0
              local.get 1
              i32.const 8
              i32.add
              local.tee 1
              local.get 5
              i32.eq
              br_if 3 (;@2;)
              br 0 (;@5;)
            end
          end
          local.get 1
          i32.const 24
          i32.mul
          local.set 8
          local.get 1
          i32.const -1
          i32.add
          i32.const 536870911
          i32.and
          i32.const 1
          i32.add
          local.set 6
          local.get 2
          i32.load offset=8
          local.set 9
          local.get 2
          i32.load
          local.set 0
          i32.const 0
          local.set 7
          loop  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.const 4
              i32.add
              i32.load
              local.tee 1
              i32.eqz
              br_if 0 (;@5;)
              local.get 3
              i32.load
              local.get 0
              i32.load
              local.get 1
              local.get 3
              i32.load offset=4
              i32.load offset=12
              call_indirect (type 1)
              i32.eqz
              br_if 0 (;@5;)
              i32.const 1
              local.set 1
              br 4 (;@1;)
            end
            i32.const 0
            local.set 5
            i32.const 0
            local.set 10
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 4
                  local.get 7
                  i32.add
                  local.tee 1
                  i32.const 8
                  i32.add
                  i32.load16_u
                  br_table 0 (;@7;) 1 (;@6;) 2 (;@5;) 0 (;@7;)
                end
                local.get 1
                i32.const 10
                i32.add
                i32.load16_u
                local.set 10
                br 1 (;@5;)
              end
              local.get 9
              local.get 1
              i32.const 12
              i32.add
              i32.load
              i32.const 3
              i32.shl
              i32.add
              i32.load16_u offset=4
              local.set 10
            end
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 1
                  i32.load16_u
                  br_table 0 (;@7;) 1 (;@6;) 2 (;@5;) 0 (;@7;)
                end
                local.get 1
                i32.const 2
                i32.add
                i32.load16_u
                local.set 5
                br 1 (;@5;)
              end
              local.get 9
              local.get 1
              i32.const 4
              i32.add
              i32.load
              i32.const 3
              i32.shl
              i32.add
              i32.load16_u offset=4
              local.set 5
            end
            local.get 3
            local.get 5
            i32.store16 offset=14
            local.get 3
            local.get 10
            i32.store16 offset=12
            local.get 3
            local.get 1
            i32.const 20
            i32.add
            i32.load
            i32.store offset=8
            block  ;; label = @5
              local.get 9
              local.get 1
              i32.const 16
              i32.add
              i32.load
              i32.const 3
              i32.shl
              i32.add
              local.tee 1
              i32.load
              local.get 3
              local.get 1
              i32.load offset=4
              call_indirect (type 0)
              i32.eqz
              br_if 0 (;@5;)
              i32.const 1
              local.set 1
              br 4 (;@1;)
            end
            local.get 0
            i32.const 8
            i32.add
            local.set 0
            local.get 8
            local.get 7
            i32.const 24
            i32.add
            local.tee 7
            i32.eq
            br_if 2 (;@2;)
            br 0 (;@4;)
          end
        end
        i32.const 0
        local.set 6
      end
      block  ;; label = @2
        local.get 6
        local.get 2
        i32.load offset=4
        i32.ge_u
        br_if 0 (;@2;)
        local.get 3
        i32.load
        local.get 2
        i32.load
        local.get 6
        i32.const 3
        i32.shl
        i32.add
        local.tee 1
        i32.load
        local.get 1
        i32.load offset=4
        local.get 3
        i32.load offset=4
        i32.load offset=12
        call_indirect (type 1)
        i32.eqz
        br_if 0 (;@2;)
        i32.const 1
        local.set 1
        br 1 (;@1;)
      end
      i32.const 0
      local.set 1
    end
    local.get 3
    i32.const 16
    i32.add
    global.set 0
    local.get 1)
  (func (;7;) (type 3) (param i32 i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    i32.const 1
    i32.store16 offset=12
    local.get 2
    local.get 1
    i32.store offset=8
    local.get 2
    local.get 0
    i32.store offset=4
    local.get 2
    i32.const 4
    i32.add
    call 21
    unreachable)
  (func (;8;) (type 2) (param i32)
    (local i32 i32 i32 i32 i32)
    local.get 0
    i32.const -8
    i32.add
    local.tee 1
    local.get 0
    i32.const -4
    i32.add
    i32.load
    local.tee 2
    i32.const -8
    i32.and
    local.tee 0
    i32.add
    local.set 3
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.const 1
        i32.and
        br_if 0 (;@2;)
        local.get 2
        i32.const 2
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 1
        i32.load
        local.tee 2
        local.get 0
        i32.add
        local.set 0
        block  ;; label = @3
          local.get 1
          local.get 2
          i32.sub
          local.tee 1
          i32.const 0
          i32.load offset=1051792
          i32.ne
          br_if 0 (;@3;)
          local.get 3
          i32.load offset=4
          i32.const 3
          i32.and
          i32.const 3
          i32.ne
          br_if 1 (;@2;)
          i32.const 0
          local.get 0
          i32.store offset=1051784
          local.get 3
          local.get 3
          i32.load offset=4
          i32.const -2
          i32.and
          i32.store offset=4
          local.get 1
          local.get 0
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 3
          local.get 0
          i32.store
          return
        end
        local.get 1
        local.get 2
        call 34
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 3
                      i32.load offset=4
                      local.tee 2
                      i32.const 2
                      i32.and
                      br_if 0 (;@9;)
                      local.get 3
                      i32.const 0
                      i32.load offset=1051796
                      i32.eq
                      br_if 2 (;@7;)
                      local.get 3
                      i32.const 0
                      i32.load offset=1051792
                      i32.eq
                      br_if 3 (;@6;)
                      local.get 3
                      local.get 2
                      i32.const -8
                      i32.and
                      local.tee 2
                      call 34
                      local.get 1
                      local.get 2
                      local.get 0
                      i32.add
                      local.tee 0
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get 1
                      local.get 0
                      i32.add
                      local.get 0
                      i32.store
                      local.get 1
                      i32.const 0
                      i32.load offset=1051792
                      i32.ne
                      br_if 1 (;@8;)
                      i32.const 0
                      local.get 0
                      i32.store offset=1051784
                      return
                    end
                    local.get 3
                    local.get 2
                    i32.const -2
                    i32.and
                    i32.store offset=4
                    local.get 1
                    local.get 0
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    local.get 1
                    local.get 0
                    i32.add
                    local.get 0
                    i32.store
                  end
                  local.get 0
                  i32.const 256
                  i32.lt_u
                  br_if 2 (;@5;)
                  i32.const 31
                  local.set 3
                  block  ;; label = @8
                    local.get 0
                    i32.const 16777215
                    i32.gt_u
                    br_if 0 (;@8;)
                    local.get 0
                    i32.const 38
                    local.get 0
                    i32.const 8
                    i32.shr_u
                    i32.clz
                    local.tee 3
                    i32.sub
                    i32.shr_u
                    i32.const 1
                    i32.and
                    local.get 3
                    i32.const 1
                    i32.shl
                    i32.sub
                    i32.const 62
                    i32.add
                    local.set 3
                  end
                  local.get 1
                  i64.const 0
                  i64.store offset=16 align=4
                  local.get 1
                  local.get 3
                  i32.store offset=28
                  local.get 3
                  i32.const 2
                  i32.shl
                  i32.const 1051368
                  i32.add
                  local.set 2
                  i32.const 0
                  i32.load offset=1051780
                  i32.const 1
                  local.get 3
                  i32.shl
                  local.tee 4
                  i32.and
                  br_if 3 (;@4;)
                  local.get 2
                  local.get 1
                  i32.store
                  local.get 1
                  local.get 2
                  i32.store offset=24
                  local.get 1
                  local.get 1
                  i32.store offset=12
                  local.get 1
                  local.get 1
                  i32.store offset=8
                  i32.const 0
                  i32.const 0
                  i32.load offset=1051780
                  local.get 4
                  i32.or
                  i32.store offset=1051780
                  br 4 (;@3;)
                end
                i32.const 0
                local.get 1
                i32.store offset=1051796
                i32.const 0
                i32.const 0
                i32.load offset=1051788
                local.get 0
                i32.add
                local.tee 0
                i32.store offset=1051788
                local.get 1
                local.get 0
                i32.const 1
                i32.or
                i32.store offset=4
                block  ;; label = @7
                  local.get 1
                  i32.const 0
                  i32.load offset=1051792
                  i32.ne
                  br_if 0 (;@7;)
                  i32.const 0
                  i32.const 0
                  i32.store offset=1051784
                  i32.const 0
                  i32.const 0
                  i32.store offset=1051792
                end
                local.get 0
                i32.const 0
                i32.load offset=1051808
                local.tee 4
                i32.le_u
                br_if 5 (;@1;)
                i32.const 0
                i32.load offset=1051796
                local.tee 0
                i32.eqz
                br_if 5 (;@1;)
                i32.const 0
                local.set 2
                i32.const 0
                i32.load offset=1051788
                local.tee 5
                i32.const 41
                i32.lt_u
                br_if 4 (;@2;)
                i32.const 1051496
                local.set 1
                loop  ;; label = @7
                  block  ;; label = @8
                    local.get 1
                    i32.load
                    local.tee 3
                    local.get 0
                    i32.gt_u
                    br_if 0 (;@8;)
                    local.get 0
                    local.get 3
                    local.get 1
                    i32.load offset=4
                    i32.add
                    i32.lt_u
                    br_if 6 (;@2;)
                  end
                  local.get 1
                  i32.load offset=8
                  local.set 1
                  br 0 (;@7;)
                end
              end
              i32.const 0
              local.get 1
              i32.store offset=1051792
              i32.const 0
              i32.const 0
              i32.load offset=1051784
              local.get 0
              i32.add
              local.tee 0
              i32.store offset=1051784
              local.get 1
              local.get 0
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 1
              local.get 0
              i32.add
              local.get 0
              i32.store
              return
            end
            block  ;; label = @5
              block  ;; label = @6
                i32.const 0
                i32.load offset=1051776
                local.tee 3
                i32.const 1
                local.get 0
                i32.const 3
                i32.shr_u
                i32.shl
                local.tee 2
                i32.and
                br_if 0 (;@6;)
                i32.const 0
                local.get 3
                local.get 2
                i32.or
                i32.store offset=1051776
                local.get 0
                i32.const 248
                i32.and
                i32.const 1051512
                i32.add
                local.tee 0
                local.set 3
                br 1 (;@5;)
              end
              local.get 0
              i32.const 248
              i32.and
              local.tee 0
              i32.const 1051512
              i32.add
              local.set 3
              local.get 0
              i32.const 1051520
              i32.add
              i32.load
              local.set 0
            end
            local.get 3
            local.get 1
            i32.store offset=8
            local.get 0
            local.get 1
            i32.store offset=12
            local.get 1
            local.get 3
            i32.store offset=12
            local.get 1
            local.get 0
            i32.store offset=8
            return
          end
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 2
                i32.load
                local.tee 4
                i32.load offset=4
                i32.const -8
                i32.and
                local.get 0
                i32.ne
                br_if 0 (;@6;)
                local.get 4
                local.set 3
                br 1 (;@5;)
              end
              local.get 0
              i32.const 0
              i32.const 25
              local.get 3
              i32.const 1
              i32.shr_u
              i32.sub
              local.get 3
              i32.const 31
              i32.eq
              select
              i32.shl
              local.set 2
              loop  ;; label = @6
                local.get 4
                local.get 2
                i32.const 29
                i32.shr_u
                i32.const 4
                i32.and
                i32.add
                local.tee 5
                i32.load offset=16
                local.tee 3
                i32.eqz
                br_if 2 (;@4;)
                local.get 2
                i32.const 1
                i32.shl
                local.set 2
                local.get 3
                local.set 4
                local.get 3
                i32.load offset=4
                i32.const -8
                i32.and
                local.get 0
                i32.ne
                br_if 0 (;@6;)
              end
            end
            local.get 3
            i32.load offset=8
            local.tee 0
            local.get 1
            i32.store offset=12
            local.get 3
            local.get 1
            i32.store offset=8
            local.get 1
            i32.const 0
            i32.store offset=24
            local.get 1
            local.get 3
            i32.store offset=12
            local.get 1
            local.get 0
            i32.store offset=8
            br 1 (;@3;)
          end
          local.get 5
          i32.const 16
          i32.add
          local.get 1
          i32.store
          local.get 1
          local.get 4
          i32.store offset=24
          local.get 1
          local.get 1
          i32.store offset=12
          local.get 1
          local.get 1
          i32.store offset=8
        end
        i32.const 0
        local.set 1
        i32.const 0
        i32.const 0
        i32.load offset=1051816
        i32.const -1
        i32.add
        local.tee 0
        i32.store offset=1051816
        local.get 0
        br_if 1 (;@1;)
        block  ;; label = @3
          i32.const 0
          i32.load offset=1051504
          local.tee 0
          i32.eqz
          br_if 0 (;@3;)
          i32.const 0
          local.set 1
          loop  ;; label = @4
            local.get 1
            i32.const 1
            i32.add
            local.set 1
            local.get 0
            i32.load offset=8
            local.tee 0
            br_if 0 (;@4;)
          end
        end
        i32.const 0
        local.get 1
        i32.const 4095
        local.get 1
        i32.const 4095
        i32.gt_u
        select
        i32.store offset=1051816
        return
      end
      block  ;; label = @2
        i32.const 0
        i32.load offset=1051504
        local.tee 1
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        local.set 2
        loop  ;; label = @3
          local.get 2
          i32.const 1
          i32.add
          local.set 2
          local.get 1
          i32.load offset=8
          local.tee 1
          br_if 0 (;@3;)
        end
      end
      i32.const 0
      local.get 2
      i32.const 4095
      local.get 2
      i32.const 4095
      i32.gt_u
      select
      i32.store offset=1051816
      local.get 5
      local.get 4
      i32.le_u
      br_if 0 (;@1;)
      i32.const 0
      i32.const -1
      i32.store offset=1051808
    end)
  (func (;9;) (type 5)
    (local i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 0
    global.set 0
    local.get 0
    i32.const 0
    i32.store offset=24
    local.get 0
    i32.const 1
    i32.store offset=12
    local.get 0
    i32.const 1050748
    i32.store offset=8
    local.get 0
    i64.const 4
    i64.store offset=16 align=4
    local.get 0
    i32.const 8
    i32.add
    i32.const 1050756
    call 7
    unreachable)
  (func (;10;) (type 3) (param i32 i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    i32.const 1049314
    i32.store offset=12
    local.get 2
    local.get 0
    i32.store offset=8
    local.get 2
    i32.const 8
    i32.add
    local.get 2
    i32.const 12
    i32.add
    local.get 1
    call 23
    unreachable)
  (func (;11;) (type 5)
    (local i32)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 0
    global.set 0
    local.get 0
    i32.const 38
    i32.store offset=12
    local.get 0
    i32.const 1050620
    i32.store offset=8
    local.get 0
    i32.const 1
    i32.store offset=20
    local.get 0
    i32.const 1049508
    i32.store offset=16
    local.get 0
    i64.const 1
    i64.store offset=28 align=4
    local.get 0
    i32.const 3
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 0
    i32.const 8
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=40
    local.get 0
    local.get 0
    i32.const 40
    i32.add
    i32.store offset=24
    local.get 0
    i32.const 16
    i32.add
    i32.const 1050660
    call 7
    unreachable)
  (func (;12;) (type 3) (param i32 i32)
    (local i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    i32.const 0
    i32.store offset=16
    local.get 2
    i32.const 1
    i32.store offset=4
    local.get 2
    i64.const 4
    i64.store offset=8 align=4
    local.get 2
    i32.const 46
    i32.store offset=28
    local.get 2
    local.get 0
    i32.store offset=24
    local.get 2
    local.get 2
    i32.const 24
    i32.add
    i32.store
    local.get 2
    local.get 1
    call 7
    unreachable)
  (func (;13;) (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32)
    global.get 0
    i32.const 64
    i32.sub
    local.tee 2
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 0
                    i32.load8_u
                    br_table 0 (;@8;) 1 (;@7;) 2 (;@6;) 3 (;@5;) 0 (;@8;)
                  end
                  local.get 2
                  local.get 0
                  i32.load offset=4
                  i32.store offset=8
                  i32.const 20
                  call 32
                  local.tee 0
                  i32.eqz
                  br_if 4 (;@3;)
                  local.get 0
                  i32.const 16
                  i32.add
                  i32.const 0
                  i32.load offset=1050496 align=1
                  i32.store align=1
                  local.get 0
                  i32.const 8
                  i32.add
                  i32.const 0
                  i64.load offset=1050488 align=1
                  i64.store align=1
                  local.get 0
                  i32.const 0
                  i64.load offset=1050480 align=1
                  i64.store align=1
                  local.get 2
                  i32.const 20
                  i32.store offset=20
                  local.get 2
                  local.get 0
                  i32.store offset=16
                  local.get 2
                  i32.const 20
                  i32.store offset=12
                  local.get 2
                  i32.const 3
                  i32.store offset=44
                  local.get 2
                  i32.const 1050800
                  i32.store offset=40
                  local.get 2
                  i64.const 2
                  i64.store offset=52 align=4
                  local.get 2
                  i32.const 4
                  i64.extend_i32_u
                  i64.const 32
                  i64.shl
                  local.get 2
                  i32.const 8
                  i32.add
                  i64.extend_i32_u
                  i64.or
                  i64.store offset=32
                  local.get 2
                  i32.const 5
                  i64.extend_i32_u
                  i64.const 32
                  i64.shl
                  local.get 2
                  i32.const 12
                  i32.add
                  i64.extend_i32_u
                  i64.or
                  i64.store offset=24
                  local.get 2
                  local.get 2
                  i32.const 24
                  i32.add
                  i32.store offset=48
                  local.get 1
                  i32.load
                  local.get 1
                  i32.load offset=4
                  local.get 2
                  i32.const 40
                  i32.add
                  call 6
                  local.set 0
                  local.get 2
                  i32.load offset=12
                  local.tee 1
                  i32.eqz
                  br_if 3 (;@4;)
                  local.get 2
                  i32.load offset=16
                  local.tee 3
                  i32.const -4
                  i32.add
                  i32.load
                  local.tee 4
                  i32.const -8
                  i32.and
                  local.tee 5
                  i32.const 4
                  i32.const 8
                  local.get 4
                  i32.const 3
                  i32.and
                  local.tee 4
                  select
                  local.get 1
                  i32.add
                  i32.lt_u
                  br_if 5 (;@2;)
                  block  ;; label = @8
                    local.get 4
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 5
                    local.get 1
                    i32.const 39
                    i32.add
                    i32.gt_u
                    br_if 7 (;@1;)
                  end
                  local.get 3
                  call 8
                  br 3 (;@4;)
                end
                local.get 2
                local.get 0
                i32.load8_u offset=1
                i32.const 2
                i32.shl
                local.tee 0
                i32.load offset=1050984
                i32.store offset=16
                local.get 2
                local.get 0
                i32.load offset=1051152
                i32.store offset=12
                local.get 2
                i32.const 1
                i32.store offset=44
                local.get 2
                i32.const 1049508
                i32.store offset=40
                local.get 2
                i64.const 1
                i64.store offset=52 align=4
                local.get 2
                i32.const 3
                i64.extend_i32_u
                i64.const 32
                i64.shl
                local.get 2
                i32.const 12
                i32.add
                i64.extend_i32_u
                i64.or
                i64.store offset=24
                local.get 2
                local.get 2
                i32.const 24
                i32.add
                i32.store offset=48
                local.get 1
                i32.load
                local.get 1
                i32.load offset=4
                local.get 2
                i32.const 40
                i32.add
                call 6
                local.set 0
                br 2 (;@4;)
              end
              local.get 1
              local.get 0
              i32.load offset=4
              local.tee 0
              i32.load
              local.get 0
              i32.load offset=4
              call 22
              local.set 0
              br 1 (;@4;)
            end
            local.get 0
            i32.load offset=4
            local.tee 0
            i32.load
            local.get 1
            local.get 0
            i32.load offset=4
            i32.load offset=16
            call_indirect (type 0)
            local.set 0
          end
          local.get 2
          i32.const 64
          i32.add
          global.set 0
          local.get 0
          return
        end
        unreachable
      end
      i32.const 1050840
      i32.const 1050888
      call 12
      unreachable
    end
    i32.const 1050904
    i32.const 1050952
    call 12
    unreachable)
  (func (;14;) (type 0) (param i32 i32) (result i32)
    local.get 1
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    call 22)
  (func (;15;) (type 6) (param i32 i32 i32 i32 i32) (result i32)
    block  ;; label = @1
      local.get 2
      i32.const 1114112
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 2
      local.get 1
      i32.load offset=16
      call_indirect (type 0)
      i32.eqz
      br_if 0 (;@1;)
      i32.const 1
      return
    end
    block  ;; label = @1
      local.get 3
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    local.get 0
    local.get 3
    local.get 4
    local.get 1
    i32.load offset=12
    call_indirect (type 1))
  (func (;16;) (type 7) (param i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        local.get 2
        i32.gt_u
        br_if 0 (;@2;)
        local.get 1
        local.get 2
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        local.get 1
        i32.le_u
        br_if 1 (;@1;)
        local.get 0
        local.get 1
        local.get 3
        call 17
        unreachable
      end
      local.get 0
      local.get 2
      local.get 3
      call 18
      unreachable
    end
    local.get 1
    local.get 2
    local.get 3
    call 19
    unreachable)
  (func (;17;) (type 8) (param i32 i32 i32)
    (local i32 i64)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    local.get 1
    i32.store offset=4
    local.get 3
    local.get 0
    i32.store
    local.get 3
    i32.const 2
    i32.store offset=12
    local.get 3
    i32.const 1048944
    i32.store offset=8
    local.get 3
    i64.const 2
    i64.store offset=20 align=4
    local.get 3
    i32.const 6
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.tee 4
    local.get 3
    i32.const 4
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=40
    local.get 3
    local.get 4
    local.get 3
    i64.extend_i32_u
    i64.or
    i64.store offset=32
    local.get 3
    local.get 3
    i32.const 32
    i32.add
    i32.store offset=16
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    call 7
    unreachable)
  (func (;18;) (type 8) (param i32 i32 i32)
    (local i32 i64)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    local.get 1
    i32.store offset=4
    local.get 3
    local.get 0
    i32.store
    local.get 3
    i32.const 2
    i32.store offset=12
    local.get 3
    i32.const 1048980
    i32.store offset=8
    local.get 3
    i64.const 2
    i64.store offset=20 align=4
    local.get 3
    i32.const 6
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.tee 4
    local.get 3
    i32.const 4
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=40
    local.get 3
    local.get 4
    local.get 3
    i64.extend_i32_u
    i64.or
    i64.store offset=32
    local.get 3
    local.get 3
    i32.const 32
    i32.add
    i32.store offset=16
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    call 7
    unreachable)
  (func (;19;) (type 8) (param i32 i32 i32)
    (local i32 i64)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    local.get 1
    i32.store offset=4
    local.get 3
    local.get 0
    i32.store
    local.get 3
    i32.const 2
    i32.store offset=12
    local.get 3
    i32.const 1048892
    i32.store offset=8
    local.get 3
    i64.const 2
    i64.store offset=20 align=4
    local.get 3
    i32.const 6
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.tee 4
    local.get 3
    i32.const 4
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=40
    local.get 3
    local.get 4
    local.get 3
    i64.extend_i32_u
    i64.or
    i64.store offset=32
    local.get 3
    local.get 3
    i32.const 32
    i32.add
    i32.store offset=16
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    call 7
    unreachable)
  (func (;20;) (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    i32.const 10
    local.set 3
    local.get 0
    i32.load
    local.tee 4
    local.set 5
    block  ;; label = @1
      local.get 4
      i32.const 1000
      i32.lt_u
      br_if 0 (;@1;)
      i32.const 10
      local.set 3
      local.get 4
      local.set 0
      loop  ;; label = @2
        local.get 2
        i32.const 6
        i32.add
        local.get 3
        i32.add
        local.tee 6
        i32.const -4
        i32.add
        local.get 0
        local.get 0
        i32.const 10000
        i32.div_u
        local.tee 5
        i32.const 10000
        i32.mul
        i32.sub
        local.tee 7
        i32.const 65535
        i32.and
        i32.const 100
        i32.div_u
        local.tee 8
        i32.const 1
        i32.shl
        i32.load16_u offset=1048607 align=1
        i32.store16 align=1
        local.get 6
        i32.const -2
        i32.add
        local.get 7
        local.get 8
        i32.const 100
        i32.mul
        i32.sub
        i32.const 65535
        i32.and
        i32.const 1
        i32.shl
        i32.load16_u offset=1048607 align=1
        i32.store16 align=1
        local.get 3
        i32.const -4
        i32.add
        local.set 3
        local.get 0
        i32.const 9999999
        i32.gt_u
        local.set 6
        local.get 5
        local.set 0
        local.get 6
        br_if 0 (;@2;)
      end
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 5
        i32.const 9
        i32.gt_u
        br_if 0 (;@2;)
        local.get 5
        local.set 0
        br 1 (;@1;)
      end
      local.get 2
      i32.const 6
      i32.add
      local.get 3
      i32.const -2
      i32.add
      local.tee 3
      i32.add
      local.get 5
      local.get 5
      i32.const 65535
      i32.and
      i32.const 100
      i32.div_u
      local.tee 0
      i32.const 100
      i32.mul
      i32.sub
      i32.const 65535
      i32.and
      i32.const 1
      i32.shl
      i32.load16_u offset=1048607 align=1
      i32.store16 align=1
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 2
      i32.const 6
      i32.add
      local.get 3
      i32.const -1
      i32.add
      local.tee 3
      i32.add
      local.get 0
      i32.const 1
      i32.shl
      i32.load8_u offset=1048608
      i32.store8
    end
    local.get 1
    i32.const 1
    i32.const 1
    i32.const 0
    local.get 2
    i32.const 6
    i32.add
    local.get 3
    i32.add
    i32.const 10
    local.get 3
    i32.sub
    call 2
    local.set 0
    local.get 2
    i32.const 16
    i32.add
    global.set 0
    local.get 0)
  (func (;21;) (type 2) (param i32)
    (local i32 i64)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 1
    global.set 0
    local.get 0
    i64.load align=4
    local.set 2
    local.get 1
    local.get 0
    i32.store offset=12
    local.get 1
    local.get 2
    i64.store offset=4 align=4
    local.get 1
    i32.const 4
    i32.add
    call 35
    unreachable)
  (func (;22;) (type 1) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=8
        local.tee 3
        i32.const 402653184
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 3
                  i32.const 268435456
                  i32.and
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 0
                  i32.load16_u offset=14
                  local.tee 4
                  br_if 1 (;@6;)
                  i32.const 0
                  local.set 2
                  br 2 (;@5;)
                end
                block  ;; label = @7
                  local.get 2
                  i32.const 16
                  i32.lt_u
                  br_if 0 (;@7;)
                  local.get 2
                  local.get 1
                  local.get 1
                  i32.const 3
                  i32.add
                  i32.const -4
                  i32.and
                  local.tee 5
                  i32.sub
                  local.tee 6
                  i32.add
                  local.tee 7
                  i32.const 3
                  i32.and
                  local.set 8
                  i32.const 0
                  local.set 9
                  i32.const 0
                  local.set 10
                  block  ;; label = @8
                    local.get 1
                    local.get 5
                    i32.eq
                    br_if 0 (;@8;)
                    i32.const 0
                    local.set 4
                    i32.const 0
                    local.set 10
                    block  ;; label = @9
                      local.get 6
                      i32.const -4
                      i32.gt_u
                      br_if 0 (;@9;)
                      i32.const 0
                      local.set 4
                      i32.const 0
                      local.set 10
                      loop  ;; label = @10
                        local.get 10
                        local.get 1
                        local.get 4
                        i32.add
                        local.tee 11
                        i32.load8_s
                        i32.const -65
                        i32.gt_s
                        i32.add
                        local.get 11
                        i32.const 1
                        i32.add
                        i32.load8_s
                        i32.const -65
                        i32.gt_s
                        i32.add
                        local.get 11
                        i32.const 2
                        i32.add
                        i32.load8_s
                        i32.const -65
                        i32.gt_s
                        i32.add
                        local.get 11
                        i32.const 3
                        i32.add
                        i32.load8_s
                        i32.const -65
                        i32.gt_s
                        i32.add
                        local.set 10
                        local.get 4
                        i32.const 4
                        i32.add
                        local.tee 4
                        br_if 0 (;@10;)
                      end
                    end
                    local.get 1
                    local.get 4
                    i32.add
                    local.set 11
                    loop  ;; label = @9
                      local.get 10
                      local.get 11
                      i32.load8_s
                      i32.const -65
                      i32.gt_s
                      i32.add
                      local.set 10
                      local.get 11
                      i32.const 1
                      i32.add
                      local.set 11
                      local.get 6
                      i32.const 1
                      i32.add
                      local.tee 6
                      br_if 0 (;@9;)
                    end
                  end
                  block  ;; label = @8
                    local.get 8
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 5
                    local.get 7
                    i32.const -4
                    i32.and
                    i32.add
                    local.tee 11
                    i32.load8_s
                    i32.const -65
                    i32.gt_s
                    local.set 9
                    local.get 8
                    i32.const 1
                    i32.eq
                    br_if 0 (;@8;)
                    local.get 9
                    local.get 11
                    i32.load8_s offset=1
                    i32.const -65
                    i32.gt_s
                    i32.add
                    local.set 9
                    local.get 8
                    i32.const 2
                    i32.eq
                    br_if 0 (;@8;)
                    local.get 9
                    local.get 11
                    i32.load8_s offset=2
                    i32.const -65
                    i32.gt_s
                    i32.add
                    local.set 9
                  end
                  local.get 7
                  i32.const 2
                  i32.shr_u
                  local.set 8
                  local.get 9
                  local.get 10
                  i32.add
                  local.set 4
                  loop  ;; label = @8
                    local.get 5
                    local.set 7
                    local.get 8
                    i32.eqz
                    br_if 5 (;@3;)
                    local.get 8
                    i32.const 192
                    local.get 8
                    i32.const 192
                    i32.lt_u
                    select
                    local.tee 9
                    i32.const 3
                    i32.and
                    local.set 12
                    i32.const 0
                    local.set 11
                    block  ;; label = @9
                      local.get 9
                      i32.const 2
                      i32.shl
                      local.tee 13
                      i32.const 1008
                      i32.and
                      local.tee 5
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 7
                      local.set 10
                      loop  ;; label = @10
                        local.get 10
                        i32.const 12
                        i32.add
                        i32.load
                        local.tee 6
                        i32.const -1
                        i32.xor
                        i32.const 7
                        i32.shr_u
                        local.get 6
                        i32.const 6
                        i32.shr_u
                        i32.or
                        i32.const 16843009
                        i32.and
                        local.get 10
                        i32.const 8
                        i32.add
                        i32.load
                        local.tee 6
                        i32.const -1
                        i32.xor
                        i32.const 7
                        i32.shr_u
                        local.get 6
                        i32.const 6
                        i32.shr_u
                        i32.or
                        i32.const 16843009
                        i32.and
                        local.get 10
                        i32.const 4
                        i32.add
                        i32.load
                        local.tee 6
                        i32.const -1
                        i32.xor
                        i32.const 7
                        i32.shr_u
                        local.get 6
                        i32.const 6
                        i32.shr_u
                        i32.or
                        i32.const 16843009
                        i32.and
                        local.get 10
                        i32.load
                        local.tee 6
                        i32.const -1
                        i32.xor
                        i32.const 7
                        i32.shr_u
                        local.get 6
                        i32.const 6
                        i32.shr_u
                        i32.or
                        i32.const 16843009
                        i32.and
                        local.get 11
                        i32.add
                        i32.add
                        i32.add
                        i32.add
                        local.set 11
                        local.get 10
                        i32.const 16
                        i32.add
                        local.set 10
                        local.get 5
                        i32.const -16
                        i32.add
                        local.tee 5
                        br_if 0 (;@10;)
                      end
                    end
                    local.get 8
                    local.get 9
                    i32.sub
                    local.set 8
                    local.get 7
                    local.get 13
                    i32.add
                    local.set 5
                    local.get 11
                    i32.const 8
                    i32.shr_u
                    i32.const 16711935
                    i32.and
                    local.get 11
                    i32.const 16711935
                    i32.and
                    i32.add
                    i32.const 65537
                    i32.mul
                    i32.const 16
                    i32.shr_u
                    local.get 4
                    i32.add
                    local.set 4
                    local.get 12
                    i32.eqz
                    br_if 0 (;@8;)
                  end
                  local.get 7
                  local.get 9
                  i32.const 252
                  i32.and
                  i32.const 2
                  i32.shl
                  i32.add
                  local.tee 11
                  i32.load
                  local.tee 10
                  i32.const -1
                  i32.xor
                  i32.const 7
                  i32.shr_u
                  local.get 10
                  i32.const 6
                  i32.shr_u
                  i32.or
                  i32.const 16843009
                  i32.and
                  local.set 10
                  block  ;; label = @8
                    local.get 12
                    i32.const 1
                    i32.eq
                    br_if 0 (;@8;)
                    local.get 11
                    i32.load offset=4
                    local.tee 5
                    i32.const -1
                    i32.xor
                    i32.const 7
                    i32.shr_u
                    local.get 5
                    i32.const 6
                    i32.shr_u
                    i32.or
                    i32.const 16843009
                    i32.and
                    local.get 10
                    i32.add
                    local.set 10
                    local.get 12
                    i32.const 2
                    i32.eq
                    br_if 0 (;@8;)
                    local.get 11
                    i32.load offset=8
                    local.tee 11
                    i32.const -1
                    i32.xor
                    i32.const 7
                    i32.shr_u
                    local.get 11
                    i32.const 6
                    i32.shr_u
                    i32.or
                    i32.const 16843009
                    i32.and
                    local.get 10
                    i32.add
                    local.set 10
                  end
                  local.get 10
                  i32.const 8
                  i32.shr_u
                  i32.const 459007
                  i32.and
                  local.get 10
                  i32.const 16711935
                  i32.and
                  i32.add
                  i32.const 65537
                  i32.mul
                  i32.const 16
                  i32.shr_u
                  local.get 4
                  i32.add
                  local.set 4
                  br 4 (;@3;)
                end
                block  ;; label = @7
                  local.get 2
                  br_if 0 (;@7;)
                  i32.const 0
                  local.set 4
                  i32.const 0
                  local.set 2
                  br 4 (;@3;)
                end
                local.get 2
                i32.const 3
                i32.and
                local.set 5
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 2
                    i32.const 4
                    i32.ge_u
                    br_if 0 (;@8;)
                    i32.const 0
                    local.set 11
                    i32.const 0
                    local.set 4
                    br 1 (;@7;)
                  end
                  local.get 2
                  i32.const 12
                  i32.and
                  local.set 6
                  i32.const 0
                  local.set 11
                  i32.const 0
                  local.set 4
                  loop  ;; label = @8
                    local.get 4
                    local.get 1
                    local.get 11
                    i32.add
                    local.tee 10
                    i32.load8_s
                    i32.const -65
                    i32.gt_s
                    i32.add
                    local.get 10
                    i32.const 1
                    i32.add
                    i32.load8_s
                    i32.const -65
                    i32.gt_s
                    i32.add
                    local.get 10
                    i32.const 2
                    i32.add
                    i32.load8_s
                    i32.const -65
                    i32.gt_s
                    i32.add
                    local.get 10
                    i32.const 3
                    i32.add
                    i32.load8_s
                    i32.const -65
                    i32.gt_s
                    i32.add
                    local.set 4
                    local.get 6
                    local.get 11
                    i32.const 4
                    i32.add
                    local.tee 11
                    i32.ne
                    br_if 0 (;@8;)
                  end
                end
                local.get 5
                i32.eqz
                br_if 3 (;@3;)
                local.get 1
                local.get 11
                i32.add
                local.set 10
                loop  ;; label = @7
                  local.get 4
                  local.get 10
                  i32.load8_s
                  i32.const -65
                  i32.gt_s
                  i32.add
                  local.set 4
                  local.get 10
                  i32.const 1
                  i32.add
                  local.set 10
                  local.get 5
                  i32.const -1
                  i32.add
                  local.tee 5
                  br_if 0 (;@7;)
                  br 4 (;@3;)
                end
              end
              local.get 1
              local.get 2
              i32.add
              local.set 6
              i32.const 0
              local.set 2
              local.get 1
              local.set 11
              local.get 4
              local.set 5
              loop  ;; label = @6
                local.get 11
                local.tee 10
                local.get 6
                i32.eq
                br_if 2 (;@4;)
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 10
                    i32.load8_s
                    local.tee 11
                    i32.const -1
                    i32.le_s
                    br_if 0 (;@8;)
                    local.get 10
                    i32.const 1
                    i32.add
                    local.set 11
                    br 1 (;@7;)
                  end
                  block  ;; label = @8
                    local.get 11
                    i32.const -32
                    i32.ge_u
                    br_if 0 (;@8;)
                    local.get 10
                    i32.const 2
                    i32.add
                    local.set 11
                    br 1 (;@7;)
                  end
                  block  ;; label = @8
                    local.get 11
                    i32.const -16
                    i32.ge_u
                    br_if 0 (;@8;)
                    local.get 10
                    i32.const 3
                    i32.add
                    local.set 11
                    br 1 (;@7;)
                  end
                  local.get 10
                  i32.const 4
                  i32.add
                  local.set 11
                end
                local.get 11
                local.get 10
                i32.sub
                local.get 2
                i32.add
                local.set 2
                local.get 5
                i32.const -1
                i32.add
                local.tee 5
                br_if 0 (;@6;)
              end
            end
            i32.const 0
            local.set 5
          end
          local.get 4
          local.get 5
          i32.sub
          local.set 4
        end
        local.get 4
        local.get 0
        i32.load16_u offset=12
        local.tee 10
        i32.ge_u
        br_if 0 (;@2;)
        local.get 10
        local.get 4
        i32.sub
        local.set 9
        i32.const 0
        local.set 10
        i32.const 0
        local.set 8
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 3
              i32.const 29
              i32.shr_u
              i32.const 3
              i32.and
              br_table 2 (;@3;) 0 (;@5;) 1 (;@4;) 2 (;@3;) 2 (;@3;)
            end
            local.get 9
            local.set 8
            br 1 (;@3;)
          end
          local.get 9
          i32.const 65534
          i32.and
          i32.const 1
          i32.shr_u
          local.set 8
        end
        local.get 3
        i32.const 2097151
        i32.and
        local.set 4
        local.get 0
        i32.load offset=4
        local.set 5
        local.get 0
        i32.load
        local.set 6
        block  ;; label = @3
          loop  ;; label = @4
            local.get 10
            i32.const 65535
            i32.and
            local.get 8
            i32.const 65535
            i32.and
            i32.ge_u
            br_if 1 (;@3;)
            i32.const 1
            local.set 11
            local.get 10
            i32.const 1
            i32.add
            local.set 10
            local.get 6
            local.get 4
            local.get 5
            i32.load offset=16
            call_indirect (type 0)
            br_if 3 (;@1;)
            br 0 (;@4;)
          end
        end
        i32.const 1
        local.set 11
        local.get 6
        local.get 1
        local.get 2
        local.get 5
        i32.load offset=12
        call_indirect (type 1)
        br_if 1 (;@1;)
        local.get 9
        local.get 8
        i32.sub
        i32.const 65535
        i32.and
        local.set 8
        i32.const 0
        local.set 10
        loop  ;; label = @3
          block  ;; label = @4
            local.get 10
            i32.const 65535
            i32.and
            local.get 8
            i32.lt_u
            br_if 0 (;@4;)
            i32.const 0
            return
          end
          i32.const 1
          local.set 11
          local.get 10
          i32.const 1
          i32.add
          local.set 10
          local.get 6
          local.get 4
          local.get 5
          i32.load offset=16
          call_indirect (type 0)
          br_if 2 (;@1;)
          br 0 (;@3;)
        end
      end
      local.get 0
      i32.load
      local.get 1
      local.get 2
      local.get 0
      i32.load offset=4
      i32.load offset=12
      call_indirect (type 1)
      local.set 11
    end
    local.get 11)
  (func (;23;) (type 8) (param i32 i32 i32)
    (local i32 i64)
    global.get 0
    i32.const 112
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    i32.const 1050772
    i32.store offset=12
    local.get 3
    local.get 0
    i32.store offset=8
    local.get 3
    i32.const 1050772
    i32.store offset=20
    local.get 3
    local.get 1
    i32.store offset=16
    local.get 3
    i32.const 2
    i32.store offset=28
    local.get 3
    i32.const 1049348
    i32.store offset=24
    block  ;; label = @1
      local.get 2
      i32.load
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      i32.const 32
      i32.add
      i32.const 16
      i32.add
      local.get 2
      i32.const 16
      i32.add
      i64.load align=4
      i64.store
      local.get 3
      i32.const 32
      i32.add
      i32.const 8
      i32.add
      local.get 2
      i32.const 8
      i32.add
      i64.load align=4
      i64.store
      local.get 3
      local.get 2
      i64.load align=4
      i64.store offset=32
      local.get 3
      i32.const 4
      i32.store offset=92
      local.get 3
      i32.const 1049452
      i32.store offset=88
      local.get 3
      i64.const 4
      i64.store offset=100 align=4
      local.get 3
      i32.const 7
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.tee 4
      local.get 3
      i32.const 16
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=80
      local.get 3
      local.get 4
      local.get 3
      i32.const 8
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=72
      local.get 3
      i32.const 8
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.get 3
      i32.const 32
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=64
      local.get 3
      i32.const 3
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.get 3
      i32.const 24
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=56
      local.get 3
      local.get 3
      i32.const 56
      i32.add
      i32.store offset=96
      local.get 3
      i32.const 88
      i32.add
      i32.const 1050604
      call 7
      unreachable
    end
    local.get 3
    i32.const 3
    i32.store offset=92
    local.get 3
    i32.const 1049400
    i32.store offset=88
    local.get 3
    i64.const 3
    i64.store offset=100 align=4
    local.get 3
    i32.const 7
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.tee 4
    local.get 3
    i32.const 16
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=72
    local.get 3
    local.get 4
    local.get 3
    i32.const 8
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=64
    local.get 3
    i32.const 3
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 3
    i32.const 24
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=56
    local.get 3
    local.get 3
    i32.const 56
    i32.add
    i32.store offset=96
    local.get 3
    i32.const 88
    i32.add
    i32.const 1050604
    call 7
    unreachable)
  (func (;24;) (type 0) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 1
    local.get 0
    i32.load offset=4
    i32.load offset=12
    call_indirect (type 0))
  (func (;25;) (type 0) (param i32 i32) (result i32)
    local.get 1
    i32.load
    local.get 1
    i32.load offset=4
    local.get 0
    call 6)
  (func (;26;) (type 5)
    call 27
    unreachable)
  (func (;27;) (type 5)
    (local i32)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 0
    global.set 0
    local.get 0
    i32.const 1
    i32.store offset=12
    local.get 0
    i32.const 1049508
    i32.store offset=8
    local.get 0
    i64.const 1
    i64.store offset=20 align=4
    local.get 0
    i32.const 9
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 0
    i32.const 47
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=32
    local.get 0
    local.get 0
    i32.const 32
    i32.add
    i32.store offset=16
    local.get 0
    i32.const 8
    i32.add
    i32.const 1050824
    call 7
    unreachable)
  (func (;28;) (type 0) (param i32 i32) (result i32)
    local.get 1
    i32.const 1049484
    i32.const 24
    call 22)
  (func (;29;) (type 3) (param i32 i32)
    local.get 0
    i32.const 0
    i32.store)
  (func (;30;) (type 7) (param i32 i32 i32 i32)
    (local i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 4
    global.set 0
    i32.const 0
    i32.const 0
    i32.load offset=1051848
    local.tee 5
    i32.const 1
    i32.add
    i32.store offset=1051848
    block  ;; label = @1
      local.get 5
      i32.const 0
      i32.lt_s
      br_if 0 (;@1;)
      block  ;; label = @2
        i32.const 0
        i32.load8_u offset=1051844
        br_if 0 (;@2;)
        i32.const 0
        i32.const 0
        i32.load offset=1051840
        i32.const 1
        i32.add
        i32.store offset=1051840
        i32.const 0
        i32.load offset=1051852
        i32.const -1
        i32.le_s
        br_if 1 (;@1;)
        i32.const 0
        i32.const 0
        i32.store8 offset=1051844
        local.get 2
        i32.eqz
        br_if 1 (;@1;)
        call 31
        unreachable
      end
      local.get 4
      i32.const 8
      i32.add
      local.get 0
      local.get 1
      call_indirect (type 3)
    end
    unreachable)
  (func (;31;) (type 5)
    unreachable)
  (func (;32;) (type 9) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i64)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.const 244
          i32.gt_u
          br_if 0 (;@3;)
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  i32.const 0
                  i32.load offset=1051776
                  local.tee 1
                  i32.const 16
                  local.get 0
                  i32.const 11
                  i32.add
                  i32.const 504
                  i32.and
                  local.get 0
                  i32.const 11
                  i32.lt_u
                  select
                  local.tee 2
                  i32.const 3
                  i32.shr_u
                  local.tee 3
                  i32.shr_u
                  local.tee 0
                  i32.const 3
                  i32.and
                  br_if 0 (;@7;)
                  local.get 2
                  i32.const 0
                  i32.load offset=1051784
                  i32.le_u
                  br_if 5 (;@2;)
                  local.get 0
                  br_if 1 (;@6;)
                  i32.const 0
                  i32.load offset=1051780
                  local.tee 0
                  i32.eqz
                  br_if 5 (;@2;)
                  local.get 0
                  i32.ctz
                  i32.const 2
                  i32.shl
                  i32.const 1051368
                  i32.add
                  i32.load
                  local.tee 1
                  i32.load offset=4
                  i32.const -8
                  i32.and
                  local.get 2
                  i32.sub
                  local.set 3
                  local.get 1
                  local.set 4
                  loop  ;; label = @8
                    block  ;; label = @9
                      local.get 4
                      i32.load offset=16
                      local.tee 0
                      br_if 0 (;@9;)
                      local.get 4
                      i32.load offset=20
                      local.tee 0
                      br_if 0 (;@9;)
                      local.get 1
                      i32.load offset=24
                      local.set 5
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 1
                            i32.load offset=12
                            local.tee 0
                            local.get 1
                            i32.ne
                            br_if 0 (;@12;)
                            local.get 1
                            i32.const 20
                            i32.const 16
                            local.get 1
                            i32.load offset=20
                            local.tee 0
                            select
                            i32.add
                            i32.load
                            local.tee 4
                            br_if 1 (;@11;)
                            i32.const 0
                            local.set 0
                            br 2 (;@10;)
                          end
                          local.get 1
                          i32.load offset=8
                          local.tee 4
                          local.get 0
                          i32.store offset=12
                          local.get 0
                          local.get 4
                          i32.store offset=8
                          br 1 (;@10;)
                        end
                        local.get 1
                        i32.const 20
                        i32.add
                        local.get 1
                        i32.const 16
                        i32.add
                        local.get 0
                        select
                        local.set 6
                        loop  ;; label = @11
                          local.get 6
                          local.set 7
                          local.get 4
                          local.tee 0
                          i32.const 20
                          i32.add
                          local.get 0
                          i32.const 16
                          i32.add
                          local.get 0
                          i32.load offset=20
                          local.tee 4
                          select
                          local.set 6
                          local.get 0
                          i32.const 20
                          i32.const 16
                          local.get 4
                          select
                          i32.add
                          i32.load
                          local.tee 4
                          br_if 0 (;@11;)
                        end
                        local.get 7
                        i32.const 0
                        i32.store
                      end
                      local.get 5
                      i32.eqz
                      br_if 5 (;@4;)
                      block  ;; label = @10
                        block  ;; label = @11
                          local.get 1
                          local.get 1
                          i32.load offset=28
                          i32.const 2
                          i32.shl
                          i32.const 1051368
                          i32.add
                          local.tee 4
                          i32.load
                          i32.eq
                          br_if 0 (;@11;)
                          block  ;; label = @12
                            local.get 5
                            i32.load offset=16
                            local.get 1
                            i32.eq
                            br_if 0 (;@12;)
                            local.get 5
                            local.get 0
                            i32.store offset=20
                            local.get 0
                            br_if 2 (;@10;)
                            br 8 (;@4;)
                          end
                          local.get 5
                          local.get 0
                          i32.store offset=16
                          local.get 0
                          br_if 1 (;@10;)
                          br 7 (;@4;)
                        end
                        local.get 4
                        local.get 0
                        i32.store
                        local.get 0
                        i32.eqz
                        br_if 5 (;@5;)
                      end
                      local.get 0
                      local.get 5
                      i32.store offset=24
                      block  ;; label = @10
                        local.get 1
                        i32.load offset=16
                        local.tee 4
                        i32.eqz
                        br_if 0 (;@10;)
                        local.get 0
                        local.get 4
                        i32.store offset=16
                        local.get 4
                        local.get 0
                        i32.store offset=24
                      end
                      local.get 1
                      i32.load offset=20
                      local.tee 4
                      i32.eqz
                      br_if 5 (;@4;)
                      local.get 0
                      local.get 4
                      i32.store offset=20
                      local.get 4
                      local.get 0
                      i32.store offset=24
                      br 5 (;@4;)
                    end
                    local.get 0
                    i32.load offset=4
                    i32.const -8
                    i32.and
                    local.get 2
                    i32.sub
                    local.tee 4
                    local.get 3
                    local.get 4
                    local.get 3
                    i32.lt_u
                    local.tee 4
                    select
                    local.set 3
                    local.get 0
                    local.get 1
                    local.get 4
                    select
                    local.set 1
                    local.get 0
                    local.set 4
                    br 0 (;@8;)
                  end
                end
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 0
                    i32.const -1
                    i32.xor
                    i32.const 1
                    i32.and
                    local.get 3
                    i32.add
                    local.tee 6
                    i32.const 3
                    i32.shl
                    local.tee 0
                    i32.const 1051512
                    i32.add
                    local.tee 2
                    local.get 0
                    i32.const 1051520
                    i32.add
                    i32.load
                    local.tee 3
                    i32.load offset=8
                    local.tee 4
                    i32.eq
                    br_if 0 (;@8;)
                    local.get 4
                    local.get 2
                    i32.store offset=12
                    local.get 2
                    local.get 4
                    i32.store offset=8
                    br 1 (;@7;)
                  end
                  i32.const 0
                  local.get 1
                  i32.const -2
                  local.get 6
                  i32.rotl
                  i32.and
                  i32.store offset=1051776
                end
                local.get 3
                local.get 0
                i32.const 3
                i32.or
                i32.store offset=4
                local.get 3
                local.get 0
                i32.add
                local.tee 0
                local.get 0
                i32.load offset=4
                i32.const 1
                i32.or
                i32.store offset=4
                local.get 3
                i32.const 8
                i32.add
                return
              end
              block  ;; label = @6
                block  ;; label = @7
                  local.get 0
                  local.get 3
                  i32.shl
                  i32.const 2
                  local.get 3
                  i32.shl
                  local.tee 0
                  i32.const 0
                  local.get 0
                  i32.sub
                  i32.or
                  i32.and
                  i32.ctz
                  local.tee 7
                  i32.const 3
                  i32.shl
                  local.tee 3
                  i32.const 1051512
                  i32.add
                  local.tee 4
                  local.get 3
                  i32.const 1051520
                  i32.add
                  i32.load
                  local.tee 0
                  i32.load offset=8
                  local.tee 6
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 6
                  local.get 4
                  i32.store offset=12
                  local.get 4
                  local.get 6
                  i32.store offset=8
                  br 1 (;@6;)
                end
                i32.const 0
                local.get 1
                i32.const -2
                local.get 7
                i32.rotl
                i32.and
                i32.store offset=1051776
              end
              local.get 0
              local.get 2
              i32.const 3
              i32.or
              i32.store offset=4
              local.get 0
              local.get 2
              i32.add
              local.tee 1
              local.get 3
              local.get 2
              i32.sub
              local.tee 2
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 0
              local.get 3
              i32.add
              local.get 2
              i32.store
              block  ;; label = @6
                i32.const 0
                i32.load offset=1051784
                local.tee 4
                i32.eqz
                br_if 0 (;@6;)
                i32.const 0
                i32.load offset=1051792
                local.set 3
                block  ;; label = @7
                  block  ;; label = @8
                    i32.const 0
                    i32.load offset=1051776
                    local.tee 6
                    i32.const 1
                    local.get 4
                    i32.const 3
                    i32.shr_u
                    i32.shl
                    local.tee 7
                    i32.and
                    br_if 0 (;@8;)
                    i32.const 0
                    local.get 6
                    local.get 7
                    i32.or
                    i32.store offset=1051776
                    local.get 4
                    i32.const -8
                    i32.and
                    i32.const 1051512
                    i32.add
                    local.tee 4
                    local.set 6
                    br 1 (;@7;)
                  end
                  local.get 4
                  i32.const -8
                  i32.and
                  local.tee 4
                  i32.const 1051512
                  i32.add
                  local.set 6
                  local.get 4
                  i32.const 1051520
                  i32.add
                  i32.load
                  local.set 4
                end
                local.get 6
                local.get 3
                i32.store offset=8
                local.get 4
                local.get 3
                i32.store offset=12
                local.get 3
                local.get 6
                i32.store offset=12
                local.get 3
                local.get 4
                i32.store offset=8
              end
              i32.const 0
              local.get 1
              i32.store offset=1051792
              i32.const 0
              local.get 2
              i32.store offset=1051784
              local.get 0
              i32.const 8
              i32.add
              return
            end
            i32.const 0
            i32.const 0
            i32.load offset=1051780
            i32.const -2
            local.get 1
            i32.load offset=28
            i32.rotl
            i32.and
            i32.store offset=1051780
          end
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 3
                i32.const 16
                i32.lt_u
                br_if 0 (;@6;)
                local.get 1
                local.get 2
                i32.const 3
                i32.or
                i32.store offset=4
                local.get 1
                local.get 2
                i32.add
                local.tee 4
                local.get 3
                i32.const 1
                i32.or
                i32.store offset=4
                local.get 4
                local.get 3
                i32.add
                local.get 3
                i32.store
                i32.const 0
                i32.load offset=1051784
                local.tee 6
                i32.eqz
                br_if 1 (;@5;)
                i32.const 0
                i32.load offset=1051792
                local.set 0
                block  ;; label = @7
                  block  ;; label = @8
                    i32.const 0
                    i32.load offset=1051776
                    local.tee 7
                    i32.const 1
                    local.get 6
                    i32.const 3
                    i32.shr_u
                    i32.shl
                    local.tee 5
                    i32.and
                    br_if 0 (;@8;)
                    i32.const 0
                    local.get 7
                    local.get 5
                    i32.or
                    i32.store offset=1051776
                    local.get 6
                    i32.const -8
                    i32.and
                    i32.const 1051512
                    i32.add
                    local.tee 6
                    local.set 7
                    br 1 (;@7;)
                  end
                  local.get 6
                  i32.const -8
                  i32.and
                  local.tee 6
                  i32.const 1051512
                  i32.add
                  local.set 7
                  local.get 6
                  i32.const 1051520
                  i32.add
                  i32.load
                  local.set 6
                end
                local.get 7
                local.get 0
                i32.store offset=8
                local.get 6
                local.get 0
                i32.store offset=12
                local.get 0
                local.get 7
                i32.store offset=12
                local.get 0
                local.get 6
                i32.store offset=8
                br 1 (;@5;)
              end
              local.get 1
              local.get 3
              local.get 2
              i32.add
              local.tee 0
              i32.const 3
              i32.or
              i32.store offset=4
              local.get 1
              local.get 0
              i32.add
              local.tee 0
              local.get 0
              i32.load offset=4
              i32.const 1
              i32.or
              i32.store offset=4
              br 1 (;@4;)
            end
            i32.const 0
            local.get 4
            i32.store offset=1051792
            i32.const 0
            local.get 3
            i32.store offset=1051784
          end
          local.get 1
          i32.const 8
          i32.add
          local.tee 0
          i32.eqz
          br_if 1 (;@2;)
          br 2 (;@1;)
        end
        local.get 0
        i32.const 11
        i32.add
        local.tee 3
        i32.const -8
        i32.and
        local.set 2
        i32.const 0
        i32.load offset=1051780
        local.tee 8
        i32.eqz
        br_if 0 (;@2;)
        i32.const 31
        local.set 5
        block  ;; label = @3
          local.get 0
          i32.const 16777204
          i32.gt_u
          br_if 0 (;@3;)
          local.get 2
          i32.const 38
          local.get 3
          i32.const 8
          i32.shr_u
          i32.clz
          local.tee 0
          i32.sub
          i32.shr_u
          i32.const 1
          i32.and
          local.get 0
          i32.const 1
          i32.shl
          i32.sub
          i32.const 62
          i32.add
          local.set 5
        end
        i32.const 0
        local.get 2
        i32.sub
        local.set 3
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 5
                i32.const 2
                i32.shl
                i32.const 1051368
                i32.add
                i32.load
                local.tee 1
                br_if 0 (;@6;)
                i32.const 0
                local.set 4
                i32.const 0
                local.set 0
                br 1 (;@5;)
              end
              i32.const 0
              local.set 4
              local.get 2
              i32.const 0
              i32.const 25
              local.get 5
              i32.const 1
              i32.shr_u
              i32.sub
              local.get 5
              i32.const 31
              i32.eq
              select
              i32.shl
              local.set 6
              i32.const 0
              local.set 0
              loop  ;; label = @6
                block  ;; label = @7
                  local.get 1
                  local.tee 1
                  i32.load offset=4
                  i32.const -8
                  i32.and
                  local.tee 7
                  local.get 2
                  i32.lt_u
                  br_if 0 (;@7;)
                  local.get 7
                  local.get 2
                  i32.sub
                  local.tee 7
                  local.get 3
                  i32.ge_u
                  br_if 0 (;@7;)
                  local.get 1
                  local.set 4
                  local.get 7
                  local.set 3
                  local.get 7
                  br_if 0 (;@7;)
                  i32.const 0
                  local.set 3
                  local.get 1
                  local.set 0
                  local.get 1
                  local.set 4
                  br 3 (;@4;)
                end
                local.get 1
                i32.load offset=20
                local.tee 7
                local.get 0
                local.get 7
                local.get 1
                local.get 6
                i32.const 29
                i32.shr_u
                i32.const 4
                i32.and
                i32.add
                i32.load offset=16
                local.tee 1
                i32.ne
                select
                local.get 0
                local.get 7
                select
                local.set 0
                local.get 6
                i32.const 1
                i32.shl
                local.set 6
                local.get 1
                br_if 0 (;@6;)
              end
            end
            block  ;; label = @5
              local.get 0
              local.get 4
              i32.or
              br_if 0 (;@5;)
              i32.const 0
              local.set 4
              i32.const 2
              local.get 5
              i32.shl
              local.tee 0
              i32.const 0
              local.get 0
              i32.sub
              i32.or
              local.get 8
              i32.and
              local.tee 0
              i32.eqz
              br_if 3 (;@2;)
              local.get 0
              i32.ctz
              i32.const 2
              i32.shl
              i32.const 1051368
              i32.add
              i32.load
              local.set 0
            end
            local.get 0
            i32.eqz
            br_if 1 (;@3;)
          end
          loop  ;; label = @4
            local.get 0
            i32.load offset=4
            i32.const -8
            i32.and
            local.tee 1
            local.get 2
            i32.sub
            local.tee 6
            local.get 3
            local.get 6
            local.get 3
            i32.lt_u
            local.tee 7
            select
            local.set 5
            local.get 1
            local.get 2
            i32.lt_u
            local.set 6
            local.get 0
            local.get 4
            local.get 7
            select
            local.set 7
            block  ;; label = @5
              local.get 0
              i32.load offset=16
              local.tee 1
              br_if 0 (;@5;)
              local.get 0
              i32.load offset=20
              local.set 1
            end
            local.get 3
            local.get 5
            local.get 6
            select
            local.set 3
            local.get 4
            local.get 7
            local.get 6
            select
            local.set 4
            local.get 1
            local.set 0
            local.get 1
            br_if 0 (;@4;)
          end
        end
        local.get 4
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          i32.const 0
          i32.load offset=1051784
          local.tee 0
          local.get 2
          i32.lt_u
          br_if 0 (;@3;)
          local.get 3
          local.get 0
          local.get 2
          i32.sub
          i32.ge_u
          br_if 1 (;@2;)
        end
        local.get 4
        i32.load offset=24
        local.set 5
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 4
              i32.load offset=12
              local.tee 0
              local.get 4
              i32.ne
              br_if 0 (;@5;)
              local.get 4
              i32.const 20
              i32.const 16
              local.get 4
              i32.load offset=20
              local.tee 0
              select
              i32.add
              i32.load
              local.tee 1
              br_if 1 (;@4;)
              i32.const 0
              local.set 0
              br 2 (;@3;)
            end
            local.get 4
            i32.load offset=8
            local.tee 1
            local.get 0
            i32.store offset=12
            local.get 0
            local.get 1
            i32.store offset=8
            br 1 (;@3;)
          end
          local.get 4
          i32.const 20
          i32.add
          local.get 4
          i32.const 16
          i32.add
          local.get 0
          select
          local.set 6
          loop  ;; label = @4
            local.get 6
            local.set 7
            local.get 1
            local.tee 0
            i32.const 20
            i32.add
            local.get 0
            i32.const 16
            i32.add
            local.get 0
            i32.load offset=20
            local.tee 1
            select
            local.set 6
            local.get 0
            i32.const 20
            i32.const 16
            local.get 1
            select
            i32.add
            i32.load
            local.tee 1
            br_if 0 (;@4;)
          end
          local.get 7
          i32.const 0
          i32.store
        end
        block  ;; label = @3
          local.get 5
          i32.eqz
          br_if 0 (;@3;)
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 4
                local.get 4
                i32.load offset=28
                i32.const 2
                i32.shl
                i32.const 1051368
                i32.add
                local.tee 1
                i32.load
                i32.eq
                br_if 0 (;@6;)
                block  ;; label = @7
                  local.get 5
                  i32.load offset=16
                  local.get 4
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 5
                  local.get 0
                  i32.store offset=20
                  local.get 0
                  br_if 2 (;@5;)
                  br 4 (;@3;)
                end
                local.get 5
                local.get 0
                i32.store offset=16
                local.get 0
                br_if 1 (;@5;)
                br 3 (;@3;)
              end
              local.get 1
              local.get 0
              i32.store
              local.get 0
              i32.eqz
              br_if 1 (;@4;)
            end
            local.get 0
            local.get 5
            i32.store offset=24
            block  ;; label = @5
              local.get 4
              i32.load offset=16
              local.tee 1
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              local.get 1
              i32.store offset=16
              local.get 1
              local.get 0
              i32.store offset=24
            end
            local.get 4
            i32.load offset=20
            local.tee 1
            i32.eqz
            br_if 1 (;@3;)
            local.get 0
            local.get 1
            i32.store offset=20
            local.get 1
            local.get 0
            i32.store offset=24
            br 1 (;@3;)
          end
          i32.const 0
          i32.const 0
          i32.load offset=1051780
          i32.const -2
          local.get 4
          i32.load offset=28
          i32.rotl
          i32.and
          i32.store offset=1051780
        end
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            i32.const 16
            i32.lt_u
            br_if 0 (;@4;)
            local.get 4
            local.get 2
            i32.const 3
            i32.or
            i32.store offset=4
            local.get 4
            local.get 2
            i32.add
            local.tee 1
            local.get 3
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 1
            local.get 3
            i32.add
            local.get 3
            i32.store
            block  ;; label = @5
              local.get 3
              i32.const 256
              i32.lt_u
              br_if 0 (;@5;)
              i32.const 31
              local.set 0
              block  ;; label = @6
                local.get 3
                i32.const 16777215
                i32.gt_u
                br_if 0 (;@6;)
                local.get 3
                i32.const 38
                local.get 3
                i32.const 8
                i32.shr_u
                i32.clz
                local.tee 0
                i32.sub
                i32.shr_u
                i32.const 1
                i32.and
                local.get 0
                i32.const 1
                i32.shl
                i32.sub
                i32.const 62
                i32.add
                local.set 0
              end
              local.get 1
              i64.const 0
              i64.store offset=16 align=4
              local.get 1
              local.get 0
              i32.store offset=28
              local.get 0
              i32.const 2
              i32.shl
              i32.const 1051368
              i32.add
              local.set 6
              block  ;; label = @6
                i32.const 0
                i32.load offset=1051780
                i32.const 1
                local.get 0
                i32.shl
                local.tee 7
                i32.and
                br_if 0 (;@6;)
                local.get 6
                local.get 1
                i32.store
                local.get 1
                local.get 6
                i32.store offset=24
                local.get 1
                local.get 1
                i32.store offset=12
                local.get 1
                local.get 1
                i32.store offset=8
                i32.const 0
                i32.const 0
                i32.load offset=1051780
                local.get 7
                i32.or
                i32.store offset=1051780
                br 3 (;@3;)
              end
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 6
                    i32.load
                    local.tee 7
                    i32.load offset=4
                    i32.const -8
                    i32.and
                    local.get 3
                    i32.ne
                    br_if 0 (;@8;)
                    local.get 7
                    local.set 0
                    br 1 (;@7;)
                  end
                  local.get 3
                  i32.const 0
                  i32.const 25
                  local.get 0
                  i32.const 1
                  i32.shr_u
                  i32.sub
                  local.get 0
                  i32.const 31
                  i32.eq
                  select
                  i32.shl
                  local.set 6
                  loop  ;; label = @8
                    local.get 7
                    local.get 6
                    i32.const 29
                    i32.shr_u
                    i32.const 4
                    i32.and
                    i32.add
                    local.tee 5
                    i32.load offset=16
                    local.tee 0
                    i32.eqz
                    br_if 2 (;@6;)
                    local.get 6
                    i32.const 1
                    i32.shl
                    local.set 6
                    local.get 0
                    local.set 7
                    local.get 0
                    i32.load offset=4
                    i32.const -8
                    i32.and
                    local.get 3
                    i32.ne
                    br_if 0 (;@8;)
                  end
                end
                local.get 0
                i32.load offset=8
                local.tee 3
                local.get 1
                i32.store offset=12
                local.get 0
                local.get 1
                i32.store offset=8
                local.get 1
                i32.const 0
                i32.store offset=24
                local.get 1
                local.get 0
                i32.store offset=12
                local.get 1
                local.get 3
                i32.store offset=8
                br 3 (;@3;)
              end
              local.get 5
              i32.const 16
              i32.add
              local.get 1
              i32.store
              local.get 1
              local.get 7
              i32.store offset=24
              local.get 1
              local.get 1
              i32.store offset=12
              local.get 1
              local.get 1
              i32.store offset=8
              br 2 (;@3;)
            end
            block  ;; label = @5
              block  ;; label = @6
                i32.const 0
                i32.load offset=1051776
                local.tee 0
                i32.const 1
                local.get 3
                i32.const 3
                i32.shr_u
                i32.shl
                local.tee 6
                i32.and
                br_if 0 (;@6;)
                i32.const 0
                local.get 0
                local.get 6
                i32.or
                i32.store offset=1051776
                local.get 3
                i32.const 248
                i32.and
                i32.const 1051512
                i32.add
                local.tee 0
                local.set 3
                br 1 (;@5;)
              end
              local.get 3
              i32.const 248
              i32.and
              local.tee 0
              i32.const 1051512
              i32.add
              local.set 3
              local.get 0
              i32.const 1051520
              i32.add
              i32.load
              local.set 0
            end
            local.get 3
            local.get 1
            i32.store offset=8
            local.get 0
            local.get 1
            i32.store offset=12
            local.get 1
            local.get 3
            i32.store offset=12
            local.get 1
            local.get 0
            i32.store offset=8
            br 1 (;@3;)
          end
          local.get 4
          local.get 3
          local.get 2
          i32.add
          local.tee 0
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 4
          local.get 0
          i32.add
          local.tee 0
          local.get 0
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
        end
        local.get 4
        i32.const 8
        i32.add
        local.tee 0
        br_if 1 (;@1;)
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  i32.const 0
                  i32.load offset=1051784
                  local.tee 0
                  local.get 2
                  i32.ge_u
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    i32.const 0
                    i32.load offset=1051788
                    local.tee 0
                    local.get 2
                    i32.gt_u
                    br_if 0 (;@8;)
                    block  ;; label = @9
                      local.get 2
                      i32.const 65583
                      i32.add
                      local.tee 4
                      i32.const 16
                      i32.shr_u
                      memory.grow
                      local.tee 3
                      i32.const -1
                      i32.ne
                      br_if 0 (;@9;)
                      i32.const 0
                      return
                    end
                    i32.const 0
                    local.set 0
                    local.get 3
                    i32.const 16
                    i32.shl
                    local.tee 1
                    i32.eqz
                    br_if 7 (;@1;)
                    i32.const 0
                    i32.const 0
                    i32.load offset=1051800
                    local.get 4
                    i32.const -65536
                    i32.and
                    local.tee 0
                    i32.const -16
                    i32.add
                    local.get 0
                    local.get 1
                    i32.const 0
                    local.get 0
                    i32.sub
                    i32.eq
                    select
                    local.tee 7
                    i32.add
                    local.tee 0
                    i32.store offset=1051800
                    i32.const 0
                    local.get 0
                    i32.const 0
                    i32.load offset=1051804
                    local.tee 3
                    local.get 0
                    local.get 3
                    i32.gt_u
                    select
                    i32.store offset=1051804
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=1051796
                          local.tee 3
                          i32.eqz
                          br_if 0 (;@11;)
                          i32.const 1051496
                          local.set 0
                          loop  ;; label = @12
                            local.get 0
                            i32.load
                            local.tee 4
                            local.get 0
                            i32.load offset=4
                            local.tee 6
                            i32.add
                            local.get 1
                            i32.eq
                            br_if 2 (;@10;)
                            local.get 0
                            i32.load offset=8
                            local.tee 0
                            br_if 0 (;@12;)
                            br 3 (;@9;)
                          end
                        end
                        block  ;; label = @11
                          block  ;; label = @12
                            i32.const 0
                            i32.load offset=1051812
                            local.tee 0
                            i32.eqz
                            br_if 0 (;@12;)
                            local.get 0
                            local.get 1
                            i32.le_u
                            br_if 1 (;@11;)
                          end
                          i32.const 0
                          local.get 1
                          i32.store offset=1051812
                        end
                        i32.const 0
                        i32.const 4095
                        i32.store offset=1051816
                        i32.const 0
                        local.get 7
                        i32.store offset=1051500
                        i32.const 0
                        local.get 1
                        i32.store offset=1051496
                        i32.const 0
                        i32.const 1051512
                        i32.store offset=1051524
                        i32.const 0
                        i32.const 1051520
                        i32.store offset=1051532
                        i32.const 0
                        i32.const 1051512
                        i32.store offset=1051520
                        i32.const 0
                        i32.const 1051528
                        i32.store offset=1051540
                        i32.const 0
                        i32.const 1051520
                        i32.store offset=1051528
                        i32.const 0
                        i32.const 1051536
                        i32.store offset=1051548
                        i32.const 0
                        i32.const 1051528
                        i32.store offset=1051536
                        i32.const 0
                        i32.const 1051544
                        i32.store offset=1051556
                        i32.const 0
                        i32.const 1051536
                        i32.store offset=1051544
                        i32.const 0
                        i32.const 1051552
                        i32.store offset=1051564
                        i32.const 0
                        i32.const 1051544
                        i32.store offset=1051552
                        i32.const 0
                        i32.const 1051560
                        i32.store offset=1051572
                        i32.const 0
                        i32.const 1051552
                        i32.store offset=1051560
                        i32.const 0
                        i32.const 1051568
                        i32.store offset=1051580
                        i32.const 0
                        i32.const 1051560
                        i32.store offset=1051568
                        i32.const 0
                        i32.const 0
                        i32.store offset=1051508
                        i32.const 0
                        i32.const 1051576
                        i32.store offset=1051588
                        i32.const 0
                        i32.const 1051568
                        i32.store offset=1051576
                        i32.const 0
                        i32.const 1051576
                        i32.store offset=1051584
                        i32.const 0
                        i32.const 1051584
                        i32.store offset=1051596
                        i32.const 0
                        i32.const 1051584
                        i32.store offset=1051592
                        i32.const 0
                        i32.const 1051592
                        i32.store offset=1051604
                        i32.const 0
                        i32.const 1051592
                        i32.store offset=1051600
                        i32.const 0
                        i32.const 1051600
                        i32.store offset=1051612
                        i32.const 0
                        i32.const 1051600
                        i32.store offset=1051608
                        i32.const 0
                        i32.const 1051608
                        i32.store offset=1051620
                        i32.const 0
                        i32.const 1051608
                        i32.store offset=1051616
                        i32.const 0
                        i32.const 1051616
                        i32.store offset=1051628
                        i32.const 0
                        i32.const 1051616
                        i32.store offset=1051624
                        i32.const 0
                        i32.const 1051624
                        i32.store offset=1051636
                        i32.const 0
                        i32.const 1051624
                        i32.store offset=1051632
                        i32.const 0
                        i32.const 1051632
                        i32.store offset=1051644
                        i32.const 0
                        i32.const 1051632
                        i32.store offset=1051640
                        i32.const 0
                        i32.const 1051640
                        i32.store offset=1051652
                        i32.const 0
                        i32.const 1051648
                        i32.store offset=1051660
                        i32.const 0
                        i32.const 1051640
                        i32.store offset=1051648
                        i32.const 0
                        i32.const 1051656
                        i32.store offset=1051668
                        i32.const 0
                        i32.const 1051648
                        i32.store offset=1051656
                        i32.const 0
                        i32.const 1051664
                        i32.store offset=1051676
                        i32.const 0
                        i32.const 1051656
                        i32.store offset=1051664
                        i32.const 0
                        i32.const 1051672
                        i32.store offset=1051684
                        i32.const 0
                        i32.const 1051664
                        i32.store offset=1051672
                        i32.const 0
                        i32.const 1051680
                        i32.store offset=1051692
                        i32.const 0
                        i32.const 1051672
                        i32.store offset=1051680
                        i32.const 0
                        i32.const 1051688
                        i32.store offset=1051700
                        i32.const 0
                        i32.const 1051680
                        i32.store offset=1051688
                        i32.const 0
                        i32.const 1051696
                        i32.store offset=1051708
                        i32.const 0
                        i32.const 1051688
                        i32.store offset=1051696
                        i32.const 0
                        i32.const 1051704
                        i32.store offset=1051716
                        i32.const 0
                        i32.const 1051696
                        i32.store offset=1051704
                        i32.const 0
                        i32.const 1051712
                        i32.store offset=1051724
                        i32.const 0
                        i32.const 1051704
                        i32.store offset=1051712
                        i32.const 0
                        i32.const 1051720
                        i32.store offset=1051732
                        i32.const 0
                        i32.const 1051712
                        i32.store offset=1051720
                        i32.const 0
                        i32.const 1051728
                        i32.store offset=1051740
                        i32.const 0
                        i32.const 1051720
                        i32.store offset=1051728
                        i32.const 0
                        i32.const 1051736
                        i32.store offset=1051748
                        i32.const 0
                        i32.const 1051728
                        i32.store offset=1051736
                        i32.const 0
                        i32.const 1051744
                        i32.store offset=1051756
                        i32.const 0
                        i32.const 1051736
                        i32.store offset=1051744
                        i32.const 0
                        i32.const 1051752
                        i32.store offset=1051764
                        i32.const 0
                        i32.const 1051744
                        i32.store offset=1051752
                        i32.const 0
                        i32.const 1051760
                        i32.store offset=1051772
                        i32.const 0
                        i32.const 1051752
                        i32.store offset=1051760
                        i32.const 0
                        local.get 1
                        i32.store offset=1051796
                        i32.const 0
                        i32.const 1051760
                        i32.store offset=1051768
                        i32.const 0
                        local.get 7
                        i32.const -40
                        i32.add
                        local.tee 0
                        i32.store offset=1051788
                        local.get 1
                        local.get 0
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        local.get 1
                        local.get 0
                        i32.add
                        i32.const 40
                        i32.store offset=4
                        i32.const 0
                        i32.const 2097152
                        i32.store offset=1051808
                        br 8 (;@2;)
                      end
                      local.get 3
                      local.get 1
                      i32.ge_u
                      br_if 0 (;@9;)
                      local.get 4
                      local.get 3
                      i32.gt_u
                      br_if 0 (;@9;)
                      local.get 0
                      i32.load offset=12
                      i32.eqz
                      br_if 3 (;@6;)
                    end
                    i32.const 0
                    i32.const 0
                    i32.load offset=1051812
                    local.tee 0
                    local.get 1
                    local.get 0
                    local.get 1
                    i32.lt_u
                    select
                    i32.store offset=1051812
                    local.get 1
                    local.get 7
                    i32.add
                    local.set 4
                    i32.const 1051496
                    local.set 0
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          loop  ;; label = @12
                            local.get 0
                            i32.load
                            local.tee 6
                            local.get 4
                            i32.eq
                            br_if 1 (;@11;)
                            local.get 0
                            i32.load offset=8
                            local.tee 0
                            br_if 0 (;@12;)
                            br 2 (;@10;)
                          end
                        end
                        local.get 0
                        i32.load offset=12
                        i32.eqz
                        br_if 1 (;@9;)
                      end
                      i32.const 1051496
                      local.set 0
                      block  ;; label = @10
                        loop  ;; label = @11
                          block  ;; label = @12
                            local.get 0
                            i32.load
                            local.tee 4
                            local.get 3
                            i32.gt_u
                            br_if 0 (;@12;)
                            local.get 3
                            local.get 4
                            local.get 0
                            i32.load offset=4
                            i32.add
                            local.tee 4
                            i32.lt_u
                            br_if 2 (;@10;)
                          end
                          local.get 0
                          i32.load offset=8
                          local.set 0
                          br 0 (;@11;)
                        end
                      end
                      i32.const 0
                      local.get 1
                      i32.store offset=1051796
                      i32.const 0
                      local.get 7
                      i32.const -40
                      i32.add
                      local.tee 0
                      i32.store offset=1051788
                      local.get 1
                      local.get 0
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get 1
                      local.get 0
                      i32.add
                      i32.const 40
                      i32.store offset=4
                      i32.const 0
                      i32.const 2097152
                      i32.store offset=1051808
                      local.get 3
                      local.get 4
                      i32.const -32
                      i32.add
                      i32.const -8
                      i32.and
                      i32.const -8
                      i32.add
                      local.tee 0
                      local.get 0
                      local.get 3
                      i32.const 16
                      i32.add
                      i32.lt_u
                      select
                      local.tee 6
                      i32.const 27
                      i32.store offset=4
                      i32.const 0
                      i64.load offset=1051496 align=4
                      local.set 9
                      local.get 6
                      i32.const 16
                      i32.add
                      i32.const 0
                      i64.load offset=1051504 align=4
                      i64.store align=4
                      local.get 6
                      i32.const 8
                      i32.add
                      local.tee 0
                      local.get 9
                      i64.store align=4
                      i32.const 0
                      local.get 7
                      i32.store offset=1051500
                      i32.const 0
                      local.get 1
                      i32.store offset=1051496
                      i32.const 0
                      local.get 0
                      i32.store offset=1051504
                      i32.const 0
                      i32.const 0
                      i32.store offset=1051508
                      local.get 6
                      i32.const 28
                      i32.add
                      local.set 0
                      loop  ;; label = @10
                        local.get 0
                        i32.const 7
                        i32.store
                        local.get 0
                        i32.const 4
                        i32.add
                        local.tee 0
                        local.get 4
                        i32.lt_u
                        br_if 0 (;@10;)
                      end
                      local.get 6
                      local.get 3
                      i32.eq
                      br_if 7 (;@2;)
                      local.get 6
                      local.get 6
                      i32.load offset=4
                      i32.const -2
                      i32.and
                      i32.store offset=4
                      local.get 3
                      local.get 6
                      local.get 3
                      i32.sub
                      local.tee 0
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get 6
                      local.get 0
                      i32.store
                      block  ;; label = @10
                        local.get 0
                        i32.const 256
                        i32.lt_u
                        br_if 0 (;@10;)
                        local.get 3
                        local.get 0
                        call 33
                        br 8 (;@2;)
                      end
                      block  ;; label = @10
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=1051776
                          local.tee 4
                          i32.const 1
                          local.get 0
                          i32.const 3
                          i32.shr_u
                          i32.shl
                          local.tee 1
                          i32.and
                          br_if 0 (;@11;)
                          i32.const 0
                          local.get 4
                          local.get 1
                          i32.or
                          i32.store offset=1051776
                          local.get 0
                          i32.const 248
                          i32.and
                          i32.const 1051512
                          i32.add
                          local.tee 0
                          local.set 4
                          br 1 (;@10;)
                        end
                        local.get 0
                        i32.const 248
                        i32.and
                        local.tee 0
                        i32.const 1051512
                        i32.add
                        local.set 4
                        local.get 0
                        i32.const 1051520
                        i32.add
                        i32.load
                        local.set 0
                      end
                      local.get 4
                      local.get 3
                      i32.store offset=8
                      local.get 0
                      local.get 3
                      i32.store offset=12
                      local.get 3
                      local.get 4
                      i32.store offset=12
                      local.get 3
                      local.get 0
                      i32.store offset=8
                      br 7 (;@2;)
                    end
                    local.get 0
                    local.get 1
                    i32.store
                    local.get 0
                    local.get 0
                    i32.load offset=4
                    local.get 7
                    i32.add
                    i32.store offset=4
                    local.get 1
                    local.get 2
                    i32.const 3
                    i32.or
                    i32.store offset=4
                    local.get 6
                    i32.const 15
                    i32.add
                    i32.const -8
                    i32.and
                    i32.const -8
                    i32.add
                    local.tee 4
                    local.get 1
                    local.get 2
                    i32.add
                    local.tee 0
                    i32.sub
                    local.set 3
                    local.get 4
                    i32.const 0
                    i32.load offset=1051796
                    i32.eq
                    br_if 3 (;@5;)
                    local.get 4
                    i32.const 0
                    i32.load offset=1051792
                    i32.eq
                    br_if 4 (;@4;)
                    block  ;; label = @9
                      local.get 4
                      i32.load offset=4
                      local.tee 2
                      i32.const 3
                      i32.and
                      i32.const 1
                      i32.ne
                      br_if 0 (;@9;)
                      local.get 4
                      local.get 2
                      i32.const -8
                      i32.and
                      local.tee 2
                      call 34
                      local.get 2
                      local.get 3
                      i32.add
                      local.set 3
                      local.get 4
                      local.get 2
                      i32.add
                      local.tee 4
                      i32.load offset=4
                      local.set 2
                    end
                    local.get 4
                    local.get 2
                    i32.const -2
                    i32.and
                    i32.store offset=4
                    local.get 0
                    local.get 3
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    local.get 0
                    local.get 3
                    i32.add
                    local.get 3
                    i32.store
                    block  ;; label = @9
                      local.get 3
                      i32.const 256
                      i32.lt_u
                      br_if 0 (;@9;)
                      local.get 0
                      local.get 3
                      call 33
                      br 6 (;@3;)
                    end
                    block  ;; label = @9
                      block  ;; label = @10
                        i32.const 0
                        i32.load offset=1051776
                        local.tee 2
                        i32.const 1
                        local.get 3
                        i32.const 3
                        i32.shr_u
                        i32.shl
                        local.tee 4
                        i32.and
                        br_if 0 (;@10;)
                        i32.const 0
                        local.get 2
                        local.get 4
                        i32.or
                        i32.store offset=1051776
                        local.get 3
                        i32.const 248
                        i32.and
                        i32.const 1051512
                        i32.add
                        local.tee 3
                        local.set 2
                        br 1 (;@9;)
                      end
                      local.get 3
                      i32.const 248
                      i32.and
                      local.tee 3
                      i32.const 1051512
                      i32.add
                      local.set 2
                      local.get 3
                      i32.const 1051520
                      i32.add
                      i32.load
                      local.set 3
                    end
                    local.get 2
                    local.get 0
                    i32.store offset=8
                    local.get 3
                    local.get 0
                    i32.store offset=12
                    local.get 0
                    local.get 2
                    i32.store offset=12
                    local.get 0
                    local.get 3
                    i32.store offset=8
                    br 5 (;@3;)
                  end
                  i32.const 0
                  local.get 0
                  local.get 2
                  i32.sub
                  local.tee 3
                  i32.store offset=1051788
                  i32.const 0
                  i32.const 0
                  i32.load offset=1051796
                  local.tee 0
                  local.get 2
                  i32.add
                  local.tee 4
                  i32.store offset=1051796
                  local.get 4
                  local.get 3
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 0
                  local.get 2
                  i32.const 3
                  i32.or
                  i32.store offset=4
                  local.get 0
                  i32.const 8
                  i32.add
                  local.set 0
                  br 6 (;@1;)
                end
                i32.const 0
                i32.load offset=1051792
                local.set 3
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 0
                    local.get 2
                    i32.sub
                    local.tee 4
                    i32.const 15
                    i32.gt_u
                    br_if 0 (;@8;)
                    i32.const 0
                    i32.const 0
                    i32.store offset=1051792
                    i32.const 0
                    i32.const 0
                    i32.store offset=1051784
                    local.get 3
                    local.get 0
                    i32.const 3
                    i32.or
                    i32.store offset=4
                    local.get 3
                    local.get 0
                    i32.add
                    local.tee 0
                    local.get 0
                    i32.load offset=4
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    br 1 (;@7;)
                  end
                  i32.const 0
                  local.get 4
                  i32.store offset=1051784
                  i32.const 0
                  local.get 3
                  local.get 2
                  i32.add
                  local.tee 1
                  i32.store offset=1051792
                  local.get 1
                  local.get 4
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 3
                  local.get 0
                  i32.add
                  local.get 4
                  i32.store
                  local.get 3
                  local.get 2
                  i32.const 3
                  i32.or
                  i32.store offset=4
                end
                local.get 3
                i32.const 8
                i32.add
                return
              end
              local.get 0
              local.get 6
              local.get 7
              i32.add
              i32.store offset=4
              i32.const 0
              i32.const 0
              i32.load offset=1051796
              local.tee 0
              i32.const 15
              i32.add
              i32.const -8
              i32.and
              local.tee 3
              i32.const -8
              i32.add
              local.tee 4
              i32.store offset=1051796
              i32.const 0
              local.get 0
              local.get 3
              i32.sub
              i32.const 0
              i32.load offset=1051788
              local.get 7
              i32.add
              local.tee 3
              i32.add
              i32.const 8
              i32.add
              local.tee 1
              i32.store offset=1051788
              local.get 4
              local.get 1
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 0
              local.get 3
              i32.add
              i32.const 40
              i32.store offset=4
              i32.const 0
              i32.const 2097152
              i32.store offset=1051808
              br 3 (;@2;)
            end
            i32.const 0
            local.get 0
            i32.store offset=1051796
            i32.const 0
            i32.const 0
            i32.load offset=1051788
            local.get 3
            i32.add
            local.tee 3
            i32.store offset=1051788
            local.get 0
            local.get 3
            i32.const 1
            i32.or
            i32.store offset=4
            br 1 (;@3;)
          end
          i32.const 0
          local.get 0
          i32.store offset=1051792
          i32.const 0
          i32.const 0
          i32.load offset=1051784
          local.get 3
          i32.add
          local.tee 3
          i32.store offset=1051784
          local.get 0
          local.get 3
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 0
          local.get 3
          i32.add
          local.get 3
          i32.store
        end
        local.get 1
        i32.const 8
        i32.add
        return
      end
      i32.const 0
      local.set 0
      i32.const 0
      i32.load offset=1051788
      local.tee 3
      local.get 2
      i32.le_u
      br_if 0 (;@1;)
      i32.const 0
      local.get 3
      local.get 2
      i32.sub
      local.tee 3
      i32.store offset=1051788
      i32.const 0
      i32.const 0
      i32.load offset=1051796
      local.tee 0
      local.get 2
      i32.add
      local.tee 4
      i32.store offset=1051796
      local.get 4
      local.get 3
      i32.const 1
      i32.or
      i32.store offset=4
      local.get 0
      local.get 2
      i32.const 3
      i32.or
      i32.store offset=4
      local.get 0
      i32.const 8
      i32.add
      return
    end
    local.get 0)
  (func (;33;) (type 3) (param i32 i32)
    (local i32 i32 i32 i32)
    i32.const 31
    local.set 2
    block  ;; label = @1
      local.get 1
      i32.const 16777215
      i32.gt_u
      br_if 0 (;@1;)
      local.get 1
      i32.const 38
      local.get 1
      i32.const 8
      i32.shr_u
      i32.clz
      local.tee 2
      i32.sub
      i32.shr_u
      i32.const 1
      i32.and
      local.get 2
      i32.const 1
      i32.shl
      i32.sub
      i32.const 62
      i32.add
      local.set 2
    end
    local.get 0
    i64.const 0
    i64.store offset=16 align=4
    local.get 0
    local.get 2
    i32.store offset=28
    local.get 2
    i32.const 2
    i32.shl
    i32.const 1051368
    i32.add
    local.set 3
    block  ;; label = @1
      i32.const 0
      i32.load offset=1051780
      i32.const 1
      local.get 2
      i32.shl
      local.tee 4
      i32.and
      br_if 0 (;@1;)
      local.get 3
      local.get 0
      i32.store
      local.get 0
      local.get 3
      i32.store offset=24
      local.get 0
      local.get 0
      i32.store offset=12
      local.get 0
      local.get 0
      i32.store offset=8
      i32.const 0
      i32.const 0
      i32.load offset=1051780
      local.get 4
      i32.or
      i32.store offset=1051780
      return
    end
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.load
          local.tee 4
          i32.load offset=4
          i32.const -8
          i32.and
          local.get 1
          i32.ne
          br_if 0 (;@3;)
          local.get 4
          local.set 2
          br 1 (;@2;)
        end
        local.get 1
        i32.const 0
        i32.const 25
        local.get 2
        i32.const 1
        i32.shr_u
        i32.sub
        local.get 2
        i32.const 31
        i32.eq
        select
        i32.shl
        local.set 3
        loop  ;; label = @3
          local.get 4
          local.get 3
          i32.const 29
          i32.shr_u
          i32.const 4
          i32.and
          i32.add
          local.tee 5
          i32.load offset=16
          local.tee 2
          i32.eqz
          br_if 2 (;@1;)
          local.get 3
          i32.const 1
          i32.shl
          local.set 3
          local.get 2
          local.set 4
          local.get 2
          i32.load offset=4
          i32.const -8
          i32.and
          local.get 1
          i32.ne
          br_if 0 (;@3;)
        end
      end
      local.get 2
      i32.load offset=8
      local.tee 3
      local.get 0
      i32.store offset=12
      local.get 2
      local.get 0
      i32.store offset=8
      local.get 0
      i32.const 0
      i32.store offset=24
      local.get 0
      local.get 2
      i32.store offset=12
      local.get 0
      local.get 3
      i32.store offset=8
      return
    end
    local.get 5
    i32.const 16
    i32.add
    local.get 0
    i32.store
    local.get 0
    local.get 4
    i32.store offset=24
    local.get 0
    local.get 0
    i32.store offset=12
    local.get 0
    local.get 0
    i32.store offset=8)
  (func (;34;) (type 3) (param i32 i32)
    (local i32 i32 i32 i32)
    local.get 0
    i32.load offset=12
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 256
            i32.lt_u
            br_if 0 (;@4;)
            local.get 0
            i32.load offset=24
            local.set 3
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 2
                  local.get 0
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 0
                  i32.const 20
                  i32.const 16
                  local.get 0
                  i32.load offset=20
                  local.tee 2
                  select
                  i32.add
                  i32.load
                  local.tee 1
                  br_if 1 (;@6;)
                  i32.const 0
                  local.set 2
                  br 2 (;@5;)
                end
                local.get 0
                i32.load offset=8
                local.tee 1
                local.get 2
                i32.store offset=12
                local.get 2
                local.get 1
                i32.store offset=8
                br 1 (;@5;)
              end
              local.get 0
              i32.const 20
              i32.add
              local.get 0
              i32.const 16
              i32.add
              local.get 2
              select
              local.set 4
              loop  ;; label = @6
                local.get 4
                local.set 5
                local.get 1
                local.tee 2
                i32.const 20
                i32.add
                local.get 2
                i32.const 16
                i32.add
                local.get 2
                i32.load offset=20
                local.tee 1
                select
                local.set 4
                local.get 2
                i32.const 20
                i32.const 16
                local.get 1
                select
                i32.add
                i32.load
                local.tee 1
                br_if 0 (;@6;)
              end
              local.get 5
              i32.const 0
              i32.store
            end
            local.get 3
            i32.eqz
            br_if 2 (;@2;)
            block  ;; label = @5
              block  ;; label = @6
                local.get 0
                local.get 0
                i32.load offset=28
                i32.const 2
                i32.shl
                i32.const 1051368
                i32.add
                local.tee 1
                i32.load
                i32.eq
                br_if 0 (;@6;)
                local.get 3
                i32.load offset=16
                local.get 0
                i32.eq
                br_if 1 (;@5;)
                local.get 3
                local.get 2
                i32.store offset=20
                local.get 2
                br_if 3 (;@3;)
                br 4 (;@2;)
              end
              local.get 1
              local.get 2
              i32.store
              local.get 2
              i32.eqz
              br_if 4 (;@1;)
              br 2 (;@3;)
            end
            local.get 3
            local.get 2
            i32.store offset=16
            local.get 2
            br_if 1 (;@3;)
            br 2 (;@2;)
          end
          block  ;; label = @4
            local.get 2
            local.get 0
            i32.load offset=8
            local.tee 4
            i32.eq
            br_if 0 (;@4;)
            local.get 4
            local.get 2
            i32.store offset=12
            local.get 2
            local.get 4
            i32.store offset=8
            return
          end
          i32.const 0
          i32.const 0
          i32.load offset=1051776
          i32.const -2
          local.get 1
          i32.const 3
          i32.shr_u
          i32.rotl
          i32.and
          i32.store offset=1051776
          return
        end
        local.get 2
        local.get 3
        i32.store offset=24
        block  ;; label = @3
          local.get 0
          i32.load offset=16
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          local.get 1
          i32.store offset=16
          local.get 1
          local.get 2
          i32.store offset=24
        end
        local.get 0
        i32.load offset=20
        local.tee 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 1
        i32.store offset=20
        local.get 1
        local.get 2
        i32.store offset=24
        return
      end
      return
    end
    i32.const 0
    i32.const 0
    i32.load offset=1051780
    i32.const -2
    local.get 0
    i32.load offset=28
    i32.rotl
    i32.and
    i32.store offset=1051780)
  (func (;35;) (type 2) (param i32)
    local.get 0
    call 36
    unreachable)
  (func (;36;) (type 2) (param i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 1
    global.set 0
    local.get 0
    i32.load
    local.tee 2
    i32.load offset=12
    local.set 3
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.load offset=4
            br_table 0 (;@4;) 1 (;@3;) 2 (;@2;)
          end
          local.get 3
          br_if 1 (;@2;)
          i32.const 1
          local.set 2
          i32.const 0
          local.set 3
          br 2 (;@1;)
        end
        local.get 3
        br_if 0 (;@2;)
        local.get 2
        i32.load
        local.tee 2
        i32.load offset=4
        local.set 3
        local.get 2
        i32.load
        local.set 2
        br 1 (;@1;)
      end
      local.get 1
      i32.const -2147483648
      i32.store
      local.get 1
      local.get 0
      i32.store offset=12
      local.get 1
      i32.const 10
      local.get 0
      i32.load offset=8
      local.tee 0
      i32.load8_u offset=8
      local.get 0
      i32.load8_u offset=9
      call 30
      unreachable
    end
    local.get 1
    local.get 3
    i32.store offset=4
    local.get 1
    local.get 2
    i32.store
    local.get 1
    i32.const 11
    local.get 0
    i32.load offset=8
    local.tee 0
    i32.load8_u offset=8
    local.get 0
    i32.load8_u offset=9
    call 30
    unreachable)
  (func (;37;) (type 3) (param i32 i32)
    local.get 0
    local.get 1
    i64.load align=4
    i64.store)
  (func (;38;) (type 0) (param i32 i32) (result i32)
    block  ;; label = @1
      local.get 0
      i32.load
      i32.load8_u
      br_if 0 (;@1;)
      local.get 1
      i32.const 1048598
      i32.const 5
      call 22
      return
    end
    local.get 1
    i32.const 1048603
    i32.const 4
    call 22)
  (func (;39;) (type 0) (param i32 i32) (result i32)
    local.get 1
    local.get 0
    i32.load offset=4
    local.get 0
    i32.load offset=8
    call 22)
  (func (;40;) (type 7) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 4
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.load offset=16
          br_if 0 (;@3;)
          local.get 1
          i32.const -1
          i32.store offset=16
          local.get 3
          local.set 5
          local.get 3
          local.set 6
          block  ;; label = @4
            local.get 3
            local.get 2
            i32.const 3
            i32.add
            i32.const -4
            i32.and
            local.get 2
            i32.sub
            local.tee 7
            i32.lt_u
            br_if 0 (;@4;)
            local.get 3
            local.get 3
            local.get 7
            i32.sub
            i32.const 7
            i32.and
            local.tee 8
            i32.sub
            local.set 5
            local.get 3
            local.get 8
            i32.lt_u
            br_if 2 (;@2;)
            local.get 7
            local.set 6
          end
          i32.const 0
          local.get 5
          i32.sub
          local.set 9
          local.get 2
          i32.const -1
          i32.add
          local.set 10
          local.get 3
          local.set 7
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    loop  ;; label = @9
                      local.get 9
                      local.get 7
                      i32.add
                      i32.eqz
                      br_if 1 (;@8;)
                      local.get 10
                      local.get 7
                      i32.add
                      local.set 8
                      local.get 7
                      i32.const -1
                      i32.add
                      local.tee 11
                      local.set 7
                      local.get 8
                      i32.load8_u
                      i32.const 10
                      i32.ne
                      br_if 0 (;@9;)
                    end
                    local.get 9
                    local.get 11
                    i32.add
                    i32.const 1
                    i32.add
                    local.get 5
                    i32.add
                    local.set 8
                    br 1 (;@7;)
                  end
                  block  ;; label = @8
                    loop  ;; label = @9
                      local.get 5
                      local.tee 7
                      local.get 6
                      i32.le_u
                      br_if 1 (;@8;)
                      local.get 7
                      i32.const -8
                      i32.add
                      local.set 5
                      i32.const 16843008
                      local.get 2
                      local.get 7
                      i32.add
                      local.tee 8
                      i32.const -8
                      i32.add
                      i32.load
                      local.tee 9
                      i32.const 168430090
                      i32.xor
                      i32.sub
                      local.get 9
                      i32.or
                      i32.const 16843008
                      local.get 8
                      i32.const -4
                      i32.add
                      i32.load
                      local.tee 8
                      i32.const 168430090
                      i32.xor
                      i32.sub
                      local.get 8
                      i32.or
                      i32.and
                      i32.const -2139062144
                      i32.and
                      i32.const -2139062144
                      i32.eq
                      br_if 0 (;@9;)
                    end
                  end
                  local.get 7
                  local.get 3
                  i32.gt_u
                  br_if 6 (;@1;)
                  loop  ;; label = @8
                    local.get 7
                    local.tee 8
                    i32.eqz
                    br_if 2 (;@6;)
                    local.get 8
                    i32.const -1
                    i32.add
                    local.tee 7
                    local.get 2
                    i32.add
                    i32.load8_u
                    i32.const 10
                    i32.ne
                    br_if 0 (;@8;)
                  end
                end
                local.get 3
                local.get 8
                i32.ge_u
                br_if 1 (;@5;)
                local.get 4
                i32.const 0
                i32.store offset=24
                local.get 4
                i32.const 1
                i32.store offset=12
                local.get 4
                i32.const 1050412
                i32.store offset=8
                local.get 4
                i64.const 4
                i64.store offset=16 align=4
                local.get 4
                i32.const 8
                i32.add
                i32.const 1050968
                call 7
                unreachable
              end
              block  ;; label = @6
                block  ;; label = @7
                  local.get 1
                  i32.load offset=28
                  local.tee 7
                  br_if 0 (;@7;)
                  i32.const 0
                  local.set 7
                  br 1 (;@6;)
                end
                local.get 1
                i32.load offset=24
                local.get 7
                i32.add
                i32.const -1
                i32.add
                i32.load8_u
                i32.const 10
                i32.ne
                br_if 0 (;@6;)
                i32.const 0
                local.set 7
                local.get 1
                i32.const 0
                i32.store offset=28
                local.get 1
                i32.const 0
                i32.store8 offset=32
              end
              block  ;; label = @6
                local.get 3
                local.get 1
                i32.load offset=20
                local.get 7
                i32.sub
                i32.lt_u
                br_if 0 (;@6;)
                local.get 0
                local.get 1
                i32.const 20
                i32.add
                local.get 2
                local.get 3
                call 41
                br 2 (;@4;)
              end
              block  ;; label = @6
                local.get 3
                i32.eqz
                br_if 0 (;@6;)
                local.get 1
                i32.load offset=24
                local.get 7
                i32.add
                local.get 2
                local.get 3
                memory.copy
              end
              local.get 0
              i32.const 4
              i32.store8
              local.get 1
              local.get 7
              local.get 3
              i32.add
              i32.store offset=28
              br 1 (;@4;)
            end
            block  ;; label = @5
              local.get 1
              i32.load offset=28
              local.tee 7
              i32.eqz
              br_if 0 (;@5;)
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 8
                    local.get 1
                    i32.load offset=20
                    local.get 7
                    i32.sub
                    i32.lt_u
                    br_if 0 (;@8;)
                    local.get 4
                    i32.const 8
                    i32.add
                    local.get 1
                    i32.const 20
                    i32.add
                    local.get 2
                    local.get 8
                    call 41
                    local.get 4
                    i32.load8_u offset=8
                    i32.const 4
                    i32.eq
                    br_if 1 (;@7;)
                    local.get 0
                    local.get 4
                    i64.load offset=8
                    i64.store align=4
                    br 4 (;@4;)
                  end
                  block  ;; label = @8
                    local.get 8
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 1
                    i32.load offset=24
                    local.get 7
                    i32.add
                    local.get 2
                    local.get 8
                    memory.copy
                  end
                  local.get 1
                  local.get 7
                  local.get 8
                  i32.add
                  local.tee 7
                  i32.store offset=28
                  br 1 (;@6;)
                end
                local.get 1
                i32.load offset=28
                local.set 7
              end
              local.get 7
              i32.eqz
              br_if 0 (;@5;)
              local.get 1
              i32.const 0
              i32.store offset=28
              local.get 1
              i32.const 0
              i32.store8 offset=32
            end
            local.get 2
            local.get 8
            i32.add
            local.set 2
            block  ;; label = @5
              local.get 3
              local.get 8
              i32.sub
              local.tee 7
              local.get 1
              i32.load offset=20
              i32.lt_u
              br_if 0 (;@5;)
              local.get 0
              local.get 1
              i32.const 20
              i32.add
              local.get 2
              local.get 7
              call 41
              br 1 (;@4;)
            end
            block  ;; label = @5
              local.get 7
              i32.eqz
              br_if 0 (;@5;)
              local.get 1
              i32.load offset=24
              local.get 2
              local.get 7
              memory.copy
            end
            local.get 0
            i32.const 4
            i32.store8
            local.get 1
            local.get 7
            i32.store offset=28
          end
          local.get 1
          local.get 1
          i32.load offset=16
          i32.const 1
          i32.add
          i32.store offset=16
          local.get 4
          i32.const 32
          i32.add
          global.set 0
          return
        end
        call 26
        unreachable
      end
      local.get 5
      local.get 3
      local.get 3
      i32.const 1049332
      call 16
      unreachable
    end
    i32.const 0
    local.get 7
    local.get 3
    i32.const 1049316
    call 16
    unreachable)
  (func (;41;) (type 7) (param i32 i32 i32 i32)
    (local i32 i32)
    local.get 1
    i32.load
    local.set 4
    block  ;; label = @1
      local.get 1
      i32.load offset=8
      local.tee 5
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      local.get 4
      local.get 5
      i32.sub
      i32.le_u
      br_if 0 (;@1;)
      i32.const 0
      local.set 5
      local.get 1
      i32.const 0
      i32.store offset=8
      local.get 1
      i32.const 0
      i32.store8 offset=12
    end
    block  ;; label = @1
      local.get 3
      local.get 4
      i32.ge_u
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load offset=4
        local.get 5
        i32.add
        local.get 2
        local.get 3
        memory.copy
      end
      local.get 0
      i32.const 4
      i32.store8
      local.get 1
      local.get 5
      local.get 3
      i32.add
      i32.store offset=8
      return
    end
    local.get 1
    i32.const 0
    i32.store8 offset=12
    local.get 0
    i32.const 4
    i32.store)
  (func (;42;) (type 2) (param i32)
    (local i32 i32 i32 i32)
    local.get 0
    i32.load offset=4
    local.set 1
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.load8_u
                local.tee 0
                i32.const 4
                i32.gt_u
                br_if 0 (;@6;)
                local.get 0
                i32.const 3
                i32.ne
                br_if 1 (;@5;)
              end
              local.get 1
              i32.load
              local.set 0
              block  ;; label = @6
                local.get 1
                i32.const 4
                i32.add
                i32.load
                local.tee 2
                i32.load
                local.tee 3
                i32.eqz
                br_if 0 (;@6;)
                local.get 0
                local.get 3
                call_indirect (type 2)
              end
              block  ;; label = @6
                local.get 2
                i32.load offset=4
                local.tee 2
                i32.eqz
                br_if 0 (;@6;)
                local.get 0
                i32.const -4
                i32.add
                i32.load
                local.tee 3
                i32.const -8
                i32.and
                local.tee 4
                i32.const 4
                i32.const 8
                local.get 3
                i32.const 3
                i32.and
                local.tee 3
                select
                local.get 2
                i32.add
                i32.lt_u
                br_if 2 (;@4;)
                block  ;; label = @7
                  local.get 3
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 4
                  local.get 2
                  i32.const 39
                  i32.add
                  i32.gt_u
                  br_if 4 (;@3;)
                end
                local.get 0
                call 8
              end
              local.get 1
              i32.const -4
              i32.add
              i32.load
              local.tee 0
              i32.const -8
              i32.and
              local.tee 2
              i32.const 16
              i32.const 20
              local.get 0
              i32.const 3
              i32.and
              local.tee 0
              select
              i32.lt_u
              br_if 3 (;@2;)
              block  ;; label = @6
                local.get 0
                i32.eqz
                br_if 0 (;@6;)
                local.get 2
                i32.const 52
                i32.ge_u
                br_if 5 (;@1;)
              end
              local.get 1
              call 8
            end
            return
          end
          i32.const 1050840
          i32.const 1050888
          call 12
          unreachable
        end
        i32.const 1050904
        i32.const 1050952
        call 12
        unreachable
      end
      i32.const 1050840
      i32.const 1050888
      call 12
      unreachable
    end
    i32.const 1050904
    i32.const 1050952
    call 12
    unreachable)
  (func (;43;) (type 1) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    i32.const 8
    i32.add
    local.get 0
    i32.load offset=8
    i32.load
    local.get 1
    local.get 2
    call 40
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 3
              i32.load8_u offset=8
              local.tee 2
              i32.const 4
              i32.eq
              br_if 0 (;@5;)
              local.get 0
              i32.load offset=4
              local.set 4
              block  ;; label = @6
                block  ;; label = @7
                  local.get 0
                  i32.load8_u
                  local.tee 1
                  i32.const 4
                  i32.gt_u
                  br_if 0 (;@7;)
                  local.get 1
                  i32.const 3
                  i32.ne
                  br_if 1 (;@6;)
                end
                local.get 4
                i32.load
                local.set 1
                block  ;; label = @7
                  local.get 4
                  i32.const 4
                  i32.add
                  i32.load
                  local.tee 5
                  i32.load
                  local.tee 6
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 1
                  local.get 6
                  call_indirect (type 2)
                end
                block  ;; label = @7
                  local.get 5
                  i32.load offset=4
                  local.tee 5
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 1
                  i32.const -4
                  i32.add
                  i32.load
                  local.tee 6
                  i32.const -8
                  i32.and
                  local.tee 7
                  i32.const 4
                  i32.const 8
                  local.get 6
                  i32.const 3
                  i32.and
                  local.tee 6
                  select
                  local.get 5
                  i32.add
                  i32.lt_u
                  br_if 3 (;@4;)
                  block  ;; label = @8
                    local.get 6
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 7
                    local.get 5
                    i32.const 39
                    i32.add
                    i32.gt_u
                    br_if 5 (;@3;)
                  end
                  local.get 1
                  call 8
                end
                local.get 4
                i32.const -4
                i32.add
                i32.load
                local.tee 1
                i32.const -8
                i32.and
                local.tee 5
                i32.const 16
                i32.const 20
                local.get 1
                i32.const 3
                i32.and
                local.tee 1
                select
                i32.lt_u
                br_if 4 (;@2;)
                block  ;; label = @7
                  local.get 1
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 5
                  i32.const 52
                  i32.ge_u
                  br_if 6 (;@1;)
                end
                local.get 4
                call 8
              end
              local.get 0
              local.get 3
              i64.load offset=8
              i64.store align=4
            end
            local.get 3
            i32.const 16
            i32.add
            global.set 0
            local.get 2
            i32.const 4
            i32.ne
            return
          end
          i32.const 1050840
          i32.const 1050888
          call 12
          unreachable
        end
        i32.const 1050904
        i32.const 1050952
        call 12
        unreachable
      end
      i32.const 1050840
      i32.const 1050888
      call 12
      unreachable
    end
    i32.const 1050904
    i32.const 1050952
    call 12
    unreachable)
  (func (;44;) (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    i32.const 0
    i32.store offset=4
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.const 128
        i32.lt_u
        br_if 0 (;@2;)
        local.get 1
        i32.const 63
        i32.and
        i32.const -128
        i32.or
        local.set 3
        local.get 1
        i32.const 6
        i32.shr_u
        local.set 4
        block  ;; label = @3
          local.get 1
          i32.const 2048
          i32.ge_u
          br_if 0 (;@3;)
          local.get 2
          local.get 3
          i32.store8 offset=5
          local.get 2
          local.get 4
          i32.const 192
          i32.or
          i32.store8 offset=4
          i32.const 2
          local.set 1
          br 2 (;@1;)
        end
        local.get 1
        i32.const 12
        i32.shr_u
        local.set 5
        local.get 4
        i32.const 63
        i32.and
        i32.const -128
        i32.or
        local.set 4
        block  ;; label = @3
          local.get 1
          i32.const 65535
          i32.gt_u
          br_if 0 (;@3;)
          local.get 2
          local.get 3
          i32.store8 offset=6
          local.get 2
          local.get 4
          i32.store8 offset=5
          local.get 2
          local.get 5
          i32.const 224
          i32.or
          i32.store8 offset=4
          i32.const 3
          local.set 1
          br 2 (;@1;)
        end
        local.get 2
        local.get 3
        i32.store8 offset=7
        local.get 2
        local.get 4
        i32.store8 offset=6
        local.get 2
        local.get 5
        i32.const 63
        i32.and
        i32.const -128
        i32.or
        i32.store8 offset=5
        local.get 2
        local.get 1
        i32.const 18
        i32.shr_u
        i32.const -16
        i32.or
        i32.store8 offset=4
        i32.const 4
        local.set 1
        br 1 (;@1;)
      end
      local.get 2
      local.get 1
      i32.store8 offset=4
      i32.const 1
      local.set 1
    end
    local.get 2
    i32.const 8
    i32.add
    local.get 0
    i32.load offset=8
    i32.load
    local.get 2
    i32.const 4
    i32.add
    local.get 1
    call 40
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              i32.load8_u offset=8
              local.tee 1
              i32.const 4
              i32.eq
              br_if 0 (;@5;)
              local.get 0
              i32.load offset=4
              local.set 4
              block  ;; label = @6
                block  ;; label = @7
                  local.get 0
                  i32.load8_u
                  local.tee 3
                  i32.const 4
                  i32.gt_u
                  br_if 0 (;@7;)
                  local.get 3
                  i32.const 3
                  i32.ne
                  br_if 1 (;@6;)
                end
                local.get 4
                i32.load
                local.set 3
                block  ;; label = @7
                  local.get 4
                  i32.const 4
                  i32.add
                  i32.load
                  local.tee 5
                  i32.load
                  local.tee 6
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 3
                  local.get 6
                  call_indirect (type 2)
                end
                block  ;; label = @7
                  local.get 5
                  i32.load offset=4
                  local.tee 5
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 3
                  i32.const -4
                  i32.add
                  i32.load
                  local.tee 6
                  i32.const -8
                  i32.and
                  local.tee 7
                  i32.const 4
                  i32.const 8
                  local.get 6
                  i32.const 3
                  i32.and
                  local.tee 6
                  select
                  local.get 5
                  i32.add
                  i32.lt_u
                  br_if 3 (;@4;)
                  block  ;; label = @8
                    local.get 6
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 7
                    local.get 5
                    i32.const 39
                    i32.add
                    i32.gt_u
                    br_if 5 (;@3;)
                  end
                  local.get 3
                  call 8
                end
                local.get 4
                i32.const -4
                i32.add
                i32.load
                local.tee 3
                i32.const -8
                i32.and
                local.tee 5
                i32.const 16
                i32.const 20
                local.get 3
                i32.const 3
                i32.and
                local.tee 3
                select
                i32.lt_u
                br_if 4 (;@2;)
                block  ;; label = @7
                  local.get 3
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 5
                  i32.const 52
                  i32.ge_u
                  br_if 6 (;@1;)
                end
                local.get 4
                call 8
              end
              local.get 0
              local.get 2
              i64.load offset=8
              i64.store align=4
            end
            local.get 2
            i32.const 16
            i32.add
            global.set 0
            local.get 1
            i32.const 4
            i32.ne
            return
          end
          i32.const 1050840
          i32.const 1050888
          call 12
          unreachable
        end
        i32.const 1050904
        i32.const 1050952
        call 12
        unreachable
      end
      i32.const 1050840
      i32.const 1050888
      call 12
      unreachable
    end
    i32.const 1050904
    i32.const 1050952
    call 12
    unreachable)
  (func (;45;) (type 0) (param i32 i32) (result i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    block  ;; label = @1
      local.get 1
      i32.load offset=4
      br_table 0 (;@1;) 0 (;@1;) 0 (;@1;)
    end
    local.get 0
    i32.const 1049628
    local.get 1
    call 6
    local.set 1
    local.get 2
    i32.const 16
    i32.add
    global.set 0
    local.get 1)
  (table (;0;) 17 17 funcref)
  (memory (;0;) 17)
  (global (;0;) (mut i32) (i32.const 1048576))
  (global (;1;) i32 (i32.const 1051856))
  (global (;2;) i32 (i32.const 1051856))
  (export "memory" (memory 0))
  (export "f" (func 3))
  (export "main" (func 4))
  (export "__data_end" (global 1))
  (export "__heap_base" (global 2))
  (elem (;0;) (i32.const 1) func 0 13 14 1 39 20 24 25 28 29 37 42 43 44 45 38)
  (data (;0;) (i32.const 1048576) "\0a\00\00\00\01\00\00\00\00\00\00\00\00\00\10\00\01\00\00\000xfalsetrue000102030405060708091011121314151617181920212223242526272829303132333435363738394041424344454647484950515253545556575859606162636465666768697071727374757677787980818283848586878889909192939495969798990123456789abcdef0123456789ABCDEFrange end index  out of range for slice of length \00\00\00\07\01\10\00\10\00\00\00\17\01\10\00\22\00\00\00slice index starts at  but ends at \00L\01\10\00\16\00\00\00b\01\10\00\0d\00\00\00range start index \00\00\80\01\10\00\12\00\00\00\17\01\10\00\22\00\00\00library/std/src/sys/sync/mutex/no_threads.rs\00library/core/src/slice/memchr.rs\00library/std/src/io/stdio.rs\00library/std/src/io/buffered/linewritershim.rs\00library/std/src/sync/reentrant_lock.rs\00library/std/src/sync/once.rs\00library/std/src/io/mod.rs\00library/std/src/thread/mod.rs\00/rust/deps/dlmalloc-0.2.10/src/dlmalloc.rs\00\00\d1\01\10\00 \00\00\00\a0\00\00\00\09\00\00\00\d1\01\10\00 \00\00\00\84\00\00\00\1e\00\00\00==assertion `left  right` failed\0a  left: \0a right: \00\00\06\03\10\00\10\00\00\00\16\03\10\00\17\00\00\00-\03\10\00\09\00\00\00 right` failed: \0a  left: \00\00\00\06\03\10\00\10\00\00\00P\03\10\00\10\00\00\00`\03\10\00\09\00\00\00-\03\10\00\09\00\00\00RefCell already borrowed\01\00\00\00\00\00\00\00: a formatting trait implementation returned an error when the underlying stream did not\ae\03\10\00V\00\00\00\80\02\10\00\19\00\00\00\88\02\00\00\11\00\00\00\0c\00\00\00\0c\00\00\00\04\00\00\00\0d\00\00\00\0e\00\00\00\0f\00\00\00entity not foundpermission deniedconnection refusedconnection resethost unreachablenetwork unreachableconnection abortednot connectedaddress in useaddress not availablenetwork downbroken pipeentity already existsoperation would blocknot a directoryis a directorydirectory not emptyread-only filesystem or storage mediumfilesystem loop or indirection limit (e.g. symlink loop)stale network file handleinvalid input parameterinvalid datatimed outwrite zerono storage spaceseek on unseekable filequota exceededfile too largeresource busyexecutable file busydeadlockcross-device link or renametoo many linksinvalid filenameargument list too longoperation interruptedunsupportedunexpected end of fileout of memoryin progressother erroruncategorized errormid > len\00\00!\07\10\00\09\00\00\00stdoutfailed printing to \00\00\00:\07\10\00\13\00\00\00\ac\03\10\00\02\00\00\00\f2\01\10\00\1b\00\00\00\8d\04\00\00\09\00\00\00operation successfulone-time initialization may not be performed recursively\84\07\10\008\00\00\00cannot recursively acquire mutex\c4\07\10\00 \00\00\00\a4\01\10\00,\00\00\00\13\00\00\00\09\00\00\00lock count overflow in reentrant mutex\00\00<\02\10\00&\00\00\00#\01\00\00-\00\00\00c\02\10\00\1c\00\00\00\d9\00\00\00\14\00\00\00failed to generate unique thread ID: bitspace exhausted\00D\08\10\007\00\00\00\9a\02\10\00\1d\00\00\00\d6\04\00\00\0d\00\00\00\00\00\00\00\04\00\00\00\04\00\00\00\10\00\00\00 (os error )\01\00\00\00\00\00\00\00\a4\08\10\00\0b\00\00\00\af\08\10\00\01\00\00\00\f2\01\10\00\1b\00\00\00\5c\03\00\00\14\00\00\00assertion failed: psize >= size + min_overhead\00\00\b8\02\10\00*\00\00\00\b1\04\00\00\09\00\00\00assertion failed: psize <= size + max_overhead\00\00\b8\02\10\00*\00\00\00\b7\04\00\00\0d\00\00\00\0e\02\10\00-\00\00\00\16\01\00\00)\00\00\00\10\00\00\00\11\00\00\00\12\00\00\00\10\00\00\00\10\00\00\00\13\00\00\00\12\00\00\00\0d\00\00\00\0e\00\00\00\15\00\00\00\0c\00\00\00\0b\00\00\00\15\00\00\00\15\00\00\00\0f\00\00\00\0e\00\00\00\13\00\00\00&\00\00\008\00\00\00\19\00\00\00\17\00\00\00\0c\00\00\00\09\00\00\00\0a\00\00\00\10\00\00\00\17\00\00\00\0e\00\00\00\0e\00\00\00\0d\00\00\00\14\00\00\00\08\00\00\00\1b\00\00\00\0e\00\00\00\10\00\00\00\16\00\00\00\15\00\00\00\0b\00\00\00\16\00\00\00\0d\00\00\00\0b\00\00\00\0b\00\00\00\13\00\00\004\04\10\00D\04\10\00U\04\10\00g\04\10\00w\04\10\00\87\04\10\00\9a\04\10\00\ac\04\10\00\b9\04\10\00\c7\04\10\00\dc\04\10\00\e8\04\10\00\f3\04\10\00\08\05\10\00\1d\05\10\00,\05\10\00:\05\10\00M\05\10\00s\05\10\00\ab\05\10\00\c4\05\10\00\db\05\10\00\e7\05\10\00\f0\05\10\00\fa\05\10\00\0a\06\10\00!\06\10\00/\06\10\00=\06\10\00J\06\10\00^\06\10\00f\06\10\00\81\06\10\00\8f\06\10\00\9f\06\10\00\b5\06\10\00\ca\06\10\00\d5\06\10\00\eb\06\10\00\f8\06\10\00\03\07\10\00\0e\07\10\00"))
