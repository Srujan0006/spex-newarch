#!/bin/sh
# usage: formal/prove.sh [VERILOG]   prove every property with ABC PDR (unbounded)
# on ../out/spex_core.v (or VERILOG). Runs the general set and the Check-role set.
set -e
cd "$(dirname "$0")"
V=${1:-../out/spex_core.v}
for cfg in "" "-DCHECK_ROLE"; do
  yosys -q -p "read_verilog -formal $V; expose spex_core/f_*; read_verilog -sv -formal $cfg spex_props.sv; prep -top spex_props; flatten; async2sync; dffunmap; opt_clean; setundef -undriven -anyseq; opt -fast -nosdff -nodffe; techmap; opt -fast -nosdff -nodffe; dffunmap; abc -g AND; opt_clean; write_aiger -zinit model.aig"
  printf "%-14s " "${cfg:-general}"
  yosys-abc -c "read_aiger model.aig; fold; strash; pdr -T 300" 2>&1 | grep -E "Property proved|asserted|Output .* was asserted|failed|UNDECIDED" | tail -1
done
