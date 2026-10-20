// src/lib.rs
#![allow(clippy::all)]
#[unsafe(no_mangle)]
pub extern "C" fn parse_token(input: u32) -> u32 {
    let state = init_state(input);
    process_state_machine(state)
}
#[inline(never)]
fn init_state(val: u32) -> u32 {
    if val > 100 { 1 } else { 0 }
}
#[inline(never)]
fn process_state_machine(mut state: u32) -> u32 {
    let mut steps = 0;
    while state != 99 && steps < 10 {
        state = transition(state, steps);
        steps += 1;
    }
    finalize_state(state)
}
#[inline(never)]
fn transition(current: u32, step: u32) -> u32 {
    match current {
        0 => handle_zero(step),
        1 => handle_one(step),
        _ => 99,
    }
}
#[inline(never)]
fn handle_zero(step: u32) -> u32 {
    if step % 2 == 0 { 1 } else { 2 }
}
#[inline(never)]
fn handle_one(step: u32) -> u32 {
    if step > 5 { 99 } else { 0 }
}
#[inline(never)]
fn finalize_state(final_val: u32) -> u32 {
    if final_val == 99 { 1 } else { 0 }
}

#[unsafe(no_mangle)]
pub extern "C" fn validate_stream(ptr: u32, len: u32) -> u32 {
    let checked = check_bounds(ptr, len);
    if checked {
        compute_checksum(ptr, len)
    } else {
        0
    }
}
#[inline(never)]
fn check_bounds(ptr: u32, len: u32) -> bool {
    ptr > 0 && len < 1024
}
#[inline(never)]
fn compute_checksum(ptr: u32, len: u32) -> u32 {
    let mut sum = 0;
    let mut i = 0;
    while i < len {
        sum = accumulate(sum, ptr + i);
        i += 1;
    }
    sum
}
#[inline(never)]
fn accumulate(current: u32, val: u32) -> u32 {
    (current.wrapping_add(val)) ^ 0x55
}
