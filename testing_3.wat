(module
  (type $t0 (func (param i32 i32) (result i32)))
  (type $t1 (func (param i32 i32 i32) (result i32)))
  (type $t2 (func (param i32)))
  (type $t3 (func (param i32 i32)))
  (type $t4 (func (param i32 i32 i32 i32 i32 i32) (result i32)))
  (type $t5 (func))
  (type $t6 (func (param i32 i32 i32 i32 i32) (result i32)))
  (type $t7 (func (param i32 i32 i32 i32)))
  (type $t8 (func (param i32 i32 i32)))
  (type $t9 (func (param i32) (result i32)))
  (func $f0 (type $t0) (param $p0 i32) (param $p1 i32) (result i32)
    (local $l2 i32) (local $l3 i32) (local $l4 i32)
    global.get $g0
    i32.const 16
    i32.sub
    local.tee $l2
    global.set $g0
    block $B0
      block $B1
        block $B2
          local.get $p1
          i32.load offset=8
          local.tee $l3
          i32.const 33554432
          i32.and
          br_if $B2
          local.get $l3
          i32.const 67108864
          i32.and
          br_if $B1
          local.get $p0
          local.get $p1
          call $f1
          local.set $p0
          br $B0
        end
        local.get $p0
        i32.load
        local.set $p0
        i32.const 9
        local.set $l3
        loop $L3
          local.get $l2
          i32.const 8
          i32.add
          local.get $l3
          i32.add
          i32.const -2
          i32.add
          local.get $p0
          i32.const 15
          i32.and
          i32.load8_u offset=1048807
          i32.store8
          local.get $l3
          i32.const -1
          i32.add
          local.set $l3
          local.get $p0
          i32.const 15
          i32.gt_u
          local.set $l4
          local.get $p0
          i32.const 4
          i32.shr_u
          local.set $p0
          local.get $l4
          br_if $L3
        end
        local.get $p1
        i32.const 1
        i32.const 1048596
        i32.const 2
        local.get $l2
        i32.const 8
        i32.add
        local.get $l3
        i32.add
        i32.const -1
        i32.add
        i32.const 9
        local.get $l3
        i32.sub
        call $f2
        local.set $p0
        br $B0
      end
      local.get $p0
      i32.load
      local.set $p0
      i32.const 9
      local.set $l3
      loop $L4
        local.get $l2
        i32.const 8
        i32.add
        local.get $l3
        i32.add
        i32.const -2
        i32.add
        local.get $p0
        i32.const 15
        i32.and
        i32.load8_u offset=1048823
        i32.store8
        local.get $l3
        i32.const -1
        i32.add
        local.set $l3
        local.get $p0
        i32.const 15
        i32.gt_u
        local.set $l4
        local.get $p0
        i32.const 4
        i32.shr_u
        local.set $p0
        local.get $l4
        br_if $L4
      end
      local.get $p1
      i32.const 1
      i32.const 1048596
      i32.const 2
      local.get $l2
      i32.const 8
      i32.add
      local.get $l3
      i32.add
      i32.const -1
      i32.add
      i32.const 9
      local.get $l3
      i32.sub
      call $f2
      local.set $p0
    end
    local.get $l2
    i32.const 16
    i32.add
    global.set $g0
    local.get $p0)
  (func $f1 (type $t0) (param $p0 i32) (param $p1 i32) (result i32)
    (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32) (local $l6 i32) (local $l7 i32) (local $l8 i32)
    global.get $g0
    i32.const 16
    i32.sub
    local.tee $l2
    global.set $g0
    i32.const 10
    local.set $l3
    block $B0
      block $B1
        local.get $p0
        i32.load
        local.tee $l4
        local.get $l4
        i32.const 31
        i32.shr_s
        local.tee $p0
        i32.xor
        local.get $p0
        i32.sub
        local.tee $p0
        i32.const 1000
        i32.ge_u
        br_if $B1
        local.get $p0
        local.set $l5
        br $B0
      end
      i32.const 10
      local.set $l3
      loop $L2
        local.get $l2
        i32.const 6
        i32.add
        local.get $l3
        i32.add
        local.tee $l6
        i32.const -4
        i32.add
        local.get $p0
        local.get $p0
        i32.const 10000
        i32.div_u
        local.tee $l5
        i32.const 10000
        i32.mul
        i32.sub
        local.tee $l7
        i32.const 65535
        i32.and
        i32.const 100
        i32.div_u
        local.tee $l8
        i32.const 1
        i32.shl
        i32.load16_u offset=1048607 align=1
        i32.store16 align=1
        local.get $l6
        i32.const -2
        i32.add
        local.get $l7
        local.get $l8
        i32.const 100
        i32.mul
        i32.sub
        i32.const 65535
        i32.and
        i32.const 1
        i32.shl
        i32.load16_u offset=1048607 align=1
        i32.store16 align=1
        local.get $l3
        i32.const -4
        i32.add
        local.set $l3
        local.get $p0
        i32.const 9999999
        i32.gt_u
        local.set $l6
        local.get $l5
        local.set $p0
        local.get $l6
        br_if $L2
      end
    end
    block $B3
      block $B4
        local.get $l5
        i32.const 9
        i32.gt_u
        br_if $B4
        local.get $l5
        local.set $p0
        br $B3
      end
      local.get $l2
      i32.const 6
      i32.add
      local.get $l3
      i32.const -2
      i32.add
      local.tee $l3
      i32.add
      local.get $l5
      local.get $l5
      i32.const 65535
      i32.and
      i32.const 100
      i32.div_u
      local.tee $p0
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
    block $B5
      block $B6
        local.get $l4
        i32.eqz
        br_if $B6
        local.get $p0
        i32.eqz
        br_if $B5
      end
      local.get $l2
      i32.const 6
      i32.add
      local.get $l3
      i32.const -1
      i32.add
      local.tee $l3
      i32.add
      local.get $p0
      i32.const 1
      i32.shl
      i32.load8_u offset=1048608
      i32.store8
    end
    local.get $p1
    local.get $l4
    i32.const -1
    i32.xor
    i32.const 31
    i32.shr_u
    i32.const 1
    i32.const 0
    local.get $l2
    i32.const 6
    i32.add
    local.get $l3
    i32.add
    i32.const 10
    local.get $l3
    i32.sub
    call $f2
    local.set $p0
    local.get $l2
    i32.const 16
    i32.add
    global.set $g0
    local.get $p0)
  (func $f2 (type $t4) (param $p0 i32) (param $p1 i32) (param $p2 i32) (param $p3 i32) (param $p4 i32) (param $p5 i32) (result i32)
    (local $l6 i32) (local $l7 i32) (local $l8 i32) (local $l9 i32) (local $l10 i32) (local $l11 i32) (local $l12 i64)
    block $B0
      block $B1
        local.get $p1
        br_if $B1
        local.get $p5
        i32.const 1
        i32.add
        local.set $l6
        local.get $p0
        i32.load offset=8
        local.set $l7
        i32.const 45
        local.set $l8
        br $B0
      end
      i32.const 43
      i32.const 1114112
      local.get $p0
      i32.load offset=8
      local.tee $l7
      i32.const 2097152
      i32.and
      local.tee $p1
      select
      local.set $l8
      local.get $p1
      i32.const 21
      i32.shr_u
      local.get $p5
      i32.add
      local.set $l6
    end
    block $B2
      block $B3
        local.get $l7
        i32.const 8388608
        i32.and
        br_if $B3
        i32.const 0
        local.set $p2
        br $B2
      end
      block $B4
        block $B5
          local.get $p3
          br_if $B5
          i32.const 0
          local.set $p1
          br $B4
        end
        local.get $p2
        i32.load8_s
        i32.const -65
        i32.gt_s
        local.set $p1
        local.get $p3
        i32.const 1
        i32.eq
        br_if $B4
        local.get $p1
        local.get $p2
        i32.load8_s offset=1
        i32.const -65
        i32.gt_s
        i32.add
        local.set $p1
      end
      local.get $p1
      local.get $l6
      i32.add
      local.set $l6
    end
    block $B6
      block $B7
        local.get $l6
        local.get $p0
        i32.load16_u offset=12
        local.tee $l9
        i32.ge_u
        br_if $B7
        block $B8
          block $B9
            block $B10
              local.get $l7
              i32.const 16777216
              i32.and
              br_if $B10
              local.get $l9
              local.get $l6
              i32.sub
              local.set $l9
              i32.const 0
              local.set $p1
              i32.const 0
              local.set $l10
              block $B11
                block $B12
                  block $B13
                    local.get $l7
                    i32.const 29
                    i32.shr_u
                    i32.const 3
                    i32.and
                    br_table $B11 $B13 $B12 $B13 $B11
                  end
                  local.get $l9
                  local.set $l10
                  br $B11
                end
                local.get $l9
                i32.const 65534
                i32.and
                i32.const 1
                i32.shr_u
                local.set $l10
              end
              local.get $l7
              i32.const 2097151
              i32.and
              local.set $l11
              local.get $p0
              i32.load offset=4
              local.set $l6
              local.get $p0
              i32.load
              local.set $p0
              loop $L14
                local.get $p1
                i32.const 65535
                i32.and
                local.get $l10
                i32.const 65535
                i32.and
                i32.ge_u
                br_if $B9
                i32.const 1
                local.set $l7
                local.get $p1
                i32.const 1
                i32.add
                local.set $p1
                local.get $p0
                local.get $l11
                local.get $l6
                i32.load offset=16
                call_indirect $T0 (type $t0)
                i32.eqz
                br_if $L14
                br $B6
              end
            end
            local.get $p0
            local.get $p0
            i64.load offset=8 align=4
            local.tee $l12
            i32.wrap_i64
            i32.const -1612709888
            i32.and
            i32.const 536870960
            i32.or
            i32.store offset=8
            i32.const 1
            local.set $l7
            local.get $p0
            i32.load
            local.tee $l11
            local.get $p0
            i32.load offset=4
            local.tee $l10
            local.get $l8
            local.get $p2
            local.get $p3
            call $f15
            br_if $B6
            i32.const 0
            local.set $p1
            local.get $l9
            local.get $l6
            i32.sub
            i32.const 65535
            i32.and
            local.set $l6
            loop $L15
              local.get $p1
              i32.const 65535
              i32.and
              local.get $l6
              i32.ge_u
              br_if $B8
              i32.const 1
              local.set $l7
              local.get $p1
              i32.const 1
              i32.add
              local.set $p1
              local.get $l11
              i32.const 48
              local.get $l10
              i32.load offset=16
              call_indirect $T0 (type $t0)
              i32.eqz
              br_if $L15
              br $B6
            end
          end
          i32.const 1
          local.set $l7
          local.get $p0
          local.get $l6
          local.get $l8
          local.get $p2
          local.get $p3
          call $f15
          br_if $B6
          local.get $p0
          local.get $p4
          local.get $p5
          local.get $l6
          i32.load offset=12
          call_indirect $T0 (type $t1)
          br_if $B6
          local.get $l9
          local.get $l10
          i32.sub
          i32.const 65535
          i32.and
          local.set $l10
          i32.const 0
          local.set $p1
          loop $L16
            block $B17
              local.get $p1
              i32.const 65535
              i32.and
              local.get $l10
              i32.lt_u
              br_if $B17
              i32.const 0
              return
            end
            i32.const 1
            local.set $l7
            local.get $p1
            i32.const 1
            i32.add
            local.set $p1
            local.get $p0
            local.get $l11
            local.get $l6
            i32.load offset=16
            call_indirect $T0 (type $t0)
            i32.eqz
            br_if $L16
            br $B6
          end
        end
        i32.const 1
        local.set $l7
        local.get $l11
        local.get $p4
        local.get $p5
        local.get $l10
        i32.load offset=12
        call_indirect $T0 (type $t1)
        br_if $B6
        local.get $p0
        local.get $l12
        i64.store offset=8 align=4
        i32.const 0
        return
      end
      i32.const 1
      local.set $l7
      local.get $p0
      i32.load
      local.tee $p1
      local.get $p0
      i32.load offset=4
      local.tee $p0
      local.get $l8
      local.get $p2
      local.get $p3
      call $f15
      br_if $B6
      local.get $p1
      local.get $p4
      local.get $p5
      local.get $p0
      i32.load offset=12
      call_indirect $T0 (type $t1)
      local.set $l7
    end
    local.get $l7)
  (func $f (type $t0) (param $p0 i32) (param $p1 i32) (result i32)
    local.get $p1
    local.get $p0
    i32.add)
  (func $main (type $t5)
    (local $l0 i32) (local $l1 i64) (local $l2 i64) (local $l3 i64) (local $l4 i32) (local $l5 i32) (local $l6 i32) (local $l7 i32) (local $l8 i32)
    global.get $g0
    i32.const 112
    i32.sub
    local.tee $l0
    global.set $g0
    local.get $l0
    i32.const 0
    i32.store offset=12
    local.get $l0
    i32.const 2
    i32.store offset=20
    local.get $l0
    i32.const 1048580
    i32.store offset=16
    local.get $l0
    i64.const 1
    i64.store offset=28 align=4
    local.get $l0
    i32.const 1
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get $l0
    i32.const 12
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=40
    local.get $l0
    local.get $l0
    i32.const 40
    i32.add
    i32.store offset=24
    local.get $l0
    i32.const 6
    i32.store offset=52
    local.get $l0
    i32.const 1050420
    i32.store offset=48
    block $B0
      i32.const 0
      i32.load8_u offset=1051360
      i32.const 3
      i32.eq
      br_if $B0
      call $f5
    end
    block $B1
      block $B2
        block $B3
          block $B4
            block $B5
              block $B6
                block $B7
                  block $B8
                    block $B9
                      i32.const 0
                      i64.load offset=1051824
                      local.tee $l1
                      i64.const 0
                      i64.ne
                      br_if $B9
                      i32.const 0
                      i64.load offset=1051832
                      local.set $l2
                      loop $L10
                        local.get $l2
                        i64.const -1
                        i64.eq
                        br_if $B8
                        i32.const 0
                        local.get $l2
                        i64.const 1
                        i64.add
                        local.tee $l1
                        i32.const 0
                        i64.load offset=1051832
                        local.tee $l3
                        local.get $l3
                        local.get $l2
                        i64.eq
                        local.tee $l4
                        select
                        i64.store offset=1051832
                        local.get $l3
                        local.set $l2
                        local.get $l4
                        i32.eqz
                        br_if $L10
                      end
                      i32.const 0
                      local.get $l1
                      i64.store offset=1051824
                    end
                    block $B11
                      block $B12
                        local.get $l1
                        i32.const 0
                        i64.load offset=1051320
                        i64.eq
                        br_if $B12
                        i32.const 0
                        i32.load8_u offset=1051332
                        local.set $l5
                        i32.const 1
                        local.set $l4
                        i32.const 0
                        i32.const 1
                        i32.store8 offset=1051332
                        local.get $l0
                        local.get $l5
                        i32.store8 offset=72
                        local.get $l5
                        br_if $B7
                        i32.const 0
                        local.get $l1
                        i64.store offset=1051320
                        br $B11
                      end
                      i32.const 0
                      i32.load offset=1051328
                      local.tee $l4
                      i32.const -1
                      i32.eq
                      br_if $B6
                      local.get $l4
                      i32.const 1
                      i32.add
                      local.set $l4
                    end
                    i32.const 0
                    local.get $l4
                    i32.store offset=1051328
                    local.get $l0
                    i32.const 1051320
                    i32.store offset=64
                    local.get $l0
                    i32.const 4
                    i32.store8 offset=56
                    local.get $l0
                    local.get $l0
                    i64.load offset=56
                    local.tee $l2
                    i64.store offset=72
                    local.get $l0
                    local.get $l0
                    i32.const 64
                    i32.add
                    i32.store offset=80
                    local.get $l0
                    i32.const 72
                    i32.add
                    i32.const 1049628
                    local.get $l0
                    i32.const 16
                    i32.add
                    call $f6
                    local.set $l5
                    local.get $l0
                    i32.load8_u offset=72
                    local.set $l4
                    block $B13
                      block $B14
                        block $B15
                          local.get $l5
                          i32.eqz
                          br_if $B15
                          local.get $l4
                          i32.const 4
                          i32.ne
                          br_if $B14
                          local.get $l0
                          i32.const 0
                          i32.store offset=104
                          local.get $l0
                          i32.const 1
                          i32.store offset=92
                          local.get $l0
                          i32.const 1049604
                          i32.store offset=88
                          local.get $l0
                          i64.const 4
                          i64.store offset=96 align=4
                          local.get $l0
                          i32.const 88
                          i32.add
                          i32.const 1049612
                          call $f7
                          unreachable
                        end
                        local.get $l0
                        i32.load offset=76
                        local.set $l5
                        block $B16
                          local.get $l4
                          i32.const 4
                          i32.gt_u
                          br_if $B16
                          local.get $l4
                          i32.const 3
                          i32.ne
                          br_if $B13
                        end
                        local.get $l5
                        i32.load
                        local.set $l4
                        block $B17
                          local.get $l5
                          i32.const 4
                          i32.add
                          i32.load
                          local.tee $l6
                          i32.load
                          local.tee $l7
                          i32.eqz
                          br_if $B17
                          local.get $l4
                          local.get $l7
                          call_indirect $T0 (type $t2)
                        end
                        block $B18
                          local.get $l6
                          i32.load offset=4
                          local.tee $l6
                          i32.eqz
                          br_if $B18
                          local.get $l4
                          i32.const -4
                          i32.add
                          i32.load
                          local.tee $l7
                          i32.const -8
                          i32.and
                          local.tee $l8
                          i32.const 4
                          i32.const 8
                          local.get $l7
                          i32.const 3
                          i32.and
                          local.tee $l7
                          select
                          local.get $l6
                          i32.add
                          i32.lt_u
                          br_if $B5
                          block $B19
                            local.get $l7
                            i32.eqz
                            br_if $B19
                            local.get $l8
                            local.get $l6
                            i32.const 39
                            i32.add
                            i32.gt_u
                            br_if $B4
                          end
                          local.get $l4
                          call $f8
                        end
                        local.get $l5
                        i32.const -4
                        i32.add
                        i32.load
                        local.tee $l4
                        i32.const -8
                        i32.and
                        local.tee $l6
                        i32.const 16
                        i32.const 20
                        local.get $l4
                        i32.const 3
                        i32.and
                        local.tee $l4
                        select
                        i32.lt_u
                        br_if $B3
                        block $B20
                          local.get $l4
                          i32.eqz
                          br_if $B20
                          local.get $l6
                          i32.const 52
                          i32.ge_u
                          br_if $B2
                        end
                        local.get $l5
                        call $f8
                        br $B13
                      end
                      local.get $l0
                      i64.load offset=72
                      local.set $l2
                    end
                    local.get $l0
                    i32.load offset=64
                    local.tee $l4
                    local.get $l4
                    i32.load offset=8
                    i32.const -1
                    i32.add
                    local.tee $l5
                    i32.store offset=8
                    local.get $l2
                    i64.const 255
                    i64.and
                    local.set $l3
                    block $B21
                      local.get $l5
                      br_if $B21
                      local.get $l4
                      i32.const 0
                      i32.store8 offset=12
                      local.get $l4
                      i64.const 0
                      i64.store
                    end
                    local.get $l3
                    i64.const 4
                    i64.ne
                    br_if $B1
                    local.get $l0
                    i32.const 112
                    i32.add
                    global.set $g0
                    return
                  end
                  call $f9
                  unreachable
                end
                local.get $l0
                i64.const 0
                i64.store offset=100 align=4
                local.get $l0
                i64.const 17179869185
                i64.store offset=92 align=4
                local.get $l0
                i32.const 1050596
                i32.store offset=88
                local.get $l0
                i32.const 72
                i32.add
                local.get $l0
                i32.const 88
                i32.add
                call $f10
                unreachable
              end
              call $f11
              unreachable
            end
            i32.const 1050840
            i32.const 1050888
            call $f12
            unreachable
          end
          i32.const 1050904
          i32.const 1050952
          call $f12
          unreachable
        end
        i32.const 1050840
        i32.const 1050888
        call $f12
        unreachable
      end
      i32.const 1050904
      i32.const 1050952
      call $f12
      unreachable
    end
    local.get $l0
    local.get $l2
    i64.store offset=64
    local.get $l0
    i32.const 2
    i32.store offset=92
    local.get $l0
    i32.const 1050448
    i32.store offset=88
    local.get $l0
    i64.const 2
    i64.store offset=100 align=4
    local.get $l0
    i32.const 2
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get $l0
    i32.const 64
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=80
    local.get $l0
    i32.const 3
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get $l0
    i32.const 48
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=72
    local.get $l0
    local.get $l0
    i32.const 72
    i32.add
    i32.store offset=96
    local.get $l0
    i32.const 88
    i32.add
    i32.const 1050464
    call $f7
    unreachable)
  (func $f5 (type $t5)
    (local $l0 i32) (local $l1 i32)
    global.get $g0
    i32.const 32
    i32.sub
    local.tee $l0
    global.set $g0
    block $B0
      block $B1
        block $B2
          block $B3
            i32.const 0
            i32.load8_u offset=1051360
            br_table $B3 $B3 $B0 $B2 $B3
          end
          i32.const 0
          i32.const 2
          i32.store8 offset=1051360
          i32.const 1024
          call $f32
          local.tee $l1
          i32.eqz
          br_if $B1
          i32.const 0
          i32.const 3
          i32.store8 offset=1051360
          i32.const 0
          local.get $l1
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
        local.get $l0
        i32.const 32
        i32.add
        global.set $g0
        return
      end
      unreachable
    end
    local.get $l0
    i32.const 0
    i32.store offset=24
    local.get $l0
    i32.const 1
    i32.store offset=12
    local.get $l0
    i32.const 1050556
    i32.store offset=8
    local.get $l0
    i64.const 4
    i64.store offset=16 align=4
    local.get $l0
    i32.const 8
    i32.add
    i32.const 1050676
    call $f7
    unreachable)
  (func $f6 (type $t1) (param $p0 i32) (param $p1 i32) (param $p2 i32) (result i32)
    (local $l3 i32) (local $l4 i32) (local $l5 i32) (local $l6 i32) (local $l7 i32) (local $l8 i32) (local $l9 i32) (local $l10 i32)
    global.get $g0
    i32.const 16
    i32.sub
    local.tee $l3
    global.set $g0
    local.get $l3
    local.get $p1
    i32.store offset=4
    local.get $l3
    local.get $p0
    i32.store
    local.get $l3
    i64.const 3758096416
    i64.store offset=8 align=4
    block $B0
      block $B1
        block $B2
          block $B3
            block $B4
              local.get $p2
              i32.load offset=16
              local.tee $l4
              i32.eqz
              br_if $B4
              local.get $p2
              i32.load offset=20
              local.tee $p1
              br_if $B3
              br $B2
            end
            local.get $p2
            i32.load offset=12
            local.tee $p0
            i32.eqz
            br_if $B2
            local.get $p2
            i32.load offset=8
            local.tee $p1
            local.get $p0
            i32.const 3
            i32.shl
            local.tee $p0
            i32.add
            local.set $l5
            local.get $p0
            i32.const -8
            i32.add
            i32.const 3
            i32.shr_u
            i32.const 1
            i32.add
            local.set $l6
            local.get $p2
            i32.load
            local.set $p0
            loop $L5
              block $B6
                local.get $p0
                i32.const 4
                i32.add
                i32.load
                local.tee $l7
                i32.eqz
                br_if $B6
                local.get $l3
                i32.load
                local.get $p0
                i32.load
                local.get $l7
                local.get $l3
                i32.load offset=4
                i32.load offset=12
                call_indirect $T0 (type $t1)
                i32.eqz
                br_if $B6
                i32.const 1
                local.set $p1
                br $B0
              end
              block $B7
                local.get $p1
                i32.load
                local.get $l3
                local.get $p1
                i32.const 4
                i32.add
                i32.load
                call_indirect $T0 (type $t0)
                i32.eqz
                br_if $B7
                i32.const 1
                local.set $p1
                br $B0
              end
              local.get $p0
              i32.const 8
              i32.add
              local.set $p0
              local.get $p1
              i32.const 8
              i32.add
              local.tee $p1
              local.get $l5
              i32.eq
              br_if $B1
              br $L5
            end
          end
          local.get $p1
          i32.const 24
          i32.mul
          local.set $l8
          local.get $p1
          i32.const -1
          i32.add
          i32.const 536870911
          i32.and
          i32.const 1
          i32.add
          local.set $l6
          local.get $p2
          i32.load offset=8
          local.set $l9
          local.get $p2
          i32.load
          local.set $p0
          i32.const 0
          local.set $l7
          loop $L8
            block $B9
              local.get $p0
              i32.const 4
              i32.add
              i32.load
              local.tee $p1
              i32.eqz
              br_if $B9
              local.get $l3
              i32.load
              local.get $p0
              i32.load
              local.get $p1
              local.get $l3
              i32.load offset=4
              i32.load offset=12
              call_indirect $T0 (type $t1)
              i32.eqz
              br_if $B9
              i32.const 1
              local.set $p1
              br $B0
            end
            i32.const 0
            local.set $l5
            i32.const 0
            local.set $l10
            block $B10
              block $B11
                block $B12
                  local.get $l4
                  local.get $l7
                  i32.add
                  local.tee $p1
                  i32.const 8
                  i32.add
                  i32.load16_u
                  br_table $B12 $B11 $B10 $B12
                end
                local.get $p1
                i32.const 10
                i32.add
                i32.load16_u
                local.set $l10
                br $B10
              end
              local.get $l9
              local.get $p1
              i32.const 12
              i32.add
              i32.load
              i32.const 3
              i32.shl
              i32.add
              i32.load16_u offset=4
              local.set $l10
            end
            block $B13
              block $B14
                block $B15
                  local.get $p1
                  i32.load16_u
                  br_table $B15 $B14 $B13 $B15
                end
                local.get $p1
                i32.const 2
                i32.add
                i32.load16_u
                local.set $l5
                br $B13
              end
              local.get $l9
              local.get $p1
              i32.const 4
              i32.add
              i32.load
              i32.const 3
              i32.shl
              i32.add
              i32.load16_u offset=4
              local.set $l5
            end
            local.get $l3
            local.get $l5
            i32.store16 offset=14
            local.get $l3
            local.get $l10
            i32.store16 offset=12
            local.get $l3
            local.get $p1
            i32.const 20
            i32.add
            i32.load
            i32.store offset=8
            block $B16
              local.get $l9
              local.get $p1
              i32.const 16
              i32.add
              i32.load
              i32.const 3
              i32.shl
              i32.add
              local.tee $p1
              i32.load
              local.get $l3
              local.get $p1
              i32.load offset=4
              call_indirect $T0 (type $t0)
              i32.eqz
              br_if $B16
              i32.const 1
              local.set $p1
              br $B0
            end
            local.get $p0
            i32.const 8
            i32.add
            local.set $p0
            local.get $l8
            local.get $l7
            i32.const 24
            i32.add
            local.tee $l7
            i32.eq
            br_if $B1
            br $L8
          end
        end
        i32.const 0
        local.set $l6
      end
      block $B17
        local.get $l6
        local.get $p2
        i32.load offset=4
        i32.ge_u
        br_if $B17
        local.get $l3
        i32.load
        local.get $p2
        i32.load
        local.get $l6
        i32.const 3
        i32.shl
        i32.add
        local.tee $p1
        i32.load
        local.get $p1
        i32.load offset=4
        local.get $l3
        i32.load offset=4
        i32.load offset=12
        call_indirect $T0 (type $t1)
        i32.eqz
        br_if $B17
        i32.const 1
        local.set $p1
        br $B0
      end
      i32.const 0
      local.set $p1
    end
    local.get $l3
    i32.const 16
    i32.add
    global.set $g0
    local.get $p1)
  (func $f7 (type $t3) (param $p0 i32) (param $p1 i32)
    (local $l2 i32)
    global.get $g0
    i32.const 16
    i32.sub
    local.tee $l2
    global.set $g0
    local.get $l2
    i32.const 1
    i32.store16 offset=12
    local.get $l2
    local.get $p1
    i32.store offset=8
    local.get $l2
    local.get $p0
    i32.store offset=4
    local.get $l2
    i32.const 4
    i32.add
    call $f21
    unreachable)
  (func $f8 (type $t2) (param $p0 i32)
    (local $l1 i32) (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32)
    local.get $p0
    i32.const -8
    i32.add
    local.tee $l1
    local.get $p0
    i32.const -4
    i32.add
    i32.load
    local.tee $l2
    i32.const -8
    i32.and
    local.tee $p0
    i32.add
    local.set $l3
    block $B0
      block $B1
        local.get $l2
        i32.const 1
        i32.and
        br_if $B1
        local.get $l2
        i32.const 2
        i32.and
        i32.eqz
        br_if $B0
        local.get $l1
        i32.load
        local.tee $l2
        local.get $p0
        i32.add
        local.set $p0
        block $B2
          local.get $l1
          local.get $l2
          i32.sub
          local.tee $l1
          i32.const 0
          i32.load offset=1051792
          i32.ne
          br_if $B2
          local.get $l3
          i32.load offset=4
          i32.const 3
          i32.and
          i32.const 3
          i32.ne
          br_if $B1
          i32.const 0
          local.get $p0
          i32.store offset=1051784
          local.get $l3
          local.get $l3
          i32.load offset=4
          i32.const -2
          i32.and
          i32.store offset=4
          local.get $l1
          local.get $p0
          i32.const 1
          i32.or
          i32.store offset=4
          local.get $l3
          local.get $p0
          i32.store
          return
        end
        local.get $l1
        local.get $l2
        call $f34
      end
      block $B3
        block $B4
          block $B5
            block $B6
              block $B7
                block $B8
                  block $B9
                    block $B10
                      local.get $l3
                      i32.load offset=4
                      local.tee $l2
                      i32.const 2
                      i32.and
                      br_if $B10
                      local.get $l3
                      i32.const 0
                      i32.load offset=1051796
                      i32.eq
                      br_if $B8
                      local.get $l3
                      i32.const 0
                      i32.load offset=1051792
                      i32.eq
                      br_if $B7
                      local.get $l3
                      local.get $l2
                      i32.const -8
                      i32.and
                      local.tee $l2
                      call $f34
                      local.get $l1
                      local.get $l2
                      local.get $p0
                      i32.add
                      local.tee $p0
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get $l1
                      local.get $p0
                      i32.add
                      local.get $p0
                      i32.store
                      local.get $l1
                      i32.const 0
                      i32.load offset=1051792
                      i32.ne
                      br_if $B9
                      i32.const 0
                      local.get $p0
                      i32.store offset=1051784
                      return
                    end
                    local.get $l3
                    local.get $l2
                    i32.const -2
                    i32.and
                    i32.store offset=4
                    local.get $l1
                    local.get $p0
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    local.get $l1
                    local.get $p0
                    i32.add
                    local.get $p0
                    i32.store
                  end
                  local.get $p0
                  i32.const 256
                  i32.lt_u
                  br_if $B6
                  i32.const 31
                  local.set $l3
                  block $B11
                    local.get $p0
                    i32.const 16777215
                    i32.gt_u
                    br_if $B11
                    local.get $p0
                    i32.const 38
                    local.get $p0
                    i32.const 8
                    i32.shr_u
                    i32.clz
                    local.tee $l3
                    i32.sub
                    i32.shr_u
                    i32.const 1
                    i32.and
                    local.get $l3
                    i32.const 1
                    i32.shl
                    i32.sub
                    i32.const 62
                    i32.add
                    local.set $l3
                  end
                  local.get $l1
                  i64.const 0
                  i64.store offset=16 align=4
                  local.get $l1
                  local.get $l3
                  i32.store offset=28
                  local.get $l3
                  i32.const 2
                  i32.shl
                  i32.const 1051368
                  i32.add
                  local.set $l2
                  i32.const 0
                  i32.load offset=1051780
                  i32.const 1
                  local.get $l3
                  i32.shl
                  local.tee $l4
                  i32.and
                  br_if $B5
                  local.get $l2
                  local.get $l1
                  i32.store
                  local.get $l1
                  local.get $l2
                  i32.store offset=24
                  local.get $l1
                  local.get $l1
                  i32.store offset=12
                  local.get $l1
                  local.get $l1
                  i32.store offset=8
                  i32.const 0
                  i32.const 0
                  i32.load offset=1051780
                  local.get $l4
                  i32.or
                  i32.store offset=1051780
                  br $B4
                end
                i32.const 0
                local.get $l1
                i32.store offset=1051796
                i32.const 0
                i32.const 0
                i32.load offset=1051788
                local.get $p0
                i32.add
                local.tee $p0
                i32.store offset=1051788
                local.get $l1
                local.get $p0
                i32.const 1
                i32.or
                i32.store offset=4
                block $B12
                  local.get $l1
                  i32.const 0
                  i32.load offset=1051792
                  i32.ne
                  br_if $B12
                  i32.const 0
                  i32.const 0
                  i32.store offset=1051784
                  i32.const 0
                  i32.const 0
                  i32.store offset=1051792
                end
                local.get $p0
                i32.const 0
                i32.load offset=1051808
                local.tee $l4
                i32.le_u
                br_if $B0
                i32.const 0
                i32.load offset=1051796
                local.tee $p0
                i32.eqz
                br_if $B0
                i32.const 0
                local.set $l2
                i32.const 0
                i32.load offset=1051788
                local.tee $l5
                i32.const 41
                i32.lt_u
                br_if $B3
                i32.const 1051496
                local.set $l1
                loop $L13
                  block $B14
                    local.get $l1
                    i32.load
                    local.tee $l3
                    local.get $p0
                    i32.gt_u
                    br_if $B14
                    local.get $p0
                    local.get $l3
                    local.get $l1
                    i32.load offset=4
                    i32.add
                    i32.lt_u
                    br_if $B3
                  end
                  local.get $l1
                  i32.load offset=8
                  local.set $l1
                  br $L13
                end
              end
              i32.const 0
              local.get $l1
              i32.store offset=1051792
              i32.const 0
              i32.const 0
              i32.load offset=1051784
              local.get $p0
              i32.add
              local.tee $p0
              i32.store offset=1051784
              local.get $l1
              local.get $p0
              i32.const 1
              i32.or
              i32.store offset=4
              local.get $l1
              local.get $p0
              i32.add
              local.get $p0
              i32.store
              return
            end
            block $B15
              block $B16
                i32.const 0
                i32.load offset=1051776
                local.tee $l3
                i32.const 1
                local.get $p0
                i32.const 3
                i32.shr_u
                i32.shl
                local.tee $l2
                i32.and
                br_if $B16
                i32.const 0
                local.get $l3
                local.get $l2
                i32.or
                i32.store offset=1051776
                local.get $p0
                i32.const 248
                i32.and
                i32.const 1051512
                i32.add
                local.tee $p0
                local.set $l3
                br $B15
              end
              local.get $p0
              i32.const 248
              i32.and
              local.tee $p0
              i32.const 1051512
              i32.add
              local.set $l3
              local.get $p0
              i32.const 1051520
              i32.add
              i32.load
              local.set $p0
            end
            local.get $l3
            local.get $l1
            i32.store offset=8
            local.get $p0
            local.get $l1
            i32.store offset=12
            local.get $l1
            local.get $l3
            i32.store offset=12
            local.get $l1
            local.get $p0
            i32.store offset=8
            return
          end
          block $B17
            block $B18
              block $B19
                local.get $l2
                i32.load
                local.tee $l4
                i32.load offset=4
                i32.const -8
                i32.and
                local.get $p0
                i32.ne
                br_if $B19
                local.get $l4
                local.set $l3
                br $B18
              end
              local.get $p0
              i32.const 0
              i32.const 25
              local.get $l3
              i32.const 1
              i32.shr_u
              i32.sub
              local.get $l3
              i32.const 31
              i32.eq
              select
              i32.shl
              local.set $l2
              loop $L20
                local.get $l4
                local.get $l2
                i32.const 29
                i32.shr_u
                i32.const 4
                i32.and
                i32.add
                local.tee $l5
                i32.load offset=16
                local.tee $l3
                i32.eqz
                br_if $B17
                local.get $l2
                i32.const 1
                i32.shl
                local.set $l2
                local.get $l3
                local.set $l4
                local.get $l3
                i32.load offset=4
                i32.const -8
                i32.and
                local.get $p0
                i32.ne
                br_if $L20
              end
            end
            local.get $l3
            i32.load offset=8
            local.tee $p0
            local.get $l1
            i32.store offset=12
            local.get $l3
            local.get $l1
            i32.store offset=8
            local.get $l1
            i32.const 0
            i32.store offset=24
            local.get $l1
            local.get $l3
            i32.store offset=12
            local.get $l1
            local.get $p0
            i32.store offset=8
            br $B4
          end
          local.get $l5
          i32.const 16
          i32.add
          local.get $l1
          i32.store
          local.get $l1
          local.get $l4
          i32.store offset=24
          local.get $l1
          local.get $l1
          i32.store offset=12
          local.get $l1
          local.get $l1
          i32.store offset=8
        end
        i32.const 0
        local.set $l1
        i32.const 0
        i32.const 0
        i32.load offset=1051816
        i32.const -1
        i32.add
        local.tee $p0
        i32.store offset=1051816
        local.get $p0
        br_if $B0
        block $B21
          i32.const 0
          i32.load offset=1051504
          local.tee $p0
          i32.eqz
          br_if $B21
          i32.const 0
          local.set $l1
          loop $L22
            local.get $l1
            i32.const 1
            i32.add
            local.set $l1
            local.get $p0
            i32.load offset=8
            local.tee $p0
            br_if $L22
          end
        end
        i32.const 0
        local.get $l1
        i32.const 4095
        local.get $l1
        i32.const 4095
        i32.gt_u
        select
        i32.store offset=1051816
        return
      end
      block $B23
        i32.const 0
        i32.load offset=1051504
        local.tee $l1
        i32.eqz
        br_if $B23
        i32.const 0
        local.set $l2
        loop $L24
          local.get $l2
          i32.const 1
          i32.add
          local.set $l2
          local.get $l1
          i32.load offset=8
          local.tee $l1
          br_if $L24
        end
      end
      i32.const 0
      local.get $l2
      i32.const 4095
      local.get $l2
      i32.const 4095
      i32.gt_u
      select
      i32.store offset=1051816
      local.get $l5
      local.get $l4
      i32.le_u
      br_if $B0
      i32.const 0
      i32.const -1
      i32.store offset=1051808
    end)
  (func $f9 (type $t5)
    (local $l0 i32)
    global.get $g0
    i32.const 32
    i32.sub
    local.tee $l0
    global.set $g0
    local.get $l0
    i32.const 0
    i32.store offset=24
    local.get $l0
    i32.const 1
    i32.store offset=12
    local.get $l0
    i32.const 1050748
    i32.store offset=8
    local.get $l0
    i64.const 4
    i64.store offset=16 align=4
    local.get $l0
    i32.const 8
    i32.add
    i32.const 1050756
    call $f7
    unreachable)
  (func $f10 (type $t3) (param $p0 i32) (param $p1 i32)
    (local $l2 i32)
    global.get $g0
    i32.const 16
    i32.sub
    local.tee $l2
    global.set $g0
    local.get $l2
    i32.const 1049314
    i32.store offset=12
    local.get $l2
    local.get $p0
    i32.store offset=8
    local.get $l2
    i32.const 8
    i32.add
    local.get $l2
    i32.const 12
    i32.add
    local.get $p1
    call $f23
    unreachable)
  (func $f11 (type $t5)
    (local $l0 i32)
    global.get $g0
    i32.const 48
    i32.sub
    local.tee $l0
    global.set $g0
    local.get $l0
    i32.const 38
    i32.store offset=12
    local.get $l0
    i32.const 1050620
    i32.store offset=8
    local.get $l0
    i32.const 1
    i32.store offset=20
    local.get $l0
    i32.const 1049508
    i32.store offset=16
    local.get $l0
    i64.const 1
    i64.store offset=28 align=4
    local.get $l0
    i32.const 3
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get $l0
    i32.const 8
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=40
    local.get $l0
    local.get $l0
    i32.const 40
    i32.add
    i32.store offset=24
    local.get $l0
    i32.const 16
    i32.add
    i32.const 1050660
    call $f7
    unreachable)
  (func $f12 (type $t3) (param $p0 i32) (param $p1 i32)
    (local $l2 i32)
    global.get $g0
    i32.const 32
    i32.sub
    local.tee $l2
    global.set $g0
    local.get $l2
    i32.const 0
    i32.store offset=16
    local.get $l2
    i32.const 1
    i32.store offset=4
    local.get $l2
    i64.const 4
    i64.store offset=8 align=4
    local.get $l2
    i32.const 46
    i32.store offset=28
    local.get $l2
    local.get $p0
    i32.store offset=24
    local.get $l2
    local.get $l2
    i32.const 24
    i32.add
    i32.store
    local.get $l2
    local.get $p1
    call $f7
    unreachable)
  (func $f13 (type $t0) (param $p0 i32) (param $p1 i32) (result i32)
    (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32)
    global.get $g0
    i32.const 64
    i32.sub
    local.tee $l2
    global.set $g0
    block $B0
      block $B1
        block $B2
          block $B3
            block $B4
              block $B5
                block $B6
                  block $B7
                    local.get $p0
                    i32.load8_u
                    br_table $B7 $B6 $B5 $B4 $B7
                  end
                  local.get $l2
                  local.get $p0
                  i32.load offset=4
                  i32.store offset=8
                  i32.const 20
                  call $f32
                  local.tee $p0
                  i32.eqz
                  br_if $B2
                  local.get $p0
                  i32.const 16
                  i32.add
                  i32.const 0
                  i32.load offset=1050496 align=1
                  i32.store align=1
                  local.get $p0
                  i32.const 8
                  i32.add
                  i32.const 0
                  i64.load offset=1050488 align=1
                  i64.store align=1
                  local.get $p0
                  i32.const 0
                  i64.load offset=1050480 align=1
                  i64.store align=1
                  local.get $l2
                  i32.const 20
                  i32.store offset=20
                  local.get $l2
                  local.get $p0
                  i32.store offset=16
                  local.get $l2
                  i32.const 20
                  i32.store offset=12
                  local.get $l2
                  i32.const 3
                  i32.store offset=44
                  local.get $l2
                  i32.const 1050800
                  i32.store offset=40
                  local.get $l2
                  i64.const 2
                  i64.store offset=52 align=4
                  local.get $l2
                  i32.const 4
                  i64.extend_i32_u
                  i64.const 32
                  i64.shl
                  local.get $l2
                  i32.const 8
                  i32.add
                  i64.extend_i32_u
                  i64.or
                  i64.store offset=32
                  local.get $l2
                  i32.const 5
                  i64.extend_i32_u
                  i64.const 32
                  i64.shl
                  local.get $l2
                  i32.const 12
                  i32.add
                  i64.extend_i32_u
                  i64.or
                  i64.store offset=24
                  local.get $l2
                  local.get $l2
                  i32.const 24
                  i32.add
                  i32.store offset=48
                  local.get $p1
                  i32.load
                  local.get $p1
                  i32.load offset=4
                  local.get $l2
                  i32.const 40
                  i32.add
                  call $f6
                  local.set $p0
                  local.get $l2
                  i32.load offset=12
                  local.tee $p1
                  i32.eqz
                  br_if $B3
                  local.get $l2
                  i32.load offset=16
                  local.tee $l3
                  i32.const -4
                  i32.add
                  i32.load
                  local.tee $l4
                  i32.const -8
                  i32.and
                  local.tee $l5
                  i32.const 4
                  i32.const 8
                  local.get $l4
                  i32.const 3
                  i32.and
                  local.tee $l4
                  select
                  local.get $p1
                  i32.add
                  i32.lt_u
                  br_if $B1
                  block $B8
                    local.get $l4
                    i32.eqz
                    br_if $B8
                    local.get $l5
                    local.get $p1
                    i32.const 39
                    i32.add
                    i32.gt_u
                    br_if $B0
                  end
                  local.get $l3
                  call $f8
                  br $B3
                end
                local.get $l2
                local.get $p0
                i32.load8_u offset=1
                i32.const 2
                i32.shl
                local.tee $p0
                i32.load offset=1050984
                i32.store offset=16
                local.get $l2
                local.get $p0
                i32.load offset=1051152
                i32.store offset=12
                local.get $l2
                i32.const 1
                i32.store offset=44
                local.get $l2
                i32.const 1049508
                i32.store offset=40
                local.get $l2
                i64.const 1
                i64.store offset=52 align=4
                local.get $l2
                i32.const 3
                i64.extend_i32_u
                i64.const 32
                i64.shl
                local.get $l2
                i32.const 12
                i32.add
                i64.extend_i32_u
                i64.or
                i64.store offset=24
                local.get $l2
                local.get $l2
                i32.const 24
                i32.add
                i32.store offset=48
                local.get $p1
                i32.load
                local.get $p1
                i32.load offset=4
                local.get $l2
                i32.const 40
                i32.add
                call $f6
                local.set $p0
                br $B3
              end
              local.get $p1
              local.get $p0
              i32.load offset=4
              local.tee $p0
              i32.load
              local.get $p0
              i32.load offset=4
              call $f22
              local.set $p0
              br $B3
            end
            local.get $p0
            i32.load offset=4
            local.tee $p0
            i32.load
            local.get $p1
            local.get $p0
            i32.load offset=4
            i32.load offset=16
            call_indirect $T0 (type $t0)
            local.set $p0
          end
          local.get $l2
          i32.const 64
          i32.add
          global.set $g0
          local.get $p0
          return
        end
        unreachable
      end
      i32.const 1050840
      i32.const 1050888
      call $f12
      unreachable
    end
    i32.const 1050904
    i32.const 1050952
    call $f12
    unreachable)
  (func $f14 (type $t0) (param $p0 i32) (param $p1 i32) (result i32)
    local.get $p1
    local.get $p0
    i32.load
    local.get $p0
    i32.load offset=4
    call $f22)
  (func $f15 (type $t6) (param $p0 i32) (param $p1 i32) (param $p2 i32) (param $p3 i32) (param $p4 i32) (result i32)
    block $B0
      local.get $p2
      i32.const 1114112
      i32.eq
      br_if $B0
      local.get $p0
      local.get $p2
      local.get $p1
      i32.load offset=16
      call_indirect $T0 (type $t0)
      i32.eqz
      br_if $B0
      i32.const 1
      return
    end
    block $B1
      local.get $p3
      br_if $B1
      i32.const 0
      return
    end
    local.get $p0
    local.get $p3
    local.get $p4
    local.get $p1
    i32.load offset=12
    call_indirect $T0 (type $t1))
  (func $f16 (type $t7) (param $p0 i32) (param $p1 i32) (param $p2 i32) (param $p3 i32)
    block $B0
      block $B1
        local.get $p0
        local.get $p2
        i32.gt_u
        br_if $B1
        local.get $p1
        local.get $p2
        i32.gt_u
        br_if $B0
        local.get $p0
        local.get $p1
        i32.le_u
        br_if $B0
        local.get $p0
        local.get $p1
        local.get $p3
        call $f17
        unreachable
      end
      local.get $p0
      local.get $p2
      local.get $p3
      call $f18
      unreachable
    end
    local.get $p1
    local.get $p2
    local.get $p3
    call $f19
    unreachable)
  (func $f17 (type $t8) (param $p0 i32) (param $p1 i32) (param $p2 i32)
    (local $l3 i32) (local $l4 i64)
    global.get $g0
    i32.const 48
    i32.sub
    local.tee $l3
    global.set $g0
    local.get $l3
    local.get $p1
    i32.store offset=4
    local.get $l3
    local.get $p0
    i32.store
    local.get $l3
    i32.const 2
    i32.store offset=12
    local.get $l3
    i32.const 1048944
    i32.store offset=8
    local.get $l3
    i64.const 2
    i64.store offset=20 align=4
    local.get $l3
    i32.const 6
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.tee $l4
    local.get $l3
    i32.const 4
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=40
    local.get $l3
    local.get $l4
    local.get $l3
    i64.extend_i32_u
    i64.or
    i64.store offset=32
    local.get $l3
    local.get $l3
    i32.const 32
    i32.add
    i32.store offset=16
    local.get $l3
    i32.const 8
    i32.add
    local.get $p2
    call $f7
    unreachable)
  (func $f18 (type $t8) (param $p0 i32) (param $p1 i32) (param $p2 i32)
    (local $l3 i32) (local $l4 i64)
    global.get $g0
    i32.const 48
    i32.sub
    local.tee $l3
    global.set $g0
    local.get $l3
    local.get $p1
    i32.store offset=4
    local.get $l3
    local.get $p0
    i32.store
    local.get $l3
    i32.const 2
    i32.store offset=12
    local.get $l3
    i32.const 1048980
    i32.store offset=8
    local.get $l3
    i64.const 2
    i64.store offset=20 align=4
    local.get $l3
    i32.const 6
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.tee $l4
    local.get $l3
    i32.const 4
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=40
    local.get $l3
    local.get $l4
    local.get $l3
    i64.extend_i32_u
    i64.or
    i64.store offset=32
    local.get $l3
    local.get $l3
    i32.const 32
    i32.add
    i32.store offset=16
    local.get $l3
    i32.const 8
    i32.add
    local.get $p2
    call $f7
    unreachable)
  (func $f19 (type $t8) (param $p0 i32) (param $p1 i32) (param $p2 i32)
    (local $l3 i32) (local $l4 i64)
    global.get $g0
    i32.const 48
    i32.sub
    local.tee $l3
    global.set $g0
    local.get $l3
    local.get $p1
    i32.store offset=4
    local.get $l3
    local.get $p0
    i32.store
    local.get $l3
    i32.const 2
    i32.store offset=12
    local.get $l3
    i32.const 1048892
    i32.store offset=8
    local.get $l3
    i64.const 2
    i64.store offset=20 align=4
    local.get $l3
    i32.const 6
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.tee $l4
    local.get $l3
    i32.const 4
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=40
    local.get $l3
    local.get $l4
    local.get $l3
    i64.extend_i32_u
    i64.or
    i64.store offset=32
    local.get $l3
    local.get $l3
    i32.const 32
    i32.add
    i32.store offset=16
    local.get $l3
    i32.const 8
    i32.add
    local.get $p2
    call $f7
    unreachable)
  (func $f20 (type $t0) (param $p0 i32) (param $p1 i32) (result i32)
    (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32) (local $l6 i32) (local $l7 i32) (local $l8 i32)
    global.get $g0
    i32.const 16
    i32.sub
    local.tee $l2
    global.set $g0
    i32.const 10
    local.set $l3
    local.get $p0
    i32.load
    local.tee $l4
    local.set $l5
    block $B0
      local.get $l4
      i32.const 1000
      i32.lt_u
      br_if $B0
      i32.const 10
      local.set $l3
      local.get $l4
      local.set $p0
      loop $L1
        local.get $l2
        i32.const 6
        i32.add
        local.get $l3
        i32.add
        local.tee $l6
        i32.const -4
        i32.add
        local.get $p0
        local.get $p0
        i32.const 10000
        i32.div_u
        local.tee $l5
        i32.const 10000
        i32.mul
        i32.sub
        local.tee $l7
        i32.const 65535
        i32.and
        i32.const 100
        i32.div_u
        local.tee $l8
        i32.const 1
        i32.shl
        i32.load16_u offset=1048607 align=1
        i32.store16 align=1
        local.get $l6
        i32.const -2
        i32.add
        local.get $l7
        local.get $l8
        i32.const 100
        i32.mul
        i32.sub
        i32.const 65535
        i32.and
        i32.const 1
        i32.shl
        i32.load16_u offset=1048607 align=1
        i32.store16 align=1
        local.get $l3
        i32.const -4
        i32.add
        local.set $l3
        local.get $p0
        i32.const 9999999
        i32.gt_u
        local.set $l6
        local.get $l5
        local.set $p0
        local.get $l6
        br_if $L1
      end
    end
    block $B2
      block $B3
        local.get $l5
        i32.const 9
        i32.gt_u
        br_if $B3
        local.get $l5
        local.set $p0
        br $B2
      end
      local.get $l2
      i32.const 6
      i32.add
      local.get $l3
      i32.const -2
      i32.add
      local.tee $l3
      i32.add
      local.get $l5
      local.get $l5
      i32.const 65535
      i32.and
      i32.const 100
      i32.div_u
      local.tee $p0
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
    block $B4
      block $B5
        local.get $l4
        i32.eqz
        br_if $B5
        local.get $p0
        i32.eqz
        br_if $B4
      end
      local.get $l2
      i32.const 6
      i32.add
      local.get $l3
      i32.const -1
      i32.add
      local.tee $l3
      i32.add
      local.get $p0
      i32.const 1
      i32.shl
      i32.load8_u offset=1048608
      i32.store8
    end
    local.get $p1
    i32.const 1
    i32.const 1
    i32.const 0
    local.get $l2
    i32.const 6
    i32.add
    local.get $l3
    i32.add
    i32.const 10
    local.get $l3
    i32.sub
    call $f2
    local.set $p0
    local.get $l2
    i32.const 16
    i32.add
    global.set $g0
    local.get $p0)
  (func $f21 (type $t2) (param $p0 i32)
    (local $l1 i32) (local $l2 i64)
    global.get $g0
    i32.const 16
    i32.sub
    local.tee $l1
    global.set $g0
    local.get $p0
    i64.load align=4
    local.set $l2
    local.get $l1
    local.get $p0
    i32.store offset=12
    local.get $l1
    local.get $l2
    i64.store offset=4 align=4
    local.get $l1
    i32.const 4
    i32.add
    call $f35
    unreachable)
  (func $f22 (type $t1) (param $p0 i32) (param $p1 i32) (param $p2 i32) (result i32)
    (local $l3 i32) (local $l4 i32) (local $l5 i32) (local $l6 i32) (local $l7 i32) (local $l8 i32) (local $l9 i32) (local $l10 i32) (local $l11 i32) (local $l12 i32) (local $l13 i32)
    block $B0
      block $B1
        local.get $p0
        i32.load offset=8
        local.tee $l3
        i32.const 402653184
        i32.and
        i32.eqz
        br_if $B1
        block $B2
          block $B3
            block $B4
              block $B5
                block $B6
                  local.get $l3
                  i32.const 268435456
                  i32.and
                  i32.eqz
                  br_if $B6
                  local.get $p0
                  i32.load16_u offset=14
                  local.tee $l4
                  br_if $B5
                  i32.const 0
                  local.set $p2
                  br $B4
                end
                block $B7
                  local.get $p2
                  i32.const 16
                  i32.lt_u
                  br_if $B7
                  local.get $p2
                  local.get $p1
                  local.get $p1
                  i32.const 3
                  i32.add
                  i32.const -4
                  i32.and
                  local.tee $l5
                  i32.sub
                  local.tee $l6
                  i32.add
                  local.tee $l7
                  i32.const 3
                  i32.and
                  local.set $l8
                  i32.const 0
                  local.set $l9
                  i32.const 0
                  local.set $l10
                  block $B8
                    local.get $p1
                    local.get $l5
                    i32.eq
                    br_if $B8
                    i32.const 0
                    local.set $l4
                    i32.const 0
                    local.set $l10
                    block $B9
                      local.get $l6
                      i32.const -4
                      i32.gt_u
                      br_if $B9
                      i32.const 0
                      local.set $l4
                      i32.const 0
                      local.set $l10
                      loop $L10
                        local.get $l10
                        local.get $p1
                        local.get $l4
                        i32.add
                        local.tee $l11
                        i32.load8_s
                        i32.const -65
                        i32.gt_s
                        i32.add
                        local.get $l11
                        i32.const 1
                        i32.add
                        i32.load8_s
                        i32.const -65
                        i32.gt_s
                        i32.add
                        local.get $l11
                        i32.const 2
                        i32.add
                        i32.load8_s
                        i32.const -65
                        i32.gt_s
                        i32.add
                        local.get $l11
                        i32.const 3
                        i32.add
                        i32.load8_s
                        i32.const -65
                        i32.gt_s
                        i32.add
                        local.set $l10
                        local.get $l4
                        i32.const 4
                        i32.add
                        local.tee $l4
                        br_if $L10
                      end
                    end
                    local.get $p1
                    local.get $l4
                    i32.add
                    local.set $l11
                    loop $L11
                      local.get $l10
                      local.get $l11
                      i32.load8_s
                      i32.const -65
                      i32.gt_s
                      i32.add
                      local.set $l10
                      local.get $l11
                      i32.const 1
                      i32.add
                      local.set $l11
                      local.get $l6
                      i32.const 1
                      i32.add
                      local.tee $l6
                      br_if $L11
                    end
                  end
                  block $B12
                    local.get $l8
                    i32.eqz
                    br_if $B12
                    local.get $l5
                    local.get $l7
                    i32.const -4
                    i32.and
                    i32.add
                    local.tee $l11
                    i32.load8_s
                    i32.const -65
                    i32.gt_s
                    local.set $l9
                    local.get $l8
                    i32.const 1
                    i32.eq
                    br_if $B12
                    local.get $l9
                    local.get $l11
                    i32.load8_s offset=1
                    i32.const -65
                    i32.gt_s
                    i32.add
                    local.set $l9
                    local.get $l8
                    i32.const 2
                    i32.eq
                    br_if $B12
                    local.get $l9
                    local.get $l11
                    i32.load8_s offset=2
                    i32.const -65
                    i32.gt_s
                    i32.add
                    local.set $l9
                  end
                  local.get $l7
                  i32.const 2
                  i32.shr_u
                  local.set $l8
                  local.get $l9
                  local.get $l10
                  i32.add
                  local.set $l4
                  loop $L13
                    local.get $l5
                    local.set $l7
                    local.get $l8
                    i32.eqz
                    br_if $B2
                    local.get $l8
                    i32.const 192
                    local.get $l8
                    i32.const 192
                    i32.lt_u
                    select
                    local.tee $l9
                    i32.const 3
                    i32.and
                    local.set $l12
                    i32.const 0
                    local.set $l11
                    block $B14
                      local.get $l9
                      i32.const 2
                      i32.shl
                      local.tee $l13
                      i32.const 1008
                      i32.and
                      local.tee $l5
                      i32.eqz
                      br_if $B14
                      local.get $l7
                      local.set $l10
                      loop $L15
                        local.get $l10
                        i32.const 12
                        i32.add
                        i32.load
                        local.tee $l6
                        i32.const -1
                        i32.xor
                        i32.const 7
                        i32.shr_u
                        local.get $l6
                        i32.const 6
                        i32.shr_u
                        i32.or
                        i32.const 16843009
                        i32.and
                        local.get $l10
                        i32.const 8
                        i32.add
                        i32.load
                        local.tee $l6
                        i32.const -1
                        i32.xor
                        i32.const 7
                        i32.shr_u
                        local.get $l6
                        i32.const 6
                        i32.shr_u
                        i32.or
                        i32.const 16843009
                        i32.and
                        local.get $l10
                        i32.const 4
                        i32.add
                        i32.load
                        local.tee $l6
                        i32.const -1
                        i32.xor
                        i32.const 7
                        i32.shr_u
                        local.get $l6
                        i32.const 6
                        i32.shr_u
                        i32.or
                        i32.const 16843009
                        i32.and
                        local.get $l10
                        i32.load
                        local.tee $l6
                        i32.const -1
                        i32.xor
                        i32.const 7
                        i32.shr_u
                        local.get $l6
                        i32.const 6
                        i32.shr_u
                        i32.or
                        i32.const 16843009
                        i32.and
                        local.get $l11
                        i32.add
                        i32.add
                        i32.add
                        i32.add
                        local.set $l11
                        local.get $l10
                        i32.const 16
                        i32.add
                        local.set $l10
                        local.get $l5
                        i32.const -16
                        i32.add
                        local.tee $l5
                        br_if $L15
                      end
                    end
                    local.get $l8
                    local.get $l9
                    i32.sub
                    local.set $l8
                    local.get $l7
                    local.get $l13
                    i32.add
                    local.set $l5
                    local.get $l11
                    i32.const 8
                    i32.shr_u
                    i32.const 16711935
                    i32.and
                    local.get $l11
                    i32.const 16711935
                    i32.and
                    i32.add
                    i32.const 65537
                    i32.mul
                    i32.const 16
                    i32.shr_u
                    local.get $l4
                    i32.add
                    local.set $l4
                    local.get $l12
                    i32.eqz
                    br_if $L13
                  end
                  local.get $l7
                  local.get $l9
                  i32.const 252
                  i32.and
                  i32.const 2
                  i32.shl
                  i32.add
                  local.tee $l11
                  i32.load
                  local.tee $l10
                  i32.const -1
                  i32.xor
                  i32.const 7
                  i32.shr_u
                  local.get $l10
                  i32.const 6
                  i32.shr_u
                  i32.or
                  i32.const 16843009
                  i32.and
                  local.set $l10
                  block $B16
                    local.get $l12
                    i32.const 1
                    i32.eq
                    br_if $B16
                    local.get $l11
                    i32.load offset=4
                    local.tee $l5
                    i32.const -1
                    i32.xor
                    i32.const 7
                    i32.shr_u
                    local.get $l5
                    i32.const 6
                    i32.shr_u
                    i32.or
                    i32.const 16843009
                    i32.and
                    local.get $l10
                    i32.add
                    local.set $l10
                    local.get $l12
                    i32.const 2
                    i32.eq
                    br_if $B16
                    local.get $l11
                    i32.load offset=8
                    local.tee $l11
                    i32.const -1
                    i32.xor
                    i32.const 7
                    i32.shr_u
                    local.get $l11
                    i32.const 6
                    i32.shr_u
                    i32.or
                    i32.const 16843009
                    i32.and
                    local.get $l10
                    i32.add
                    local.set $l10
                  end
                  local.get $l10
                  i32.const 8
                  i32.shr_u
                  i32.const 459007
                  i32.and
                  local.get $l10
                  i32.const 16711935
                  i32.and
                  i32.add
                  i32.const 65537
                  i32.mul
                  i32.const 16
                  i32.shr_u
                  local.get $l4
                  i32.add
                  local.set $l4
                  br $B2
                end
                block $B17
                  local.get $p2
                  br_if $B17
                  i32.const 0
                  local.set $l4
                  i32.const 0
                  local.set $p2
                  br $B2
                end
                local.get $p2
                i32.const 3
                i32.and
                local.set $l5
                block $B18
                  block $B19
                    local.get $p2
                    i32.const 4
                    i32.ge_u
                    br_if $B19
                    i32.const 0
                    local.set $l11
                    i32.const 0
                    local.set $l4
                    br $B18
                  end
                  local.get $p2
                  i32.const 12
                  i32.and
                  local.set $l6
                  i32.const 0
                  local.set $l11
                  i32.const 0
                  local.set $l4
                  loop $L20
                    local.get $l4
                    local.get $p1
                    local.get $l11
                    i32.add
                    local.tee $l10
                    i32.load8_s
                    i32.const -65
                    i32.gt_s
                    i32.add
                    local.get $l10
                    i32.const 1
                    i32.add
                    i32.load8_s
                    i32.const -65
                    i32.gt_s
                    i32.add
                    local.get $l10
                    i32.const 2
                    i32.add
                    i32.load8_s
                    i32.const -65
                    i32.gt_s
                    i32.add
                    local.get $l10
                    i32.const 3
                    i32.add
                    i32.load8_s
                    i32.const -65
                    i32.gt_s
                    i32.add
                    local.set $l4
                    local.get $l6
                    local.get $l11
                    i32.const 4
                    i32.add
                    local.tee $l11
                    i32.ne
                    br_if $L20
                  end
                end
                local.get $l5
                i32.eqz
                br_if $B2
                local.get $p1
                local.get $l11
                i32.add
                local.set $l10
                loop $L21
                  local.get $l4
                  local.get $l10
                  i32.load8_s
                  i32.const -65
                  i32.gt_s
                  i32.add
                  local.set $l4
                  local.get $l10
                  i32.const 1
                  i32.add
                  local.set $l10
                  local.get $l5
                  i32.const -1
                  i32.add
                  local.tee $l5
                  br_if $L21
                  br $B2
                end
              end
              local.get $p1
              local.get $p2
              i32.add
              local.set $l6
              i32.const 0
              local.set $p2
              local.get $p1
              local.set $l11
              local.get $l4
              local.set $l5
              loop $L22
                local.get $l11
                local.tee $l10
                local.get $l6
                i32.eq
                br_if $B3
                block $B23
                  block $B24
                    local.get $l10
                    i32.load8_s
                    local.tee $l11
                    i32.const -1
                    i32.le_s
                    br_if $B24
                    local.get $l10
                    i32.const 1
                    i32.add
                    local.set $l11
                    br $B23
                  end
                  block $B25
                    local.get $l11
                    i32.const -32
                    i32.ge_u
                    br_if $B25
                    local.get $l10
                    i32.const 2
                    i32.add
                    local.set $l11
                    br $B23
                  end
                  block $B26
                    local.get $l11
                    i32.const -16
                    i32.ge_u
                    br_if $B26
                    local.get $l10
                    i32.const 3
                    i32.add
                    local.set $l11
                    br $B23
                  end
                  local.get $l10
                  i32.const 4
                  i32.add
                  local.set $l11
                end
                local.get $l11
                local.get $l10
                i32.sub
                local.get $p2
                i32.add
                local.set $p2
                local.get $l5
                i32.const -1
                i32.add
                local.tee $l5
                br_if $L22
              end
            end
            i32.const 0
            local.set $l5
          end
          local.get $l4
          local.get $l5
          i32.sub
          local.set $l4
        end
        local.get $l4
        local.get $p0
        i32.load16_u offset=12
        local.tee $l10
        i32.ge_u
        br_if $B1
        local.get $l10
        local.get $l4
        i32.sub
        local.set $l9
        i32.const 0
        local.set $l10
        i32.const 0
        local.set $l8
        block $B27
          block $B28
            block $B29
              local.get $l3
              i32.const 29
              i32.shr_u
              i32.const 3
              i32.and
              br_table $B27 $B29 $B28 $B27 $B27
            end
            local.get $l9
            local.set $l8
            br $B27
          end
          local.get $l9
          i32.const 65534
          i32.and
          i32.const 1
          i32.shr_u
          local.set $l8
        end
        local.get $l3
        i32.const 2097151
        i32.and
        local.set $l4
        local.get $p0
        i32.load offset=4
        local.set $l5
        local.get $p0
        i32.load
        local.set $l6
        block $B30
          loop $L31
            local.get $l10
            i32.const 65535
            i32.and
            local.get $l8
            i32.const 65535
            i32.and
            i32.ge_u
            br_if $B30
            i32.const 1
            local.set $l11
            local.get $l10
            i32.const 1
            i32.add
            local.set $l10
            local.get $l6
            local.get $l4
            local.get $l5
            i32.load offset=16
            call_indirect $T0 (type $t0)
            br_if $B0
            br $L31
          end
        end
        i32.const 1
        local.set $l11
        local.get $l6
        local.get $p1
        local.get $p2
        local.get $l5
        i32.load offset=12
        call_indirect $T0 (type $t1)
        br_if $B0
        local.get $l9
        local.get $l8
        i32.sub
        i32.const 65535
        i32.and
        local.set $l8
        i32.const 0
        local.set $l10
        loop $L32
          block $B33
            local.get $l10
            i32.const 65535
            i32.and
            local.get $l8
            i32.lt_u
            br_if $B33
            i32.const 0
            return
          end
          i32.const 1
          local.set $l11
          local.get $l10
          i32.const 1
          i32.add
          local.set $l10
          local.get $l6
          local.get $l4
          local.get $l5
          i32.load offset=16
          call_indirect $T0 (type $t0)
          br_if $B0
          br $L32
        end
      end
      local.get $p0
      i32.load
      local.get $p1
      local.get $p2
      local.get $p0
      i32.load offset=4
      i32.load offset=12
      call_indirect $T0 (type $t1)
      local.set $l11
    end
    local.get $l11)
  (func $f23 (type $t8) (param $p0 i32) (param $p1 i32) (param $p2 i32)
    (local $l3 i32) (local $l4 i64)
    global.get $g0
    i32.const 112
    i32.sub
    local.tee $l3
    global.set $g0
    local.get $l3
    i32.const 1050772
    i32.store offset=12
    local.get $l3
    local.get $p0
    i32.store offset=8
    local.get $l3
    i32.const 1050772
    i32.store offset=20
    local.get $l3
    local.get $p1
    i32.store offset=16
    local.get $l3
    i32.const 2
    i32.store offset=28
    local.get $l3
    i32.const 1049348
    i32.store offset=24
    block $B0
      local.get $p2
      i32.load
      i32.eqz
      br_if $B0
      local.get $l3
      i32.const 32
      i32.add
      i32.const 16
      i32.add
      local.get $p2
      i32.const 16
      i32.add
      i64.load align=4
      i64.store
      local.get $l3
      i32.const 32
      i32.add
      i32.const 8
      i32.add
      local.get $p2
      i32.const 8
      i32.add
      i64.load align=4
      i64.store
      local.get $l3
      local.get $p2
      i64.load align=4
      i64.store offset=32
      local.get $l3
      i32.const 4
      i32.store offset=92
      local.get $l3
      i32.const 1049452
      i32.store offset=88
      local.get $l3
      i64.const 4
      i64.store offset=100 align=4
      local.get $l3
      i32.const 7
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.tee $l4
      local.get $l3
      i32.const 16
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=80
      local.get $l3
      local.get $l4
      local.get $l3
      i32.const 8
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=72
      local.get $l3
      i32.const 8
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.get $l3
      i32.const 32
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=64
      local.get $l3
      i32.const 3
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.get $l3
      i32.const 24
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=56
      local.get $l3
      local.get $l3
      i32.const 56
      i32.add
      i32.store offset=96
      local.get $l3
      i32.const 88
      i32.add
      i32.const 1050604
      call $f7
      unreachable
    end
    local.get $l3
    i32.const 3
    i32.store offset=92
    local.get $l3
    i32.const 1049400
    i32.store offset=88
    local.get $l3
    i64.const 3
    i64.store offset=100 align=4
    local.get $l3
    i32.const 7
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.tee $l4
    local.get $l3
    i32.const 16
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=72
    local.get $l3
    local.get $l4
    local.get $l3
    i32.const 8
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=64
    local.get $l3
    i32.const 3
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get $l3
    i32.const 24
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=56
    local.get $l3
    local.get $l3
    i32.const 56
    i32.add
    i32.store offset=96
    local.get $l3
    i32.const 88
    i32.add
    i32.const 1050604
    call $f7
    unreachable)
  (func $f24 (type $t0) (param $p0 i32) (param $p1 i32) (result i32)
    local.get $p0
    i32.load
    local.get $p1
    local.get $p0
    i32.load offset=4
    i32.load offset=12
    call_indirect $T0 (type $t0))
  (func $f25 (type $t0) (param $p0 i32) (param $p1 i32) (result i32)
    local.get $p1
    i32.load
    local.get $p1
    i32.load offset=4
    local.get $p0
    call $f6)
  (func $f26 (type $t5)
    call $f27
    unreachable)
  (func $f27 (type $t5)
    (local $l0 i32)
    global.get $g0
    i32.const 48
    i32.sub
    local.tee $l0
    global.set $g0
    local.get $l0
    i32.const 1
    i32.store offset=12
    local.get $l0
    i32.const 1049508
    i32.store offset=8
    local.get $l0
    i64.const 1
    i64.store offset=20 align=4
    local.get $l0
    i32.const 9
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get $l0
    i32.const 47
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=32
    local.get $l0
    local.get $l0
    i32.const 32
    i32.add
    i32.store offset=16
    local.get $l0
    i32.const 8
    i32.add
    i32.const 1050824
    call $f7
    unreachable)
  (func $f28 (type $t0) (param $p0 i32) (param $p1 i32) (result i32)
    local.get $p1
    i32.const 1049484
    i32.const 24
    call $f22)
  (func $f29 (type $t3) (param $p0 i32) (param $p1 i32)
    local.get $p0
    i32.const 0
    i32.store)
  (func $f30 (type $t7) (param $p0 i32) (param $p1 i32) (param $p2 i32) (param $p3 i32)
    (local $l4 i32) (local $l5 i32)
    global.get $g0
    i32.const 16
    i32.sub
    local.tee $l4
    global.set $g0
    i32.const 0
    i32.const 0
    i32.load offset=1051848
    local.tee $l5
    i32.const 1
    i32.add
    i32.store offset=1051848
    block $B0
      local.get $l5
      i32.const 0
      i32.lt_s
      br_if $B0
      block $B1
        i32.const 0
        i32.load8_u offset=1051844
        br_if $B1
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
        br_if $B0
        i32.const 0
        i32.const 0
        i32.store8 offset=1051844
        local.get $p2
        i32.eqz
        br_if $B0
        call $f31
        unreachable
      end
      local.get $l4
      i32.const 8
      i32.add
      local.get $p0
      local.get $p1
      call_indirect $T0 (type $t3)
    end
    unreachable)
  (func $f31 (type $t5)
    unreachable)
  (func $f32 (type $t9) (param $p0 i32) (result i32)
    (local $l1 i32) (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32) (local $l6 i32) (local $l7 i32) (local $l8 i32) (local $l9 i64)
    block $B0
      block $B1
        block $B2
          local.get $p0
          i32.const 244
          i32.gt_u
          br_if $B2
          block $B3
            block $B4
              block $B5
                block $B6
                  i32.const 0
                  i32.load offset=1051776
                  local.tee $l1
                  i32.const 16
                  local.get $p0
                  i32.const 11
                  i32.add
                  i32.const 504
                  i32.and
                  local.get $p0
                  i32.const 11
                  i32.lt_u
                  select
                  local.tee $l2
                  i32.const 3
                  i32.shr_u
                  local.tee $l3
                  i32.shr_u
                  local.tee $p0
                  i32.const 3
                  i32.and
                  br_if $B6
                  local.get $l2
                  i32.const 0
                  i32.load offset=1051784
                  i32.le_u
                  br_if $B1
                  local.get $p0
                  br_if $B5
                  i32.const 0
                  i32.load offset=1051780
                  local.tee $p0
                  i32.eqz
                  br_if $B1
                  local.get $p0
                  i32.ctz
                  i32.const 2
                  i32.shl
                  i32.const 1051368
                  i32.add
                  i32.load
                  local.tee $l1
                  i32.load offset=4
                  i32.const -8
                  i32.and
                  local.get $l2
                  i32.sub
                  local.set $l3
                  local.get $l1
                  local.set $l4
                  loop $L7
                    block $B8
                      local.get $l4
                      i32.load offset=16
                      local.tee $p0
                      br_if $B8
                      local.get $l4
                      i32.load offset=20
                      local.tee $p0
                      br_if $B8
                      local.get $l1
                      i32.load offset=24
                      local.set $l5
                      block $B9
                        block $B10
                          block $B11
                            local.get $l1
                            i32.load offset=12
                            local.tee $p0
                            local.get $l1
                            i32.ne
                            br_if $B11
                            local.get $l1
                            i32.const 20
                            i32.const 16
                            local.get $l1
                            i32.load offset=20
                            local.tee $p0
                            select
                            i32.add
                            i32.load
                            local.tee $l4
                            br_if $B10
                            i32.const 0
                            local.set $p0
                            br $B9
                          end
                          local.get $l1
                          i32.load offset=8
                          local.tee $l4
                          local.get $p0
                          i32.store offset=12
                          local.get $p0
                          local.get $l4
                          i32.store offset=8
                          br $B9
                        end
                        local.get $l1
                        i32.const 20
                        i32.add
                        local.get $l1
                        i32.const 16
                        i32.add
                        local.get $p0
                        select
                        local.set $l6
                        loop $L12
                          local.get $l6
                          local.set $l7
                          local.get $l4
                          local.tee $p0
                          i32.const 20
                          i32.add
                          local.get $p0
                          i32.const 16
                          i32.add
                          local.get $p0
                          i32.load offset=20
                          local.tee $l4
                          select
                          local.set $l6
                          local.get $p0
                          i32.const 20
                          i32.const 16
                          local.get $l4
                          select
                          i32.add
                          i32.load
                          local.tee $l4
                          br_if $L12
                        end
                        local.get $l7
                        i32.const 0
                        i32.store
                      end
                      local.get $l5
                      i32.eqz
                      br_if $B3
                      block $B13
                        block $B14
                          local.get $l1
                          local.get $l1
                          i32.load offset=28
                          i32.const 2
                          i32.shl
                          i32.const 1051368
                          i32.add
                          local.tee $l4
                          i32.load
                          i32.eq
                          br_if $B14
                          block $B15
                            local.get $l5
                            i32.load offset=16
                            local.get $l1
                            i32.eq
                            br_if $B15
                            local.get $l5
                            local.get $p0
                            i32.store offset=20
                            local.get $p0
                            br_if $B13
                            br $B3
                          end
                          local.get $l5
                          local.get $p0
                          i32.store offset=16
                          local.get $p0
                          br_if $B13
                          br $B3
                        end
                        local.get $l4
                        local.get $p0
                        i32.store
                        local.get $p0
                        i32.eqz
                        br_if $B4
                      end
                      local.get $p0
                      local.get $l5
                      i32.store offset=24
                      block $B16
                        local.get $l1
                        i32.load offset=16
                        local.tee $l4
                        i32.eqz
                        br_if $B16
                        local.get $p0
                        local.get $l4
                        i32.store offset=16
                        local.get $l4
                        local.get $p0
                        i32.store offset=24
                      end
                      local.get $l1
                      i32.load offset=20
                      local.tee $l4
                      i32.eqz
                      br_if $B3
                      local.get $p0
                      local.get $l4
                      i32.store offset=20
                      local.get $l4
                      local.get $p0
                      i32.store offset=24
                      br $B3
                    end
                    local.get $p0
                    i32.load offset=4
                    i32.const -8
                    i32.and
                    local.get $l2
                    i32.sub
                    local.tee $l4
                    local.get $l3
                    local.get $l4
                    local.get $l3
                    i32.lt_u
                    local.tee $l4
                    select
                    local.set $l3
                    local.get $p0
                    local.get $l1
                    local.get $l4
                    select
                    local.set $l1
                    local.get $p0
                    local.set $l4
                    br $L7
                  end
                end
                block $B17
                  block $B18
                    local.get $p0
                    i32.const -1
                    i32.xor
                    i32.const 1
                    i32.and
                    local.get $l3
                    i32.add
                    local.tee $l6
                    i32.const 3
                    i32.shl
                    local.tee $p0
                    i32.const 1051512
                    i32.add
                    local.tee $l2
                    local.get $p0
                    i32.const 1051520
                    i32.add
                    i32.load
                    local.tee $l3
                    i32.load offset=8
                    local.tee $l4
                    i32.eq
                    br_if $B18
                    local.get $l4
                    local.get $l2
                    i32.store offset=12
                    local.get $l2
                    local.get $l4
                    i32.store offset=8
                    br $B17
                  end
                  i32.const 0
                  local.get $l1
                  i32.const -2
                  local.get $l6
                  i32.rotl
                  i32.and
                  i32.store offset=1051776
                end
                local.get $l3
                local.get $p0
                i32.const 3
                i32.or
                i32.store offset=4
                local.get $l3
                local.get $p0
                i32.add
                local.tee $p0
                local.get $p0
                i32.load offset=4
                i32.const 1
                i32.or
                i32.store offset=4
                local.get $l3
                i32.const 8
                i32.add
                return
              end
              block $B19
                block $B20
                  local.get $p0
                  local.get $l3
                  i32.shl
                  i32.const 2
                  local.get $l3
                  i32.shl
                  local.tee $p0
                  i32.const 0
                  local.get $p0
                  i32.sub
                  i32.or
                  i32.and
                  i32.ctz
                  local.tee $l7
                  i32.const 3
                  i32.shl
                  local.tee $l3
                  i32.const 1051512
                  i32.add
                  local.tee $l4
                  local.get $l3
                  i32.const 1051520
                  i32.add
                  i32.load
                  local.tee $p0
                  i32.load offset=8
                  local.tee $l6
                  i32.eq
                  br_if $B20
                  local.get $l6
                  local.get $l4
                  i32.store offset=12
                  local.get $l4
                  local.get $l6
                  i32.store offset=8
                  br $B19
                end
                i32.const 0
                local.get $l1
                i32.const -2
                local.get $l7
                i32.rotl
                i32.and
                i32.store offset=1051776
              end
              local.get $p0
              local.get $l2
              i32.const 3
              i32.or
              i32.store offset=4
              local.get $p0
              local.get $l2
              i32.add
              local.tee $l1
              local.get $l3
              local.get $l2
              i32.sub
              local.tee $l2
              i32.const 1
              i32.or
              i32.store offset=4
              local.get $p0
              local.get $l3
              i32.add
              local.get $l2
              i32.store
              block $B21
                i32.const 0
                i32.load offset=1051784
                local.tee $l4
                i32.eqz
                br_if $B21
                i32.const 0
                i32.load offset=1051792
                local.set $l3
                block $B22
                  block $B23
                    i32.const 0
                    i32.load offset=1051776
                    local.tee $l6
                    i32.const 1
                    local.get $l4
                    i32.const 3
                    i32.shr_u
                    i32.shl
                    local.tee $l7
                    i32.and
                    br_if $B23
                    i32.const 0
                    local.get $l6
                    local.get $l7
                    i32.or
                    i32.store offset=1051776
                    local.get $l4
                    i32.const -8
                    i32.and
                    i32.const 1051512
                    i32.add
                    local.tee $l4
                    local.set $l6
                    br $B22
                  end
                  local.get $l4
                  i32.const -8
                  i32.and
                  local.tee $l4
                  i32.const 1051512
                  i32.add
                  local.set $l6
                  local.get $l4
                  i32.const 1051520
                  i32.add
                  i32.load
                  local.set $l4
                end
                local.get $l6
                local.get $l3
                i32.store offset=8
                local.get $l4
                local.get $l3
                i32.store offset=12
                local.get $l3
                local.get $l6
                i32.store offset=12
                local.get $l3
                local.get $l4
                i32.store offset=8
              end
              i32.const 0
              local.get $l1
              i32.store offset=1051792
              i32.const 0
              local.get $l2
              i32.store offset=1051784
              local.get $p0
              i32.const 8
              i32.add
              return
            end
            i32.const 0
            i32.const 0
            i32.load offset=1051780
            i32.const -2
            local.get $l1
            i32.load offset=28
            i32.rotl
            i32.and
            i32.store offset=1051780
          end
          block $B24
            block $B25
              block $B26
                local.get $l3
                i32.const 16
                i32.lt_u
                br_if $B26
                local.get $l1
                local.get $l2
                i32.const 3
                i32.or
                i32.store offset=4
                local.get $l1
                local.get $l2
                i32.add
                local.tee $l4
                local.get $l3
                i32.const 1
                i32.or
                i32.store offset=4
                local.get $l4
                local.get $l3
                i32.add
                local.get $l3
                i32.store
                i32.const 0
                i32.load offset=1051784
                local.tee $l6
                i32.eqz
                br_if $B25
                i32.const 0
                i32.load offset=1051792
                local.set $p0
                block $B27
                  block $B28
                    i32.const 0
                    i32.load offset=1051776
                    local.tee $l7
                    i32.const 1
                    local.get $l6
                    i32.const 3
                    i32.shr_u
                    i32.shl
                    local.tee $l5
                    i32.and
                    br_if $B28
                    i32.const 0
                    local.get $l7
                    local.get $l5
                    i32.or
                    i32.store offset=1051776
                    local.get $l6
                    i32.const -8
                    i32.and
                    i32.const 1051512
                    i32.add
                    local.tee $l6
                    local.set $l7
                    br $B27
                  end
                  local.get $l6
                  i32.const -8
                  i32.and
                  local.tee $l6
                  i32.const 1051512
                  i32.add
                  local.set $l7
                  local.get $l6
                  i32.const 1051520
                  i32.add
                  i32.load
                  local.set $l6
                end
                local.get $l7
                local.get $p0
                i32.store offset=8
                local.get $l6
                local.get $p0
                i32.store offset=12
                local.get $p0
                local.get $l7
                i32.store offset=12
                local.get $p0
                local.get $l6
                i32.store offset=8
                br $B25
              end
              local.get $l1
              local.get $l3
              local.get $l2
              i32.add
              local.tee $p0
              i32.const 3
              i32.or
              i32.store offset=4
              local.get $l1
              local.get $p0
              i32.add
              local.tee $p0
              local.get $p0
              i32.load offset=4
              i32.const 1
              i32.or
              i32.store offset=4
              br $B24
            end
            i32.const 0
            local.get $l4
            i32.store offset=1051792
            i32.const 0
            local.get $l3
            i32.store offset=1051784
          end
          local.get $l1
          i32.const 8
          i32.add
          local.tee $p0
          i32.eqz
          br_if $B1
          br $B0
        end
        local.get $p0
        i32.const 11
        i32.add
        local.tee $l3
        i32.const -8
        i32.and
        local.set $l2
        i32.const 0
        i32.load offset=1051780
        local.tee $l8
        i32.eqz
        br_if $B1
        i32.const 31
        local.set $l5
        block $B29
          local.get $p0
          i32.const 16777204
          i32.gt_u
          br_if $B29
          local.get $l2
          i32.const 38
          local.get $l3
          i32.const 8
          i32.shr_u
          i32.clz
          local.tee $p0
          i32.sub
          i32.shr_u
          i32.const 1
          i32.and
          local.get $p0
          i32.const 1
          i32.shl
          i32.sub
          i32.const 62
          i32.add
          local.set $l5
        end
        i32.const 0
        local.get $l2
        i32.sub
        local.set $l3
        block $B30
          block $B31
            block $B32
              block $B33
                local.get $l5
                i32.const 2
                i32.shl
                i32.const 1051368
                i32.add
                i32.load
                local.tee $l1
                br_if $B33
                i32.const 0
                local.set $l4
                i32.const 0
                local.set $p0
                br $B32
              end
              i32.const 0
              local.set $l4
              local.get $l2
              i32.const 0
              i32.const 25
              local.get $l5
              i32.const 1
              i32.shr_u
              i32.sub
              local.get $l5
              i32.const 31
              i32.eq
              select
              i32.shl
              local.set $l6
              i32.const 0
              local.set $p0
              loop $L34
                block $B35
                  local.get $l1
                  local.tee $l1
                  i32.load offset=4
                  i32.const -8
                  i32.and
                  local.tee $l7
                  local.get $l2
                  i32.lt_u
                  br_if $B35
                  local.get $l7
                  local.get $l2
                  i32.sub
                  local.tee $l7
                  local.get $l3
                  i32.ge_u
                  br_if $B35
                  local.get $l1
                  local.set $l4
                  local.get $l7
                  local.set $l3
                  local.get $l7
                  br_if $B35
                  i32.const 0
                  local.set $l3
                  local.get $l1
                  local.set $p0
                  local.get $l1
                  local.set $l4
                  br $B31
                end
                local.get $l1
                i32.load offset=20
                local.tee $l7
                local.get $p0
                local.get $l7
                local.get $l1
                local.get $l6
                i32.const 29
                i32.shr_u
                i32.const 4
                i32.and
                i32.add
                i32.load offset=16
                local.tee $l1
                i32.ne
                select
                local.get $p0
                local.get $l7
                select
                local.set $p0
                local.get $l6
                i32.const 1
                i32.shl
                local.set $l6
                local.get $l1
                br_if $L34
              end
            end
            block $B36
              local.get $p0
              local.get $l4
              i32.or
              br_if $B36
              i32.const 0
              local.set $l4
              i32.const 2
              local.get $l5
              i32.shl
              local.tee $p0
              i32.const 0
              local.get $p0
              i32.sub
              i32.or
              local.get $l8
              i32.and
              local.tee $p0
              i32.eqz
              br_if $B1
              local.get $p0
              i32.ctz
              i32.const 2
              i32.shl
              i32.const 1051368
              i32.add
              i32.load
              local.set $p0
            end
            local.get $p0
            i32.eqz
            br_if $B30
          end
          loop $L37
            local.get $p0
            i32.load offset=4
            i32.const -8
            i32.and
            local.tee $l1
            local.get $l2
            i32.sub
            local.tee $l6
            local.get $l3
            local.get $l6
            local.get $l3
            i32.lt_u
            local.tee $l7
            select
            local.set $l5
            local.get $l1
            local.get $l2
            i32.lt_u
            local.set $l6
            local.get $p0
            local.get $l4
            local.get $l7
            select
            local.set $l7
            block $B38
              local.get $p0
              i32.load offset=16
              local.tee $l1
              br_if $B38
              local.get $p0
              i32.load offset=20
              local.set $l1
            end
            local.get $l3
            local.get $l5
            local.get $l6
            select
            local.set $l3
            local.get $l4
            local.get $l7
            local.get $l6
            select
            local.set $l4
            local.get $l1
            local.set $p0
            local.get $l1
            br_if $L37
          end
        end
        local.get $l4
        i32.eqz
        br_if $B1
        block $B39
          i32.const 0
          i32.load offset=1051784
          local.tee $p0
          local.get $l2
          i32.lt_u
          br_if $B39
          local.get $l3
          local.get $p0
          local.get $l2
          i32.sub
          i32.ge_u
          br_if $B1
        end
        local.get $l4
        i32.load offset=24
        local.set $l5
        block $B40
          block $B41
            block $B42
              local.get $l4
              i32.load offset=12
              local.tee $p0
              local.get $l4
              i32.ne
              br_if $B42
              local.get $l4
              i32.const 20
              i32.const 16
              local.get $l4
              i32.load offset=20
              local.tee $p0
              select
              i32.add
              i32.load
              local.tee $l1
              br_if $B41
              i32.const 0
              local.set $p0
              br $B40
            end
            local.get $l4
            i32.load offset=8
            local.tee $l1
            local.get $p0
            i32.store offset=12
            local.get $p0
            local.get $l1
            i32.store offset=8
            br $B40
          end
          local.get $l4
          i32.const 20
          i32.add
          local.get $l4
          i32.const 16
          i32.add
          local.get $p0
          select
          local.set $l6
          loop $L43
            local.get $l6
            local.set $l7
            local.get $l1
            local.tee $p0
            i32.const 20
            i32.add
            local.get $p0
            i32.const 16
            i32.add
            local.get $p0
            i32.load offset=20
            local.tee $l1
            select
            local.set $l6
            local.get $p0
            i32.const 20
            i32.const 16
            local.get $l1
            select
            i32.add
            i32.load
            local.tee $l1
            br_if $L43
          end
          local.get $l7
          i32.const 0
          i32.store
        end
        block $B44
          local.get $l5
          i32.eqz
          br_if $B44
          block $B45
            block $B46
              block $B47
                local.get $l4
                local.get $l4
                i32.load offset=28
                i32.const 2
                i32.shl
                i32.const 1051368
                i32.add
                local.tee $l1
                i32.load
                i32.eq
                br_if $B47
                block $B48
                  local.get $l5
                  i32.load offset=16
                  local.get $l4
                  i32.eq
                  br_if $B48
                  local.get $l5
                  local.get $p0
                  i32.store offset=20
                  local.get $p0
                  br_if $B46
                  br $B44
                end
                local.get $l5
                local.get $p0
                i32.store offset=16
                local.get $p0
                br_if $B46
                br $B44
              end
              local.get $l1
              local.get $p0
              i32.store
              local.get $p0
              i32.eqz
              br_if $B45
            end
            local.get $p0
            local.get $l5
            i32.store offset=24
            block $B49
              local.get $l4
              i32.load offset=16
              local.tee $l1
              i32.eqz
              br_if $B49
              local.get $p0
              local.get $l1
              i32.store offset=16
              local.get $l1
              local.get $p0
              i32.store offset=24
            end
            local.get $l4
            i32.load offset=20
            local.tee $l1
            i32.eqz
            br_if $B44
            local.get $p0
            local.get $l1
            i32.store offset=20
            local.get $l1
            local.get $p0
            i32.store offset=24
            br $B44
          end
          i32.const 0
          i32.const 0
          i32.load offset=1051780
          i32.const -2
          local.get $l4
          i32.load offset=28
          i32.rotl
          i32.and
          i32.store offset=1051780
        end
        block $B50
          block $B51
            local.get $l3
            i32.const 16
            i32.lt_u
            br_if $B51
            local.get $l4
            local.get $l2
            i32.const 3
            i32.or
            i32.store offset=4
            local.get $l4
            local.get $l2
            i32.add
            local.tee $l1
            local.get $l3
            i32.const 1
            i32.or
            i32.store offset=4
            local.get $l1
            local.get $l3
            i32.add
            local.get $l3
            i32.store
            block $B52
              local.get $l3
              i32.const 256
              i32.lt_u
              br_if $B52
              i32.const 31
              local.set $p0
              block $B53
                local.get $l3
                i32.const 16777215
                i32.gt_u
                br_if $B53
                local.get $l3
                i32.const 38
                local.get $l3
                i32.const 8
                i32.shr_u
                i32.clz
                local.tee $p0
                i32.sub
                i32.shr_u
                i32.const 1
                i32.and
                local.get $p0
                i32.const 1
                i32.shl
                i32.sub
                i32.const 62
                i32.add
                local.set $p0
              end
              local.get $l1
              i64.const 0
              i64.store offset=16 align=4
              local.get $l1
              local.get $p0
              i32.store offset=28
              local.get $p0
              i32.const 2
              i32.shl
              i32.const 1051368
              i32.add
              local.set $l6
              block $B54
                i32.const 0
                i32.load offset=1051780
                i32.const 1
                local.get $p0
                i32.shl
                local.tee $l7
                i32.and
                br_if $B54
                local.get $l6
                local.get $l1
                i32.store
                local.get $l1
                local.get $l6
                i32.store offset=24
                local.get $l1
                local.get $l1
                i32.store offset=12
                local.get $l1
                local.get $l1
                i32.store offset=8
                i32.const 0
                i32.const 0
                i32.load offset=1051780
                local.get $l7
                i32.or
                i32.store offset=1051780
                br $B50
              end
              block $B55
                block $B56
                  block $B57
                    local.get $l6
                    i32.load
                    local.tee $l7
                    i32.load offset=4
                    i32.const -8
                    i32.and
                    local.get $l3
                    i32.ne
                    br_if $B57
                    local.get $l7
                    local.set $p0
                    br $B56
                  end
                  local.get $l3
                  i32.const 0
                  i32.const 25
                  local.get $p0
                  i32.const 1
                  i32.shr_u
                  i32.sub
                  local.get $p0
                  i32.const 31
                  i32.eq
                  select
                  i32.shl
                  local.set $l6
                  loop $L58
                    local.get $l7
                    local.get $l6
                    i32.const 29
                    i32.shr_u
                    i32.const 4
                    i32.and
                    i32.add
                    local.tee $l5
                    i32.load offset=16
                    local.tee $p0
                    i32.eqz
                    br_if $B55
                    local.get $l6
                    i32.const 1
                    i32.shl
                    local.set $l6
                    local.get $p0
                    local.set $l7
                    local.get $p0
                    i32.load offset=4
                    i32.const -8
                    i32.and
                    local.get $l3
                    i32.ne
                    br_if $L58
                  end
                end
                local.get $p0
                i32.load offset=8
                local.tee $l3
                local.get $l1
                i32.store offset=12
                local.get $p0
                local.get $l1
                i32.store offset=8
                local.get $l1
                i32.const 0
                i32.store offset=24
                local.get $l1
                local.get $p0
                i32.store offset=12
                local.get $l1
                local.get $l3
                i32.store offset=8
                br $B50
              end
              local.get $l5
              i32.const 16
              i32.add
              local.get $l1
              i32.store
              local.get $l1
              local.get $l7
              i32.store offset=24
              local.get $l1
              local.get $l1
              i32.store offset=12
              local.get $l1
              local.get $l1
              i32.store offset=8
              br $B50
            end
            block $B59
              block $B60
                i32.const 0
                i32.load offset=1051776
                local.tee $p0
                i32.const 1
                local.get $l3
                i32.const 3
                i32.shr_u
                i32.shl
                local.tee $l6
                i32.and
                br_if $B60
                i32.const 0
                local.get $p0
                local.get $l6
                i32.or
                i32.store offset=1051776
                local.get $l3
                i32.const 248
                i32.and
                i32.const 1051512
                i32.add
                local.tee $p0
                local.set $l3
                br $B59
              end
              local.get $l3
              i32.const 248
              i32.and
              local.tee $p0
              i32.const 1051512
              i32.add
              local.set $l3
              local.get $p0
              i32.const 1051520
              i32.add
              i32.load
              local.set $p0
            end
            local.get $l3
            local.get $l1
            i32.store offset=8
            local.get $p0
            local.get $l1
            i32.store offset=12
            local.get $l1
            local.get $l3
            i32.store offset=12
            local.get $l1
            local.get $p0
            i32.store offset=8
            br $B50
          end
          local.get $l4
          local.get $l3
          local.get $l2
          i32.add
          local.tee $p0
          i32.const 3
          i32.or
          i32.store offset=4
          local.get $l4
          local.get $p0
          i32.add
          local.tee $p0
          local.get $p0
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
        end
        local.get $l4
        i32.const 8
        i32.add
        local.tee $p0
        br_if $B0
      end
      block $B61
        block $B62
          block $B63
            block $B64
              block $B65
                block $B66
                  i32.const 0
                  i32.load offset=1051784
                  local.tee $p0
                  local.get $l2
                  i32.ge_u
                  br_if $B66
                  block $B67
                    i32.const 0
                    i32.load offset=1051788
                    local.tee $p0
                    local.get $l2
                    i32.gt_u
                    br_if $B67
                    block $B68
                      local.get $l2
                      i32.const 65583
                      i32.add
                      local.tee $l4
                      i32.const 16
                      i32.shr_u
                      memory.grow
                      local.tee $l3
                      i32.const -1
                      i32.ne
                      br_if $B68
                      i32.const 0
                      return
                    end
                    i32.const 0
                    local.set $p0
                    local.get $l3
                    i32.const 16
                    i32.shl
                    local.tee $l1
                    i32.eqz
                    br_if $B0
                    i32.const 0
                    i32.const 0
                    i32.load offset=1051800
                    local.get $l4
                    i32.const -65536
                    i32.and
                    local.tee $p0
                    i32.const -16
                    i32.add
                    local.get $p0
                    local.get $l1
                    i32.const 0
                    local.get $p0
                    i32.sub
                    i32.eq
                    select
                    local.tee $l7
                    i32.add
                    local.tee $p0
                    i32.store offset=1051800
                    i32.const 0
                    local.get $p0
                    i32.const 0
                    i32.load offset=1051804
                    local.tee $l3
                    local.get $p0
                    local.get $l3
                    i32.gt_u
                    select
                    i32.store offset=1051804
                    block $B69
                      block $B70
                        block $B71
                          i32.const 0
                          i32.load offset=1051796
                          local.tee $l3
                          i32.eqz
                          br_if $B71
                          i32.const 1051496
                          local.set $p0
                          loop $L72
                            local.get $p0
                            i32.load
                            local.tee $l4
                            local.get $p0
                            i32.load offset=4
                            local.tee $l6
                            i32.add
                            local.get $l1
                            i32.eq
                            br_if $B70
                            local.get $p0
                            i32.load offset=8
                            local.tee $p0
                            br_if $L72
                            br $B69
                          end
                        end
                        block $B73
                          block $B74
                            i32.const 0
                            i32.load offset=1051812
                            local.tee $p0
                            i32.eqz
                            br_if $B74
                            local.get $p0
                            local.get $l1
                            i32.le_u
                            br_if $B73
                          end
                          i32.const 0
                          local.get $l1
                          i32.store offset=1051812
                        end
                        i32.const 0
                        i32.const 4095
                        i32.store offset=1051816
                        i32.const 0
                        local.get $l7
                        i32.store offset=1051500
                        i32.const 0
                        local.get $l1
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
                        local.get $l1
                        i32.store offset=1051796
                        i32.const 0
                        i32.const 1051760
                        i32.store offset=1051768
                        i32.const 0
                        local.get $l7
                        i32.const -40
                        i32.add
                        local.tee $p0
                        i32.store offset=1051788
                        local.get $l1
                        local.get $p0
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        local.get $l1
                        local.get $p0
                        i32.add
                        i32.const 40
                        i32.store offset=4
                        i32.const 0
                        i32.const 2097152
                        i32.store offset=1051808
                        br $B61
                      end
                      local.get $l3
                      local.get $l1
                      i32.ge_u
                      br_if $B69
                      local.get $l4
                      local.get $l3
                      i32.gt_u
                      br_if $B69
                      local.get $p0
                      i32.load offset=12
                      i32.eqz
                      br_if $B65
                    end
                    i32.const 0
                    i32.const 0
                    i32.load offset=1051812
                    local.tee $p0
                    local.get $l1
                    local.get $p0
                    local.get $l1
                    i32.lt_u
                    select
                    i32.store offset=1051812
                    local.get $l1
                    local.get $l7
                    i32.add
                    local.set $l4
                    i32.const 1051496
                    local.set $p0
                    block $B75
                      block $B76
                        block $B77
                          loop $L78
                            local.get $p0
                            i32.load
                            local.tee $l6
                            local.get $l4
                            i32.eq
                            br_if $B77
                            local.get $p0
                            i32.load offset=8
                            local.tee $p0
                            br_if $L78
                            br $B76
                          end
                        end
                        local.get $p0
                        i32.load offset=12
                        i32.eqz
                        br_if $B75
                      end
                      i32.const 1051496
                      local.set $p0
                      block $B79
                        loop $L80
                          block $B81
                            local.get $p0
                            i32.load
                            local.tee $l4
                            local.get $l3
                            i32.gt_u
                            br_if $B81
                            local.get $l3
                            local.get $l4
                            local.get $p0
                            i32.load offset=4
                            i32.add
                            local.tee $l4
                            i32.lt_u
                            br_if $B79
                          end
                          local.get $p0
                          i32.load offset=8
                          local.set $p0
                          br $L80
                        end
                      end
                      i32.const 0
                      local.get $l1
                      i32.store offset=1051796
                      i32.const 0
                      local.get $l7
                      i32.const -40
                      i32.add
                      local.tee $p0
                      i32.store offset=1051788
                      local.get $l1
                      local.get $p0
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get $l1
                      local.get $p0
                      i32.add
                      i32.const 40
                      i32.store offset=4
                      i32.const 0
                      i32.const 2097152
                      i32.store offset=1051808
                      local.get $l3
                      local.get $l4
                      i32.const -32
                      i32.add
                      i32.const -8
                      i32.and
                      i32.const -8
                      i32.add
                      local.tee $p0
                      local.get $p0
                      local.get $l3
                      i32.const 16
                      i32.add
                      i32.lt_u
                      select
                      local.tee $l6
                      i32.const 27
                      i32.store offset=4
                      i32.const 0
                      i64.load offset=1051496 align=4
                      local.set $l9
                      local.get $l6
                      i32.const 16
                      i32.add
                      i32.const 0
                      i64.load offset=1051504 align=4
                      i64.store align=4
                      local.get $l6
                      i32.const 8
                      i32.add
                      local.tee $p0
                      local.get $l9
                      i64.store align=4
                      i32.const 0
                      local.get $l7
                      i32.store offset=1051500
                      i32.const 0
                      local.get $l1
                      i32.store offset=1051496
                      i32.const 0
                      local.get $p0
                      i32.store offset=1051504
                      i32.const 0
                      i32.const 0
                      i32.store offset=1051508
                      local.get $l6
                      i32.const 28
                      i32.add
                      local.set $p0
                      loop $L82
                        local.get $p0
                        i32.const 7
                        i32.store
                        local.get $p0
                        i32.const 4
                        i32.add
                        local.tee $p0
                        local.get $l4
                        i32.lt_u
                        br_if $L82
                      end
                      local.get $l6
                      local.get $l3
                      i32.eq
                      br_if $B61
                      local.get $l6
                      local.get $l6
                      i32.load offset=4
                      i32.const -2
                      i32.and
                      i32.store offset=4
                      local.get $l3
                      local.get $l6
                      local.get $l3
                      i32.sub
                      local.tee $p0
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get $l6
                      local.get $p0
                      i32.store
                      block $B83
                        local.get $p0
                        i32.const 256
                        i32.lt_u
                        br_if $B83
                        local.get $l3
                        local.get $p0
                        call $f33
                        br $B61
                      end
                      block $B84
                        block $B85
                          i32.const 0
                          i32.load offset=1051776
                          local.tee $l4
                          i32.const 1
                          local.get $p0
                          i32.const 3
                          i32.shr_u
                          i32.shl
                          local.tee $l1
                          i32.and
                          br_if $B85
                          i32.const 0
                          local.get $l4
                          local.get $l1
                          i32.or
                          i32.store offset=1051776
                          local.get $p0
                          i32.const 248
                          i32.and
                          i32.const 1051512
                          i32.add
                          local.tee $p0
                          local.set $l4
                          br $B84
                        end
                        local.get $p0
                        i32.const 248
                        i32.and
                        local.tee $p0
                        i32.const 1051512
                        i32.add
                        local.set $l4
                        local.get $p0
                        i32.const 1051520
                        i32.add
                        i32.load
                        local.set $p0
                      end
                      local.get $l4
                      local.get $l3
                      i32.store offset=8
                      local.get $p0
                      local.get $l3
                      i32.store offset=12
                      local.get $l3
                      local.get $l4
                      i32.store offset=12
                      local.get $l3
                      local.get $p0
                      i32.store offset=8
                      br $B61
                    end
                    local.get $p0
                    local.get $l1
                    i32.store
                    local.get $p0
                    local.get $p0
                    i32.load offset=4
                    local.get $l7
                    i32.add
                    i32.store offset=4
                    local.get $l1
                    local.get $l2
                    i32.const 3
                    i32.or
                    i32.store offset=4
                    local.get $l6
                    i32.const 15
                    i32.add
                    i32.const -8
                    i32.and
                    i32.const -8
                    i32.add
                    local.tee $l4
                    local.get $l1
                    local.get $l2
                    i32.add
                    local.tee $p0
                    i32.sub
                    local.set $l3
                    local.get $l4
                    i32.const 0
                    i32.load offset=1051796
                    i32.eq
                    br_if $B64
                    local.get $l4
                    i32.const 0
                    i32.load offset=1051792
                    i32.eq
                    br_if $B63
                    block $B86
                      local.get $l4
                      i32.load offset=4
                      local.tee $l2
                      i32.const 3
                      i32.and
                      i32.const 1
                      i32.ne
                      br_if $B86
                      local.get $l4
                      local.get $l2
                      i32.const -8
                      i32.and
                      local.tee $l2
                      call $f34
                      local.get $l2
                      local.get $l3
                      i32.add
                      local.set $l3
                      local.get $l4
                      local.get $l2
                      i32.add
                      local.tee $l4
                      i32.load offset=4
                      local.set $l2
                    end
                    local.get $l4
                    local.get $l2
                    i32.const -2
                    i32.and
                    i32.store offset=4
                    local.get $p0
                    local.get $l3
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    local.get $p0
                    local.get $l3
                    i32.add
                    local.get $l3
                    i32.store
                    block $B87
                      local.get $l3
                      i32.const 256
                      i32.lt_u
                      br_if $B87
                      local.get $p0
                      local.get $l3
                      call $f33
                      br $B62
                    end
                    block $B88
                      block $B89
                        i32.const 0
                        i32.load offset=1051776
                        local.tee $l2
                        i32.const 1
                        local.get $l3
                        i32.const 3
                        i32.shr_u
                        i32.shl
                        local.tee $l4
                        i32.and
                        br_if $B89
                        i32.const 0
                        local.get $l2
                        local.get $l4
                        i32.or
                        i32.store offset=1051776
                        local.get $l3
                        i32.const 248
                        i32.and
                        i32.const 1051512
                        i32.add
                        local.tee $l3
                        local.set $l2
                        br $B88
                      end
                      local.get $l3
                      i32.const 248
                      i32.and
                      local.tee $l3
                      i32.const 1051512
                      i32.add
                      local.set $l2
                      local.get $l3
                      i32.const 1051520
                      i32.add
                      i32.load
                      local.set $l3
                    end
                    local.get $l2
                    local.get $p0
                    i32.store offset=8
                    local.get $l3
                    local.get $p0
                    i32.store offset=12
                    local.get $p0
                    local.get $l2
                    i32.store offset=12
                    local.get $p0
                    local.get $l3
                    i32.store offset=8
                    br $B62
                  end
                  i32.const 0
                  local.get $p0
                  local.get $l2
                  i32.sub
                  local.tee $l3
                  i32.store offset=1051788
                  i32.const 0
                  i32.const 0
                  i32.load offset=1051796
                  local.tee $p0
                  local.get $l2
                  i32.add
                  local.tee $l4
                  i32.store offset=1051796
                  local.get $l4
                  local.get $l3
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get $p0
                  local.get $l2
                  i32.const 3
                  i32.or
                  i32.store offset=4
                  local.get $p0
                  i32.const 8
                  i32.add
                  local.set $p0
                  br $B0
                end
                i32.const 0
                i32.load offset=1051792
                local.set $l3
                block $B90
                  block $B91
                    local.get $p0
                    local.get $l2
                    i32.sub
                    local.tee $l4
                    i32.const 15
                    i32.gt_u
                    br_if $B91
                    i32.const 0
                    i32.const 0
                    i32.store offset=1051792
                    i32.const 0
                    i32.const 0
                    i32.store offset=1051784
                    local.get $l3
                    local.get $p0
                    i32.const 3
                    i32.or
                    i32.store offset=4
                    local.get $l3
                    local.get $p0
                    i32.add
                    local.tee $p0
                    local.get $p0
                    i32.load offset=4
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    br $B90
                  end
                  i32.const 0
                  local.get $l4
                  i32.store offset=1051784
                  i32.const 0
                  local.get $l3
                  local.get $l2
                  i32.add
                  local.tee $l1
                  i32.store offset=1051792
                  local.get $l1
                  local.get $l4
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get $l3
                  local.get $p0
                  i32.add
                  local.get $l4
                  i32.store
                  local.get $l3
                  local.get $l2
                  i32.const 3
                  i32.or
                  i32.store offset=4
                end
                local.get $l3
                i32.const 8
                i32.add
                return
              end
              local.get $p0
              local.get $l6
              local.get $l7
              i32.add
              i32.store offset=4
              i32.const 0
              i32.const 0
              i32.load offset=1051796
              local.tee $p0
              i32.const 15
              i32.add
              i32.const -8
              i32.and
              local.tee $l3
              i32.const -8
              i32.add
              local.tee $l4
              i32.store offset=1051796
              i32.const 0
              local.get $p0
              local.get $l3
              i32.sub
              i32.const 0
              i32.load offset=1051788
              local.get $l7
              i32.add
              local.tee $l3
              i32.add
              i32.const 8
              i32.add
              local.tee $l1
              i32.store offset=1051788
              local.get $l4
              local.get $l1
              i32.const 1
              i32.or
              i32.store offset=4
              local.get $p0
              local.get $l3
              i32.add
              i32.const 40
              i32.store offset=4
              i32.const 0
              i32.const 2097152
              i32.store offset=1051808
              br $B61
            end
            i32.const 0
            local.get $p0
            i32.store offset=1051796
            i32.const 0
            i32.const 0
            i32.load offset=1051788
            local.get $l3
            i32.add
            local.tee $l3
            i32.store offset=1051788
            local.get $p0
            local.get $l3
            i32.const 1
            i32.or
            i32.store offset=4
            br $B62
          end
          i32.const 0
          local.get $p0
          i32.store offset=1051792
          i32.const 0
          i32.const 0
          i32.load offset=1051784
          local.get $l3
          i32.add
          local.tee $l3
          i32.store offset=1051784
          local.get $p0
          local.get $l3
          i32.const 1
          i32.or
          i32.store offset=4
          local.get $p0
          local.get $l3
          i32.add
          local.get $l3
          i32.store
        end
        local.get $l1
        i32.const 8
        i32.add
        return
      end
      i32.const 0
      local.set $p0
      i32.const 0
      i32.load offset=1051788
      local.tee $l3
      local.get $l2
      i32.le_u
      br_if $B0
      i32.const 0
      local.get $l3
      local.get $l2
      i32.sub
      local.tee $l3
      i32.store offset=1051788
      i32.const 0
      i32.const 0
      i32.load offset=1051796
      local.tee $p0
      local.get $l2
      i32.add
      local.tee $l4
      i32.store offset=1051796
      local.get $l4
      local.get $l3
      i32.const 1
      i32.or
      i32.store offset=4
      local.get $p0
      local.get $l2
      i32.const 3
      i32.or
      i32.store offset=4
      local.get $p0
      i32.const 8
      i32.add
      return
    end
    local.get $p0)
  (func $f33 (type $t3) (param $p0 i32) (param $p1 i32)
    (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32)
    i32.const 31
    local.set $l2
    block $B0
      local.get $p1
      i32.const 16777215
      i32.gt_u
      br_if $B0
      local.get $p1
      i32.const 38
      local.get $p1
      i32.const 8
      i32.shr_u
      i32.clz
      local.tee $l2
      i32.sub
      i32.shr_u
      i32.const 1
      i32.and
      local.get $l2
      i32.const 1
      i32.shl
      i32.sub
      i32.const 62
      i32.add
      local.set $l2
    end
    local.get $p0
    i64.const 0
    i64.store offset=16 align=4
    local.get $p0
    local.get $l2
    i32.store offset=28
    local.get $l2
    i32.const 2
    i32.shl
    i32.const 1051368
    i32.add
    local.set $l3
    block $B1
      i32.const 0
      i32.load offset=1051780
      i32.const 1
      local.get $l2
      i32.shl
      local.tee $l4
      i32.and
      br_if $B1
      local.get $l3
      local.get $p0
      i32.store
      local.get $p0
      local.get $l3
      i32.store offset=24
      local.get $p0
      local.get $p0
      i32.store offset=12
      local.get $p0
      local.get $p0
      i32.store offset=8
      i32.const 0
      i32.const 0
      i32.load offset=1051780
      local.get $l4
      i32.or
      i32.store offset=1051780
      return
    end
    block $B2
      block $B3
        block $B4
          local.get $l3
          i32.load
          local.tee $l4
          i32.load offset=4
          i32.const -8
          i32.and
          local.get $p1
          i32.ne
          br_if $B4
          local.get $l4
          local.set $l2
          br $B3
        end
        local.get $p1
        i32.const 0
        i32.const 25
        local.get $l2
        i32.const 1
        i32.shr_u
        i32.sub
        local.get $l2
        i32.const 31
        i32.eq
        select
        i32.shl
        local.set $l3
        loop $L5
          local.get $l4
          local.get $l3
          i32.const 29
          i32.shr_u
          i32.const 4
          i32.and
          i32.add
          local.tee $l5
          i32.load offset=16
          local.tee $l2
          i32.eqz
          br_if $B2
          local.get $l3
          i32.const 1
          i32.shl
          local.set $l3
          local.get $l2
          local.set $l4
          local.get $l2
          i32.load offset=4
          i32.const -8
          i32.and
          local.get $p1
          i32.ne
          br_if $L5
        end
      end
      local.get $l2
      i32.load offset=8
      local.tee $l3
      local.get $p0
      i32.store offset=12
      local.get $l2
      local.get $p0
      i32.store offset=8
      local.get $p0
      i32.const 0
      i32.store offset=24
      local.get $p0
      local.get $l2
      i32.store offset=12
      local.get $p0
      local.get $l3
      i32.store offset=8
      return
    end
    local.get $l5
    i32.const 16
    i32.add
    local.get $p0
    i32.store
    local.get $p0
    local.get $l4
    i32.store offset=24
    local.get $p0
    local.get $p0
    i32.store offset=12
    local.get $p0
    local.get $p0
    i32.store offset=8)
  (func $f34 (type $t3) (param $p0 i32) (param $p1 i32)
    (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32)
    local.get $p0
    i32.load offset=12
    local.set $l2
    block $B0
      block $B1
        block $B2
          block $B3
            local.get $p1
            i32.const 256
            i32.lt_u
            br_if $B3
            local.get $p0
            i32.load offset=24
            local.set $l3
            block $B4
              block $B5
                block $B6
                  local.get $l2
                  local.get $p0
                  i32.ne
                  br_if $B6
                  local.get $p0
                  i32.const 20
                  i32.const 16
                  local.get $p0
                  i32.load offset=20
                  local.tee $l2
                  select
                  i32.add
                  i32.load
                  local.tee $p1
                  br_if $B5
                  i32.const 0
                  local.set $l2
                  br $B4
                end
                local.get $p0
                i32.load offset=8
                local.tee $p1
                local.get $l2
                i32.store offset=12
                local.get $l2
                local.get $p1
                i32.store offset=8
                br $B4
              end
              local.get $p0
              i32.const 20
              i32.add
              local.get $p0
              i32.const 16
              i32.add
              local.get $l2
              select
              local.set $l4
              loop $L7
                local.get $l4
                local.set $l5
                local.get $p1
                local.tee $l2
                i32.const 20
                i32.add
                local.get $l2
                i32.const 16
                i32.add
                local.get $l2
                i32.load offset=20
                local.tee $p1
                select
                local.set $l4
                local.get $l2
                i32.const 20
                i32.const 16
                local.get $p1
                select
                i32.add
                i32.load
                local.tee $p1
                br_if $L7
              end
              local.get $l5
              i32.const 0
              i32.store
            end
            local.get $l3
            i32.eqz
            br_if $B1
            block $B8
              block $B9
                local.get $p0
                local.get $p0
                i32.load offset=28
                i32.const 2
                i32.shl
                i32.const 1051368
                i32.add
                local.tee $p1
                i32.load
                i32.eq
                br_if $B9
                local.get $l3
                i32.load offset=16
                local.get $p0
                i32.eq
                br_if $B8
                local.get $l3
                local.get $l2
                i32.store offset=20
                local.get $l2
                br_if $B2
                br $B1
              end
              local.get $p1
              local.get $l2
              i32.store
              local.get $l2
              i32.eqz
              br_if $B0
              br $B2
            end
            local.get $l3
            local.get $l2
            i32.store offset=16
            local.get $l2
            br_if $B2
            br $B1
          end
          block $B10
            local.get $l2
            local.get $p0
            i32.load offset=8
            local.tee $l4
            i32.eq
            br_if $B10
            local.get $l4
            local.get $l2
            i32.store offset=12
            local.get $l2
            local.get $l4
            i32.store offset=8
            return
          end
          i32.const 0
          i32.const 0
          i32.load offset=1051776
          i32.const -2
          local.get $p1
          i32.const 3
          i32.shr_u
          i32.rotl
          i32.and
          i32.store offset=1051776
          return
        end
        local.get $l2
        local.get $l3
        i32.store offset=24
        block $B11
          local.get $p0
          i32.load offset=16
          local.tee $p1
          i32.eqz
          br_if $B11
          local.get $l2
          local.get $p1
          i32.store offset=16
          local.get $p1
          local.get $l2
          i32.store offset=24
        end
        local.get $p0
        i32.load offset=20
        local.tee $p1
        i32.eqz
        br_if $B1
        local.get $l2
        local.get $p1
        i32.store offset=20
        local.get $p1
        local.get $l2
        i32.store offset=24
        return
      end
      return
    end
    i32.const 0
    i32.const 0
    i32.load offset=1051780
    i32.const -2
    local.get $p0
    i32.load offset=28
    i32.rotl
    i32.and
    i32.store offset=1051780)
  (func $f35 (type $t2) (param $p0 i32)
    local.get $p0
    call $f36
    unreachable)
  (func $f36 (type $t2) (param $p0 i32)
    (local $l1 i32) (local $l2 i32) (local $l3 i32)
    global.get $g0
    i32.const 16
    i32.sub
    local.tee $l1
    global.set $g0
    local.get $p0
    i32.load
    local.tee $l2
    i32.load offset=12
    local.set $l3
    block $B0
      block $B1
        block $B2
          block $B3
            local.get $l2
            i32.load offset=4
            br_table $B3 $B2 $B1
          end
          local.get $l3
          br_if $B1
          i32.const 1
          local.set $l2
          i32.const 0
          local.set $l3
          br $B0
        end
        local.get $l3
        br_if $B1
        local.get $l2
        i32.load
        local.tee $l2
        i32.load offset=4
        local.set $l3
        local.get $l2
        i32.load
        local.set $l2
        br $B0
      end
      local.get $l1
      i32.const -2147483648
      i32.store
      local.get $l1
      local.get $p0
      i32.store offset=12
      local.get $l1
      i32.const 10
      local.get $p0
      i32.load offset=8
      local.tee $p0
      i32.load8_u offset=8
      local.get $p0
      i32.load8_u offset=9
      call $f30
      unreachable
    end
    local.get $l1
    local.get $l3
    i32.store offset=4
    local.get $l1
    local.get $l2
    i32.store
    local.get $l1
    i32.const 11
    local.get $p0
    i32.load offset=8
    local.tee $p0
    i32.load8_u offset=8
    local.get $p0
    i32.load8_u offset=9
    call $f30
    unreachable)
  (func $f37 (type $t3) (param $p0 i32) (param $p1 i32)
    local.get $p0
    local.get $p1
    i64.load align=4
    i64.store)
  (func $f38 (type $t0) (param $p0 i32) (param $p1 i32) (result i32)
    block $B0
      local.get $p0
      i32.load
      i32.load8_u
      br_if $B0
      local.get $p1
      i32.const 1048598
      i32.const 5
      call $f22
      return
    end
    local.get $p1
    i32.const 1048603
    i32.const 4
    call $f22)
  (func $f39 (type $t0) (param $p0 i32) (param $p1 i32) (result i32)
    local.get $p1
    local.get $p0
    i32.load offset=4
    local.get $p0
    i32.load offset=8
    call $f22)
  (func $f40 (type $t7) (param $p0 i32) (param $p1 i32) (param $p2 i32) (param $p3 i32)
    (local $l4 i32) (local $l5 i32) (local $l6 i32) (local $l7 i32) (local $l8 i32) (local $l9 i32) (local $l10 i32) (local $l11 i32)
    global.get $g0
    i32.const 32
    i32.sub
    local.tee $l4
    global.set $g0
    block $B0
      block $B1
        block $B2
          local.get $p1
          i32.load offset=16
          br_if $B2
          local.get $p1
          i32.const -1
          i32.store offset=16
          local.get $p3
          local.set $l5
          local.get $p3
          local.set $l6
          block $B3
            local.get $p3
            local.get $p2
            i32.const 3
            i32.add
            i32.const -4
            i32.and
            local.get $p2
            i32.sub
            local.tee $l7
            i32.lt_u
            br_if $B3
            local.get $p3
            local.get $p3
            local.get $l7
            i32.sub
            i32.const 7
            i32.and
            local.tee $l8
            i32.sub
            local.set $l5
            local.get $p3
            local.get $l8
            i32.lt_u
            br_if $B1
            local.get $l7
            local.set $l6
          end
          i32.const 0
          local.get $l5
          i32.sub
          local.set $l9
          local.get $p2
          i32.const -1
          i32.add
          local.set $l10
          local.get $p3
          local.set $l7
          block $B4
            block $B5
              block $B6
                block $B7
                  block $B8
                    loop $L9
                      local.get $l9
                      local.get $l7
                      i32.add
                      i32.eqz
                      br_if $B8
                      local.get $l10
                      local.get $l7
                      i32.add
                      local.set $l8
                      local.get $l7
                      i32.const -1
                      i32.add
                      local.tee $l11
                      local.set $l7
                      local.get $l8
                      i32.load8_u
                      i32.const 10
                      i32.ne
                      br_if $L9
                    end
                    local.get $l9
                    local.get $l11
                    i32.add
                    i32.const 1
                    i32.add
                    local.get $l5
                    i32.add
                    local.set $l8
                    br $B7
                  end
                  block $B10
                    loop $L11
                      local.get $l5
                      local.tee $l7
                      local.get $l6
                      i32.le_u
                      br_if $B10
                      local.get $l7
                      i32.const -8
                      i32.add
                      local.set $l5
                      i32.const 16843008
                      local.get $p2
                      local.get $l7
                      i32.add
                      local.tee $l8
                      i32.const -8
                      i32.add
                      i32.load
                      local.tee $l9
                      i32.const 168430090
                      i32.xor
                      i32.sub
                      local.get $l9
                      i32.or
                      i32.const 16843008
                      local.get $l8
                      i32.const -4
                      i32.add
                      i32.load
                      local.tee $l8
                      i32.const 168430090
                      i32.xor
                      i32.sub
                      local.get $l8
                      i32.or
                      i32.and
                      i32.const -2139062144
                      i32.and
                      i32.const -2139062144
                      i32.eq
                      br_if $L11
                    end
                  end
                  local.get $l7
                  local.get $p3
                  i32.gt_u
                  br_if $B0
                  loop $L12
                    local.get $l7
                    local.tee $l8
                    i32.eqz
                    br_if $B6
                    local.get $l8
                    i32.const -1
                    i32.add
                    local.tee $l7
                    local.get $p2
                    i32.add
                    i32.load8_u
                    i32.const 10
                    i32.ne
                    br_if $L12
                  end
                end
                local.get $p3
                local.get $l8
                i32.ge_u
                br_if $B5
                local.get $l4
                i32.const 0
                i32.store offset=24
                local.get $l4
                i32.const 1
                i32.store offset=12
                local.get $l4
                i32.const 1050412
                i32.store offset=8
                local.get $l4
                i64.const 4
                i64.store offset=16 align=4
                local.get $l4
                i32.const 8
                i32.add
                i32.const 1050968
                call $f7
                unreachable
              end
              block $B13
                block $B14
                  local.get $p1
                  i32.load offset=28
                  local.tee $l7
                  br_if $B14
                  i32.const 0
                  local.set $l7
                  br $B13
                end
                local.get $p1
                i32.load offset=24
                local.get $l7
                i32.add
                i32.const -1
                i32.add
                i32.load8_u
                i32.const 10
                i32.ne
                br_if $B13
                i32.const 0
                local.set $l7
                local.get $p1
                i32.const 0
                i32.store offset=28
                local.get $p1
                i32.const 0
                i32.store8 offset=32
              end
              block $B15
                local.get $p3
                local.get $p1
                i32.load offset=20
                local.get $l7
                i32.sub
                i32.lt_u
                br_if $B15
                local.get $p0
                local.get $p1
                i32.const 20
                i32.add
                local.get $p2
                local.get $p3
                call $f41
                br $B4
              end
              block $B16
                local.get $p3
                i32.eqz
                br_if $B16
                local.get $p1
                i32.load offset=24
                local.get $l7
                i32.add
                local.get $p2
                local.get $p3
                memory.copy
              end
              local.get $p0
              i32.const 4
              i32.store8
              local.get $p1
              local.get $l7
              local.get $p3
              i32.add
              i32.store offset=28
              br $B4
            end
            block $B17
              local.get $p1
              i32.load offset=28
              local.tee $l7
              i32.eqz
              br_if $B17
              block $B18
                block $B19
                  block $B20
                    local.get $l8
                    local.get $p1
                    i32.load offset=20
                    local.get $l7
                    i32.sub
                    i32.lt_u
                    br_if $B20
                    local.get $l4
                    i32.const 8
                    i32.add
                    local.get $p1
                    i32.const 20
                    i32.add
                    local.get $p2
                    local.get $l8
                    call $f41
                    local.get $l4
                    i32.load8_u offset=8
                    i32.const 4
                    i32.eq
                    br_if $B19
                    local.get $p0
                    local.get $l4
                    i64.load offset=8
                    i64.store align=4
                    br $B4
                  end
                  block $B21
                    local.get $l8
                    i32.eqz
                    br_if $B21
                    local.get $p1
                    i32.load offset=24
                    local.get $l7
                    i32.add
                    local.get $p2
                    local.get $l8
                    memory.copy
                  end
                  local.get $p1
                  local.get $l7
                  local.get $l8
                  i32.add
                  local.tee $l7
                  i32.store offset=28
                  br $B18
                end
                local.get $p1
                i32.load offset=28
                local.set $l7
              end
              local.get $l7
              i32.eqz
              br_if $B17
              local.get $p1
              i32.const 0
              i32.store offset=28
              local.get $p1
              i32.const 0
              i32.store8 offset=32
            end
            local.get $p2
            local.get $l8
            i32.add
            local.set $p2
            block $B22
              local.get $p3
              local.get $l8
              i32.sub
              local.tee $l7
              local.get $p1
              i32.load offset=20
              i32.lt_u
              br_if $B22
              local.get $p0
              local.get $p1
              i32.const 20
              i32.add
              local.get $p2
              local.get $l7
              call $f41
              br $B4
            end
            block $B23
              local.get $l7
              i32.eqz
              br_if $B23
              local.get $p1
              i32.load offset=24
              local.get $p2
              local.get $l7
              memory.copy
            end
            local.get $p0
            i32.const 4
            i32.store8
            local.get $p1
            local.get $l7
            i32.store offset=28
          end
          local.get $p1
          local.get $p1
          i32.load offset=16
          i32.const 1
          i32.add
          i32.store offset=16
          local.get $l4
          i32.const 32
          i32.add
          global.set $g0
          return
        end
        call $f26
        unreachable
      end
      local.get $l5
      local.get $p3
      local.get $p3
      i32.const 1049332
      call $f16
      unreachable
    end
    i32.const 0
    local.get $l7
    local.get $p3
    i32.const 1049316
    call $f16
    unreachable)
  (func $f41 (type $t7) (param $p0 i32) (param $p1 i32) (param $p2 i32) (param $p3 i32)
    (local $l4 i32) (local $l5 i32)
    local.get $p1
    i32.load
    local.set $l4
    block $B0
      local.get $p1
      i32.load offset=8
      local.tee $l5
      i32.eqz
      br_if $B0
      local.get $p3
      local.get $l4
      local.get $l5
      i32.sub
      i32.le_u
      br_if $B0
      i32.const 0
      local.set $l5
      local.get $p1
      i32.const 0
      i32.store offset=8
      local.get $p1
      i32.const 0
      i32.store8 offset=12
    end
    block $B1
      local.get $p3
      local.get $l4
      i32.ge_u
      br_if $B1
      block $B2
        local.get $p3
        i32.eqz
        br_if $B2
        local.get $p1
        i32.load offset=4
        local.get $l5
        i32.add
        local.get $p2
        local.get $p3
        memory.copy
      end
      local.get $p0
      i32.const 4
      i32.store8
      local.get $p1
      local.get $l5
      local.get $p3
      i32.add
      i32.store offset=8
      return
    end
    local.get $p1
    i32.const 0
    i32.store8 offset=12
    local.get $p0
    i32.const 4
    i32.store)
  (func $f42 (type $t2) (param $p0 i32)
    (local $l1 i32) (local $l2 i32) (local $l3 i32) (local $l4 i32)
    local.get $p0
    i32.load offset=4
    local.set $l1
    block $B0
      block $B1
        block $B2
          block $B3
            block $B4
              block $B5
                local.get $p0
                i32.load8_u
                local.tee $p0
                i32.const 4
                i32.gt_u
                br_if $B5
                local.get $p0
                i32.const 3
                i32.ne
                br_if $B4
              end
              local.get $l1
              i32.load
              local.set $p0
              block $B6
                local.get $l1
                i32.const 4
                i32.add
                i32.load
                local.tee $l2
                i32.load
                local.tee $l3
                i32.eqz
                br_if $B6
                local.get $p0
                local.get $l3
                call_indirect $T0 (type $t2)
              end
              block $B7
                local.get $l2
                i32.load offset=4
                local.tee $l2
                i32.eqz
                br_if $B7
                local.get $p0
                i32.const -4
                i32.add
                i32.load
                local.tee $l3
                i32.const -8
                i32.and
                local.tee $l4
                i32.const 4
                i32.const 8
                local.get $l3
                i32.const 3
                i32.and
                local.tee $l3
                select
                local.get $l2
                i32.add
                i32.lt_u
                br_if $B3
                block $B8
                  local.get $l3
                  i32.eqz
                  br_if $B8
                  local.get $l4
                  local.get $l2
                  i32.const 39
                  i32.add
                  i32.gt_u
                  br_if $B2
                end
                local.get $p0
                call $f8
              end
              local.get $l1
              i32.const -4
              i32.add
              i32.load
              local.tee $p0
              i32.const -8
              i32.and
              local.tee $l2
              i32.const 16
              i32.const 20
              local.get $p0
              i32.const 3
              i32.and
              local.tee $p0
              select
              i32.lt_u
              br_if $B1
              block $B9
                local.get $p0
                i32.eqz
                br_if $B9
                local.get $l2
                i32.const 52
                i32.ge_u
                br_if $B0
              end
              local.get $l1
              call $f8
            end
            return
          end
          i32.const 1050840
          i32.const 1050888
          call $f12
          unreachable
        end
        i32.const 1050904
        i32.const 1050952
        call $f12
        unreachable
      end
      i32.const 1050840
      i32.const 1050888
      call $f12
      unreachable
    end
    i32.const 1050904
    i32.const 1050952
    call $f12
    unreachable)
  (func $f43 (type $t1) (param $p0 i32) (param $p1 i32) (param $p2 i32) (result i32)
    (local $l3 i32) (local $l4 i32) (local $l5 i32) (local $l6 i32) (local $l7 i32)
    global.get $g0
    i32.const 16
    i32.sub
    local.tee $l3
    global.set $g0
    local.get $l3
    i32.const 8
    i32.add
    local.get $p0
    i32.load offset=8
    i32.load
    local.get $p1
    local.get $p2
    call $f40
    block $B0
      block $B1
        block $B2
          block $B3
            block $B4
              local.get $l3
              i32.load8_u offset=8
              local.tee $p2
              i32.const 4
              i32.eq
              br_if $B4
              local.get $p0
              i32.load offset=4
              local.set $l4
              block $B5
                block $B6
                  local.get $p0
                  i32.load8_u
                  local.tee $p1
                  i32.const 4
                  i32.gt_u
                  br_if $B6
                  local.get $p1
                  i32.const 3
                  i32.ne
                  br_if $B5
                end
                local.get $l4
                i32.load
                local.set $p1
                block $B7
                  local.get $l4
                  i32.const 4
                  i32.add
                  i32.load
                  local.tee $l5
                  i32.load
                  local.tee $l6
                  i32.eqz
                  br_if $B7
                  local.get $p1
                  local.get $l6
                  call_indirect $T0 (type $t2)
                end
                block $B8
                  local.get $l5
                  i32.load offset=4
                  local.tee $l5
                  i32.eqz
                  br_if $B8
                  local.get $p1
                  i32.const -4
                  i32.add
                  i32.load
                  local.tee $l6
                  i32.const -8
                  i32.and
                  local.tee $l7
                  i32.const 4
                  i32.const 8
                  local.get $l6
                  i32.const 3
                  i32.and
                  local.tee $l6
                  select
                  local.get $l5
                  i32.add
                  i32.lt_u
                  br_if $B3
                  block $B9
                    local.get $l6
                    i32.eqz
                    br_if $B9
                    local.get $l7
                    local.get $l5
                    i32.const 39
                    i32.add
                    i32.gt_u
                    br_if $B2
                  end
                  local.get $p1
                  call $f8
                end
                local.get $l4
                i32.const -4
                i32.add
                i32.load
                local.tee $p1
                i32.const -8
                i32.and
                local.tee $l5
                i32.const 16
                i32.const 20
                local.get $p1
                i32.const 3
                i32.and
                local.tee $p1
                select
                i32.lt_u
                br_if $B1
                block $B10
                  local.get $p1
                  i32.eqz
                  br_if $B10
                  local.get $l5
                  i32.const 52
                  i32.ge_u
                  br_if $B0
                end
                local.get $l4
                call $f8
              end
              local.get $p0
              local.get $l3
              i64.load offset=8
              i64.store align=4
            end
            local.get $l3
            i32.const 16
            i32.add
            global.set $g0
            local.get $p2
            i32.const 4
            i32.ne
            return
          end
          i32.const 1050840
          i32.const 1050888
          call $f12
          unreachable
        end
        i32.const 1050904
        i32.const 1050952
        call $f12
        unreachable
      end
      i32.const 1050840
      i32.const 1050888
      call $f12
      unreachable
    end
    i32.const 1050904
    i32.const 1050952
    call $f12
    unreachable)
  (func $f44 (type $t0) (param $p0 i32) (param $p1 i32) (result i32)
    (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32) (local $l6 i32) (local $l7 i32)
    global.get $g0
    i32.const 16
    i32.sub
    local.tee $l2
    global.set $g0
    local.get $l2
    i32.const 0
    i32.store offset=4
    block $B0
      block $B1
        local.get $p1
        i32.const 128
        i32.lt_u
        br_if $B1
        local.get $p1
        i32.const 63
        i32.and
        i32.const -128
        i32.or
        local.set $l3
        local.get $p1
        i32.const 6
        i32.shr_u
        local.set $l4
        block $B2
          local.get $p1
          i32.const 2048
          i32.ge_u
          br_if $B2
          local.get $l2
          local.get $l3
          i32.store8 offset=5
          local.get $l2
          local.get $l4
          i32.const 192
          i32.or
          i32.store8 offset=4
          i32.const 2
          local.set $p1
          br $B0
        end
        local.get $p1
        i32.const 12
        i32.shr_u
        local.set $l5
        local.get $l4
        i32.const 63
        i32.and
        i32.const -128
        i32.or
        local.set $l4
        block $B3
          local.get $p1
          i32.const 65535
          i32.gt_u
          br_if $B3
          local.get $l2
          local.get $l3
          i32.store8 offset=6
          local.get $l2
          local.get $l4
          i32.store8 offset=5
          local.get $l2
          local.get $l5
          i32.const 224
          i32.or
          i32.store8 offset=4
          i32.const 3
          local.set $p1
          br $B0
        end
        local.get $l2
        local.get $l3
        i32.store8 offset=7
        local.get $l2
        local.get $l4
        i32.store8 offset=6
        local.get $l2
        local.get $l5
        i32.const 63
        i32.and
        i32.const -128
        i32.or
        i32.store8 offset=5
        local.get $l2
        local.get $p1
        i32.const 18
        i32.shr_u
        i32.const -16
        i32.or
        i32.store8 offset=4
        i32.const 4
        local.set $p1
        br $B0
      end
      local.get $l2
      local.get $p1
      i32.store8 offset=4
      i32.const 1
      local.set $p1
    end
    local.get $l2
    i32.const 8
    i32.add
    local.get $p0
    i32.load offset=8
    i32.load
    local.get $l2
    i32.const 4
    i32.add
    local.get $p1
    call $f40
    block $B4
      block $B5
        block $B6
          block $B7
            block $B8
              local.get $l2
              i32.load8_u offset=8
              local.tee $p1
              i32.const 4
              i32.eq
              br_if $B8
              local.get $p0
              i32.load offset=4
              local.set $l4
              block $B9
                block $B10
                  local.get $p0
                  i32.load8_u
                  local.tee $l3
                  i32.const 4
                  i32.gt_u
                  br_if $B10
                  local.get $l3
                  i32.const 3
                  i32.ne
                  br_if $B9
                end
                local.get $l4
                i32.load
                local.set $l3
                block $B11
                  local.get $l4
                  i32.const 4
                  i32.add
                  i32.load
                  local.tee $l5
                  i32.load
                  local.tee $l6
                  i32.eqz
                  br_if $B11
                  local.get $l3
                  local.get $l6
                  call_indirect $T0 (type $t2)
                end
                block $B12
                  local.get $l5
                  i32.load offset=4
                  local.tee $l5
                  i32.eqz
                  br_if $B12
                  local.get $l3
                  i32.const -4
                  i32.add
                  i32.load
                  local.tee $l6
                  i32.const -8
                  i32.and
                  local.tee $l7
                  i32.const 4
                  i32.const 8
                  local.get $l6
                  i32.const 3
                  i32.and
                  local.tee $l6
                  select
                  local.get $l5
                  i32.add
                  i32.lt_u
                  br_if $B7
                  block $B13
                    local.get $l6
                    i32.eqz
                    br_if $B13
                    local.get $l7
                    local.get $l5
                    i32.const 39
                    i32.add
                    i32.gt_u
                    br_if $B6
                  end
                  local.get $l3
                  call $f8
                end
                local.get $l4
                i32.const -4
                i32.add
                i32.load
                local.tee $l3
                i32.const -8
                i32.and
                local.tee $l5
                i32.const 16
                i32.const 20
                local.get $l3
                i32.const 3
                i32.and
                local.tee $l3
                select
                i32.lt_u
                br_if $B5
                block $B14
                  local.get $l3
                  i32.eqz
                  br_if $B14
                  local.get $l5
                  i32.const 52
                  i32.ge_u
                  br_if $B4
                end
                local.get $l4
                call $f8
              end
              local.get $p0
              local.get $l2
              i64.load offset=8
              i64.store align=4
            end
            local.get $l2
            i32.const 16
            i32.add
            global.set $g0
            local.get $p1
            i32.const 4
            i32.ne
            return
          end
          i32.const 1050840
          i32.const 1050888
          call $f12
          unreachable
        end
        i32.const 1050904
        i32.const 1050952
        call $f12
        unreachable
      end
      i32.const 1050840
      i32.const 1050888
      call $f12
      unreachable
    end
    i32.const 1050904
    i32.const 1050952
    call $f12
    unreachable)
  (func $f45 (type $t0) (param $p0 i32) (param $p1 i32) (result i32)
    (local $l2 i32)
    global.get $g0
    i32.const 16
    i32.sub
    local.tee $l2
    global.set $g0
    block $B0
      local.get $p1
      i32.load offset=4
      br_table $B0 $B0 $B0
    end
    local.get $p0
    i32.const 1049628
    local.get $p1
    call $f6
    local.set $p1
    local.get $l2
    i32.const 16
    i32.add
    global.set $g0
    local.get $p1)
  (table $T0 17 17 funcref)
  (memory $memory 17)
  (global $g0 (mut i32) (i32.const 1048576))
  (global $__data_end i32 (i32.const 1051856))
  (global $__heap_base i32 (i32.const 1051856))
  (export "memory" (memory $memory))
  (export "f" (func $f))
  (export "main" (func $main))
  (export "__data_end" (global $__data_end))
  (export "__heap_base" (global $__heap_base))
  (elem $e0 (i32.const 1) func $f0 $f13 $f14 $f1 $f39 $f20 $f24 $f25 $f28 $f29 $f37 $f42 $f43 $f44 $f45 $f38)
  (data $d0 (i32.const 1048576) "\0a\00\00\00\01\00\00\00\00\00\00\00\00\00\10\00\01\00\00\000xfalsetrue000102030405060708091011121314151617181920212223242526272829303132333435363738394041424344454647484950515253545556575859606162636465666768697071727374757677787980818283848586878889909192939495969798990123456789abcdef0123456789ABCDEFrange end index  out of range for slice of length \00\00\00\07\01\10\00\10\00\00\00\17\01\10\00\22\00\00\00slice index starts at  but ends at \00L\01\10\00\16\00\00\00b\01\10\00\0d\00\00\00range start index \00\00\80\01\10\00\12\00\00\00\17\01\10\00\22\00\00\00library/std/src/sys/sync/mutex/no_threads.rs\00library/core/src/slice/memchr.rs\00library/std/src/io/stdio.rs\00library/std/src/io/buffered/linewritershim.rs\00library/std/src/sync/reentrant_lock.rs\00library/std/src/sync/once.rs\00library/std/src/io/mod.rs\00library/std/src/thread/mod.rs\00/rust/deps/dlmalloc-0.2.10/src/dlmalloc.rs\00\00\d1\01\10\00 \00\00\00\a0\00\00\00\09\00\00\00\d1\01\10\00 \00\00\00\84\00\00\00\1e\00\00\00==assertion `left  right` failed\0a  left: \0a right: \00\00\06\03\10\00\10\00\00\00\16\03\10\00\17\00\00\00-\03\10\00\09\00\00\00 right` failed: \0a  left: \00\00\00\06\03\10\00\10\00\00\00P\03\10\00\10\00\00\00`\03\10\00\09\00\00\00-\03\10\00\09\00\00\00RefCell already borrowed\01\00\00\00\00\00\00\00: a formatting trait implementation returned an error when the underlying stream did not\ae\03\10\00V\00\00\00\80\02\10\00\19\00\00\00\88\02\00\00\11\00\00\00\0c\00\00\00\0c\00\00\00\04\00\00\00\0d\00\00\00\0e\00\00\00\0f\00\00\00entity not foundpermission deniedconnection refusedconnection resethost unreachablenetwork unreachableconnection abortednot connectedaddress in useaddress not availablenetwork downbroken pipeentity already existsoperation would blocknot a directoryis a directorydirectory not emptyread-only filesystem or storage mediumfilesystem loop or indirection limit (e.g. symlink loop)stale network file handleinvalid input parameterinvalid datatimed outwrite zerono storage spaceseek on unseekable filequota exceededfile too largeresource busyexecutable file busydeadlockcross-device link or renametoo many linksinvalid filenameargument list too longoperation interruptedunsupportedunexpected end of fileout of memoryin progressother erroruncategorized errormid > len\00\00!\07\10\00\09\00\00\00stdoutfailed printing to \00\00\00:\07\10\00\13\00\00\00\ac\03\10\00\02\00\00\00\f2\01\10\00\1b\00\00\00\8d\04\00\00\09\00\00\00operation successfulone-time initialization may not be performed recursively\84\07\10\008\00\00\00cannot recursively acquire mutex\c4\07\10\00 \00\00\00\a4\01\10\00,\00\00\00\13\00\00\00\09\00\00\00lock count overflow in reentrant mutex\00\00<\02\10\00&\00\00\00#\01\00\00-\00\00\00c\02\10\00\1c\00\00\00\d9\00\00\00\14\00\00\00failed to generate unique thread ID: bitspace exhausted\00D\08\10\007\00\00\00\9a\02\10\00\1d\00\00\00\d6\04\00\00\0d\00\00\00\00\00\00\00\04\00\00\00\04\00\00\00\10\00\00\00 (os error )\01\00\00\00\00\00\00\00\a4\08\10\00\0b\00\00\00\af\08\10\00\01\00\00\00\f2\01\10\00\1b\00\00\00\5c\03\00\00\14\00\00\00assertion failed: psize >= size + min_overhead\00\00\b8\02\10\00*\00\00\00\b1\04\00\00\09\00\00\00assertion failed: psize <= size + max_overhead\00\00\b8\02\10\00*\00\00\00\b7\04\00\00\0d\00\00\00\0e\02\10\00-\00\00\00\16\01\00\00)\00\00\00\10\00\00\00\11\00\00\00\12\00\00\00\10\00\00\00\10\00\00\00\13\00\00\00\12\00\00\00\0d\00\00\00\0e\00\00\00\15\00\00\00\0c\00\00\00\0b\00\00\00\15\00\00\00\15\00\00\00\0f\00\00\00\0e\00\00\00\13\00\00\00&\00\00\008\00\00\00\19\00\00\00\17\00\00\00\0c\00\00\00\09\00\00\00\0a\00\00\00\10\00\00\00\17\00\00\00\0e\00\00\00\0e\00\00\00\0d\00\00\00\14\00\00\00\08\00\00\00\1b\00\00\00\0e\00\00\00\10\00\00\00\16\00\00\00\15\00\00\00\0b\00\00\00\16\00\00\00\0d\00\00\00\0b\00\00\00\0b\00\00\00\13\00\00\004\04\10\00D\04\10\00U\04\10\00g\04\10\00w\04\10\00\87\04\10\00\9a\04\10\00\ac\04\10\00\b9\04\10\00\c7\04\10\00\dc\04\10\00\e8\04\10\00\f3\04\10\00\08\05\10\00\1d\05\10\00,\05\10\00:\05\10\00M\05\10\00s\05\10\00\ab\05\10\00\c4\05\10\00\db\05\10\00\e7\05\10\00\f0\05\10\00\fa\05\10\00\0a\06\10\00!\06\10\00/\06\10\00=\06\10\00J\06\10\00^\06\10\00f\06\10\00\81\06\10\00\8f\06\10\00\9f\06\10\00\b5\06\10\00\ca\06\10\00\d5\06\10\00\eb\06\10\00\f8\06\10\00\03\07\10\00\0e\07\10\00"))
