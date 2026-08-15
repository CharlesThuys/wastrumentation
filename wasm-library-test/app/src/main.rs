use test_library::library_calculation;

#[inline(never)]
fn application_calculation(value: i32) -> i32 {
    library_calculation(value) * 2
}

fn main() {
    let result = application_calculation(10);

    let mut buffer = itoa::Buffer::new();
    let formatted = buffer.format(result);

    println!("Result: {formatted}");
}
