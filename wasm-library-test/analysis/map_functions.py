#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import argparse
import json
import os
import re
import subprocess
from pathlib import Path
from collections import Counter

FUNC_HEADER_RE = re.compile(
    r'^=+\s+func\s+(\d+)\s+=+$'
)

OFFSET_RE = re.compile(
    r'^\s*(0x[0-9a-fA-F]+)\s+\|.*\|\s+(.*)$'
)


# ----------------------------------------------------------------------
# Generic command runner
# ----------------------------------------------------------------------

def run(command, cwd=None, env=None):
    result = subprocess.run(
        command,
        cwd=cwd,
        env=env,
        text=True,
        capture_output=True,
        check=True,
    )

    return result.stdout


# ----------------------------------------------------------------------
# 1. Cargo metadata
# ----------------------------------------------------------------------

def load_cargo_metadata(manifest_path):
    output = run([
        'cargo',
        'metadata',
        '--format-version',
        '1',
        '--manifest-path',
        str(manifest_path),
    ])

    return json.loads(output)


def load_cargo_packages(metadata):
    packages = []

    for package in metadata['packages']:
        manifest_path = Path(package['manifest_path']).resolve()

        packages.append({
            'id': package['id'],
            'name': package['name'],
            'version': package['version'],
            'root': manifest_path.parent,
        })

    # If roots overlap, try most specific path first.
    packages.sort(
        key=lambda package: len(str(package['root'])),
        reverse=True,
    )

    return packages


# ----------------------------------------------------------------------
# 2. Find the executable target
# ----------------------------------------------------------------------

def find_binary_target(metadata):
    """
    Find binary targets belonging to this workspace.

    For our current test:
        app          -> bin
        test-library -> lib

    so this should automatically select app.
    """

    workspace_members = set(metadata['workspace_members'])

    binary_targets = []

    for package in metadata['packages']:
        if package['id'] not in workspace_members:
            continue

        for target in package['targets']:
            if 'bin' in target['kind']:
                binary_targets.append({
                    'package': package['name'],
                    'package_id': package['id'],
                    'target': target['name'],
                })

    if len(binary_targets) == 0:
        raise RuntimeError(
            'No binary target found in the Cargo workspace.'
        )

    if len(binary_targets) > 1:
        choices = '\n'.join(
            f"  {target['package']}::{target['target']}"
            for target in binary_targets
        )

        raise RuntimeError(
            'More than one binary target was found:\n'
            f"{choices}\n\n"
            'The prototype currently expects exactly one binary.'
        )

    return binary_targets[0]


# ----------------------------------------------------------------------
# 3. Build the WebAssembly binary with DWARF
# ----------------------------------------------------------------------

def build_wasm(manifest_path, binary_target):
    print(
        f"Building {binary_target['package']} "
        f"for wasm32-wasip1..."
    )

    env = os.environ.copy()

    # Force debuginfo for the entire build, including dependencies.
    #
    # Preserve existing RUSTFLAGS if the user already has some.
    old_rustflags = env.get('RUSTFLAGS', '')
    dwarf_flag = '-C debuginfo=2'

    env['RUSTFLAGS'] = (
        f"{old_rustflags} {dwarf_flag}".strip()
    )

    # Do not strip custom/debug sections in the dev build.
    env['CARGO_PROFILE_DEV_STRIP'] = 'none'

    command = [
        'cargo',
        'build',
        '--manifest-path',
        str(manifest_path),
        '--target',
        'wasm32-wasip1',
        '--package',
        binary_target['package'],
        '--bin',
        binary_target['target'],
        '--message-format=json-render-diagnostics',
    ]

    result = subprocess.run(
        command,
        env=env,
        text=True,
        capture_output=True,
        check=True,
    )

    wasm_file = None

    # Cargo tells us exactly which executable it generated, so we don't
    # need to guess paths such as target/wasm32-wasip1/debug/app.wasm.
    for line in result.stdout.splitlines():
        try:
            message = json.loads(line)
        except json.JSONDecodeError:
            continue

        if message.get('reason') != 'compiler-artifact':
            continue

        target = message.get('target', {})

        if target.get('name') != binary_target['target']:
            continue

        if 'bin' not in target.get('kind', []):
            continue

        executable = message.get('executable')

        if executable and executable.endswith('.wasm'):
            wasm_file = Path(executable).resolve()

    if wasm_file is None:
        raise RuntimeError(
            'Cargo completed successfully, but I could not '
            'find the generated .wasm binary.'
        )

    print(f"Generated WebAssembly: {wasm_file}")

    return wasm_file


