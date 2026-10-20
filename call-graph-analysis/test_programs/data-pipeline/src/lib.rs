// src/lib.rs
#![allow(clippy::all)]
#[unsafe(no_mangle)]
pub extern "C" fn run_pipeline(input: u32) -> u32 {
    let stage1 = step_one(input);
    let stage2 = step_two(stage1);
    let stage3 = step_three(stage2);
    finalize_pipeline(stage3)
}
#[inline(never)]
fn step_one(val: u32) -> u32 {
    if validate_step(val, 1) {
        val.wrapping_add(10)
    } else {
        0
    }
}
#[inline(never)]
fn step_two(val: u32) -> u32 {
    if val == 0 {
        fallback_transform(5)
    } else {
        multiply_stage(val, 2)
    }
}
#[inline(never)]
fn step_three(val: u32) -> u32 {
    let adjusted = shift_bits(val);
    normalize_value(adjusted)
}
#[inline(never)]
fn finalize_pipeline(val: u32) -> u32 {
    if check_threshold(val) { val } else { 0 }
}
#[inline(never)]
fn validate_step(val: u32, id: u32) -> bool {
    (val + id) % 2 == 0 || val < 500
}
#[inline(never)]
fn fallback_transform(val: u32) -> u32 {
    val.wrapping_mul(100)
}
#[inline(never)]
fn multiply_stage(val: u32, factor: u32) -> u32 {
    val.wrapping_mul(factor)
}
#[inline(never)]
fn shift_bits(val: u32) -> u32 {
    val >> 1
}
#[inline(never)]
fn normalize_value(val: u32) -> u32 {
    if val > 1000 { 1000 } else { val }
}
#[inline(never)]
fn check_threshold(val: u32) -> bool {
    val > 5
}
#[inline(never)]
#[unsafe(no_mangle)]
pub extern "C" fn inspect_pipeline(input: u32) -> u32 {
    let res = run_pipeline(input);
    audit_result(res)
}
#[inline(never)]
fn audit_result(val: u32) -> u32 {
    if val > 0 { 1 } else { 0 }
}
