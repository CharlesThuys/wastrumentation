fn main() {
    for i in 0..10 {
        f(i,i);
    } 
}

fn f(a: i32, b: i32) {
    println!("Hello, world! {} {}", a, b);
}