# ----------------------------------------------------------------------
# 4. Verify that the binary actually contains DWARF
# ----------------------------------------------------------------------

def verify_dwarf(wasm_file):
    output = run([
        'wasm-tools',
        'objdump',
        str(wasm_file),
    ])

    required_sections = [
        '.debug_info',
        '.debug_line',
    ]

    missing = [
        section
        for section in required_sections
        if section not in output
    ]

    if missing:
        raise RuntimeError(
            'Generated WebAssembly does not contain the '
            'required DWARF sections: '
            + ', '.join(missing)
        )

    print('DWARF information found:')
    print('  .debug_info')
    print('  .debug_line')


# ----------------------------------------------------------------------
# 5. Extract function -> instruction offsets
# ----------------------------------------------------------------------

def load_function_offsets(wasm_file):
    output = run([
        'wasm-tools',
        'dump',
        str(wasm_file),
    ])

    functions = {}

    current_function = None

    for line in output.splitlines():
        header = FUNC_HEADER_RE.match(line)

        if header:
            current_function = int(header.group(1))
            functions[current_function] = []
            continue

        if current_function is None:
            continue

        match = OFFSET_RE.match(line)

        if not match:
            continue

        offset = match.group(1)
        description = match.group(2).strip()

        # These are binary records associated with the function,
        # but they aren't executable Wasm instructions.
        if description.startswith('size of function'):
            continue

        if 'local blocks' in description:
            continue

        if 'locals of type' in description:
            continue

        functions[current_function].append(offset)

    return functions


# ----------------------------------------------------------------------
# 6. DWARF: instruction offset -> source location
# ----------------------------------------------------------------------

def addr2line(wasm_file, offsets):
    if not offsets:
        return []

    output = run([
        'wasm-tools',
        'addr2line',
        str(wasm_file),
        *offsets,
    ])

    locations = []

    for line in output.splitlines():
        line = line.strip()

        if not line:
            continue

        if ': ' not in line:
            continue

        offset, rest = line.split(': ', 1)

        try:
            before_line, line_number, column = rest.rsplit(':', 2)
        except ValueError:
            continue

        try:
            function_name, source_file = before_line.rsplit(' ', 1)
        except ValueError:
            continue

        try:
            line_number = int(line_number)
            column = int(column)
        except ValueError:
            continue

        locations.append({
            'offset': offset,
            'function_name': function_name,
            'source': source_file,
            'line': line_number,
            'column': column,
        })

    return locations


# ----------------------------------------------------------------------
# 7. Source file -> Cargo package
# ----------------------------------------------------------------------

def package_for_source(source_file, packages):
    source_path = Path(source_file)

    if not source_path.is_absolute():
        return None

    # Do not require the source file itself to exist.
    #
    # DWARF paths can refer to sources that are no longer present.
    source_path = Path(
        os.path.normpath(str(source_path))
    )

    for package in packages:
        root = package['root']

        try:
            source_path.relative_to(root)

            return {
                'name': package['name'],
                'version': package['version'],
            }

        except ValueError:
            continue

    return None


# ----------------------------------------------------------------------
# 8. Classify a Wasm function
# ----------------------------------------------------------------------

