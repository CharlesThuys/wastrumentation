#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define directories
INPUT_DIR="charles-benchmarks/input-programs/wasm-r3-bench"
OUTPUT_DIR="charles-benchmarks/metric-outputs"

# Ensure the output directory exists
mkdir -p "$OUTPUT_DIR"

echo "Scanning '$INPUT_DIR' for .wasm files..."

# Loop through all .wasm files in the directory
for wasm_path in "$INPUT_DIR"/*.wasm; do
    # Check if any .wasm files actually matched the glob pattern
    [ -e "$wasm_path" ] || { echo "No .wasm files found!"; exit 1; }

    # Extract just the filename without path or extension (e.g., "bullet")
    filename=$(basename "$wasm_path" .wasm)

    echo "----------------------------------------"
    echo "Processing: $filename"
    echo "----------------------------------------"

    # Run the cargo command dynamically substituting the input and output paths
    cargo run --bin call-graph-analysis metrics "$wasm_path" --output "$OUTPUT_DIR/${filename}.csv"
done

echo "----------------------------------------"
echo "All files processed successfully! Outputs saved to $OUTPUT_DIR/"
