# Analysig WebAssembly Call Graphs

## Usage

To build the call-graph wassail is needed in your PATH, since the binary calls wassail directly.
Checkout their instructions on https://github.com/acieroid/wassail.

```bash
# Execute
$ cargo run --bin call-graph-analysis <INPUT>             \
    --output <OUTPUT>     (Output file ("-" or omitted = stdout) [default: -]) \
    --metric <METRIC>...  ([default: all] [possible values: all, in-edges, out-edges, depth, dominator-depth])
```
