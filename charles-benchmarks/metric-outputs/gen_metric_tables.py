"""Generate the rows of the two program tables from the merged metrics CSVs.

Usage: python gen_program_tables.py metrics/program.csv metrics/k_curve.csv

Prints two blocks of LaTeX rows (call graph table, dominator tree table) to paste
between \\midrule and \\bottomrule, or to \\input from a file.
"""

import sys
from os import listdir
import pandas as pd
from os.path import isfile, join


program_path = sys.argv[1]
all_csv_files = [f for f in listdir(program_path) if isfile(join(program_path, f)) and f.find('csv') != -1]

all_heights_files = [f for f in all_csv_files if f.find('_heights') != -1]
all_functions_files = [f for f in all_csv_files if f.find('_functions') != -1]
all_program_files = [f for f in all_csv_files if f.find('_') == -1]

all_program_files.sort()

program_infos = 0

for program in all_program_files:
    info = pd.read_csv(program)
    info['program'] = program.split('/')[-1].split('.')[0]
    if isinstance(program_infos, pd.DataFrame):
        program_infos = pd.concat([program_infos, info])
    else:
        program_infos = info

print(program_infos)

def name(p: str) -> str:
    return r'\texttt{' + p.replace('_', r'\_') + '}'


def pct(x: float) -> str:
    return f"{100 * x:.1f}"


def rows(cells_per_row):
    out = []
    for i, cells in enumerate(cells_per_row):
        if i > 0 and i % 5 == 0:
            out.append(r'    \addlinespace')
        out.append('    ' + ' & '.join(cells) + r' \\')
    return '\n'.join(out)


callgraph = [
    [
        name(r.program),
        str(r.functions),
        str(r.imports),
        str(r.call_edges),
        str(r.entry_points),
        pct(r.leaves),
        str(r.call_graph_depth),
        str(r.median_body_size),
    ]
    for r in program_infos.itertuples()
]


print('% --- Table 1: call graph ---')
print(rows(callgraph))
print()
