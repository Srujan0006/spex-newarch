#!/bin/sh
# usage: formal/prove.sh [VERILOG]   prove every property with ABC PDR (unbounded) on
# ../out/spex_core.v (or VERILOG), one property group per run (each block in
# spex_props.sv is guarded by `ifdef P<n>`), so each proof sees only its own cone. P2 is
# the Check-role run (P2 takes about 7 minutes). T = PDR limit per group in seconds.
set -e
cd "$(dirname "$0")"
V=${1:-../out/spex_core.v}
for g in P1 P3 P4 P5 P6 P7 P8 P9 P10 P11 CHECK_ROLE; do
  yosys -q -p "read_verilog -formal $V; expose spex_core/f_*; read_verilog -sv -formal -D$g spex_props.sv; prep -top spex_props; flatten; async2sync; dffunmap; opt_clean; setundef -undriven -anyseq; opt -fast -nosdff -nodffe; techmap; opt -fast -nosdff -nodffe; dffunmap; abc -g AND; opt_clean; write_aiger -zinit model.aig"
  printf "%-11s " "$g"
  yosys-abc -c "read_aiger model.aig; fold; strash; pdr -T ${T:-900}" 2>&1 | grep -E "Property proved|asserted|Output .* was asserted|failed|UNDECIDED" | tail -1
done
