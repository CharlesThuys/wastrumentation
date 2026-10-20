// src/lib.rs
#![allow(clippy::all)]
#[unsafe(no_mangle)]
pub extern "C" fn evaluate_expression(code: u32) -> i32 {
    let ast_node = parse_ast(code);
    eval_node(&ast_node, 0)
}

struct Node {
    kind: u32,
    lhs: u32,
    rhs: u32,
}
#[inline(never)]
fn parse_ast(code: u32) -> Node {
    // Simulated parser mapping code to a simple AST node
    Node {
        kind: code % 4,
        lhs: code.wrapping_mul(3) % 10,
        rhs: code.wrapping_div(2) % 10,
    }
}
#[inline(never)]
fn eval_node(node: &Node, depth: u32) -> i32 {
    if depth > 5 {
        return 0; // Guard against infinite recursion in analysis
    }

    match node.kind {
        0 => eval_literal(node.lhs),
        1 => eval_add(node, depth),
        2 => eval_sub(node, depth),
        _ => eval_fallback(node.lhs, node.rhs),
    }
}
#[inline(never)]
fn eval_literal(val: u32) -> i32 {
    val as i32
}
#[inline(never)]
fn eval_add(node: &Node, depth: u32) -> i32 {
    let left_val = recursive_fetch(node.lhs, depth);
    let right_val = recursive_fetch(node.rhs, depth);
    left_val + right_val
}
#[inline(never)]
fn eval_sub(node: &Node, depth: u32) -> i32 {
    let left_val = recursive_fetch(node.lhs, depth);
    let right_val = recursive_fetch(node.rhs, depth);
    left_val - right_val
}
#[inline(never)]
fn eval_fallback(a: u32, b: u32) -> i32 {
    if a > b {
        intensity_modifier(a)
    } else {
        intensity_modifier(b)
    }
}
#[inline(never)]
fn recursive_fetch(sub_key: u32, depth: u32) -> i32 {
    let dummy_node = Node {
        kind: sub_key % 2,
        lhs: sub_key,
        rhs: 1,
    };
    eval_node(&dummy_node, depth + 1)
}
#[inline(never)]
fn intensity_modifier(val: u32) -> i32 {
    (val as i32) * 2
}

#[unsafe(no_mangle)]
pub extern "C" fn optimize_and_run(code: u32) -> i32 {
    let preprocessed = preprocess_code(code);
    if preprocessed > 0 {
        evaluate_expression(preprocessed)
    } else {
        -1
    }
}
#[inline(never)]
fn preprocess_code(val: u32) -> u32 {
    if val == 0 { 1 } else { val }
}
