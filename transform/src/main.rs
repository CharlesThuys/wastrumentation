use std::fs;
use std::io::Write;

fn main() -> std::io::Result<()> {
    // Read the file containing the textual byte array
    let text = fs::read_to_string("testoutput.txt")?;

    // Remove brackets and whitespace, then split by commas
    let bytes: Vec<u8> = text
        .trim_matches(|c| c == '[' || c == ']')
        .split(',')
        .map(|s| s.trim().parse::<u8>().expect("Invalid byte"))
        .collect();

    // Write the bytes to a WASM file
    let mut file = fs::File::create("testoutput.wasm")?;
    file.write_all(&bytes)?;

    println!("Binary WASM file written successfully!");
    Ok(())
}