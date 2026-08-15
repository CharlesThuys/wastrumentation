#[inline(never)]
pub fn multiply_by_three(value: i32) -> i32 {
    value * 3
}

#[inline(never)]
pub fn add_seven(value: i32) -> i32 {
    value + 7
}

#[inline(never)]
pub fn library_calculation(value: i32) -> i32 {
    let value = multiply_by_three(value);
    add_seven(value)
}