def classify_function(locations, packages):
    source_files = sorted({
        location['source']
        for location in locations
    })

    source_packages = {}

    for source in source_files:
        source_packages[source] = package_for_source(
            source,
            packages,
        )

    known_packages = {
        (
            package['name'],
            package['version'],
        )
        for package in source_packages.values()
        if package is not None
    }

    unknown_sources = [
        source
        for source, package in source_packages.items()
        if package is None
    ]

    if len(known_packages) == 1 and not unknown_sources:
        classification = 'package'

        package_name, package_version = next(
            iter(known_packages)
        )

    elif len(known_packages) > 1:
        classification = 'mixed'
        package_name = None
        package_version = None

    else:
        classification = 'unknown'
        package_name = None
        package_version = None

    function_names = sorted({
        location['function_name']
        for location in locations
    })

    return {
        'classification': classification,
        'package': package_name,
        'package_version': package_version,
        'function_names': function_names,
        'sources': source_files,
        'source_packages': source_packages,
    }


# ----------------------------------------------------------------------
# 9. Main analysis
# ----------------------------------------------------------------------

def main():
    parser = argparse.ArgumentParser(
        description=(
            'Build a Cargo project as WebAssembly with DWARF and '
            'map Wasm functions back to Cargo packages.'
        )
    )

    parser.add_argument(
        'cargo',
        type=Path,
        help=(
            'Cargo project directory or path to Cargo.toml'
        ),
    )

    parser.add_argument(
        '--output',
        type=Path,
        default=Path('function-map.json'),
    )

    args = parser.parse_args()

    # Allow:
    #
    #   python map_functions.py .
    #
    # and:
    #
    #   python map_functions.py ./Cargo.toml

    if args.cargo.is_dir():
        manifest_path = args.cargo / 'Cargo.toml'
    else:
        manifest_path = args.cargo

    manifest_path = manifest_path.resolve()

    if not manifest_path.exists():
        raise RuntimeError(
            f"Cargo manifest does not exist: {manifest_path}"
        )

    # --------------------------------------------------
    # Cargo structure
    # --------------------------------------------------

    print('Reading Cargo metadata...')

    metadata = load_cargo_metadata(manifest_path)

    packages = load_cargo_packages(metadata)

    print(f"Found {len(packages)} Cargo packages")

    # --------------------------------------------------
    # Determine what program to build
    # --------------------------------------------------

    binary_target = find_binary_target(metadata)

    print(
        'Selected executable: '
        f"{binary_target['package']}::"
        f"{binary_target['target']}"
    )

    # --------------------------------------------------
    # Build original Wasm + DWARF
    # --------------------------------------------------

    wasm_file = build_wasm(
        manifest_path,
        binary_target,
    )

    verify_dwarf(wasm_file)

    # --------------------------------------------------
    # Find Wasm functions
    # --------------------------------------------------

    print('Reading Wasm function bodies...')

    functions = load_function_offsets(wasm_file)

    print(
        f"Found {len(functions)} defined Wasm functions"
    )

    # --------------------------------------------------
    # Perform provenance analysis
    # --------------------------------------------------

    result = {
        'wasm': str(wasm_file),
        'binary': binary_target,
        'functions': {},
    }

    for function_index, offsets in functions.items():
        print(
            f"Function {function_index}: "
            f"{len(offsets)} instruction offsets"
        )

        locations = addr2line(
            wasm_file,
            offsets,
        )

        classification = classify_function(
            locations,
            packages,
        )

        # result["functions"][str(function_index)] = {
        #     **classification,
        #     "locations": locations,
        # }

        result['functions'][str(function_index)] = classification

    # --------------------------------------------------
    # Save analysis result
    # --------------------------------------------------

    output_file = args.output.resolve()

    output_file.write_text(
        json.dumps(
            result,
            indent=2,
        )
    )

    package_counts = Counter()
    mixed_count = 0
    unknown_count = 0

    print()
    print(f"Wrote analysis to:")
    print(f"  {output_file}")
    for function in result['functions'].values():
        classification = function['classification']

        if classification == 'package':
            package_counts[function['package']] += 1
        elif classification == 'mixed':
            mixed_count += 1
        else:
            unknown_count += 1

    print()
    print('Function provenance summary')
    print('---------------------------')

    for package, count in package_counts.most_common():
        print(f"{package:30} {count:5}")

    print(f"{'MIXED':30} {mixed_count:5}")
    print(f"{'UNKNOWN':30} {unknown_count:5}")


if __name__ == '__main__':
    main()
