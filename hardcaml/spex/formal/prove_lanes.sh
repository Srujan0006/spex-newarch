#!/bin/sh
# usage: formal/prove_lanes.sh [VERILOG]   prove the bit-lane properties L1-L3, L5 of
# lane_props.sv (unbounded) on ../out/spex_lane.v (or VERILOG), one group per run.
# L1, L3: one TX lane (lane_tx_props); L2: TX -> RX loopback (lane_loop_props); L5: one
# RX lane, skip and length field (lane_len_props).
# L1 uses ABC PDR. L2, L3 and L5 use k-induction (yosys-smtbmc with yices): a BMC base case
# and an induction step of depth K; their helper lemmas make them K-inductive (PDR did not
# finish L2/L3 in 30 minutes, L5 in 15). L4 (pin source select) is on the core, in prove.sh.
# T = limit per group in seconds; PROPS = the groups to run (default: all).
# BMC=<depth>: instead, search for a counterexample to the properties alone (the lemmas
# left out, -DNO_LEMMAS) up to that depth: for the mutant runs of formal/vacuity.py.
set -e
cd "$(dirname "$0")"
V=${1:-../out/spex_lane.v}
for g in ${PROPS:-L1 L3 L2 L5 L6}; do
  case $g in L2) TOP=lane_loop_props; K=6 ;; L3) TOP=lane_tx_props; K=12 ;; L5) TOP=lane_len_props; K=${K5:-12} ;; L6) TOP=lane_len_props; K=${K6:-12} ;; *) TOP=lane_tx_props ;; esac
  printf "%-11s " "$g"
  if [ -n "$BMC" ]; then
    yosys -q -p "read_verilog -formal $V; expose spex_lane/g_*; read_verilog -sv -formal -D$g -DNO_LEMMAS lane_props.sv; prep -top $TOP; flatten; async2sync; dffunmap; opt_clean; setundef -undriven -anyseq; write_smt2 -wires model_$g.smt2"
    r=$(timeout ${T:-900} yosys-smtbmc -s yices -t $BMC model_$g.smt2 | grep -E "Checking assertions in step|Assert failed|Status" | tail -3 | tr '\n' ' ')
    # a BMC that runs to the end prints "Status: PASSED"; anything else is a time-out
    case "$r" in *FAILED*) echo "counterexample: $r" ;; *PASSED*) echo "no counterexample to depth $BMC" ;;
      *) echo "TIMED OUT before depth $BMC (${T:-900} s; last: $r)" ;; esac
  elif [ $g = L1 ]; then
    yosys -q -p "read_verilog -formal $V; expose spex_lane/g_*; read_verilog -sv -formal -D$g lane_props.sv; prep -top $TOP; flatten; async2sync; dffunmap; opt_clean; setundef -undriven -anyseq; opt -fast -nosdff -nodffe; techmap; opt -fast -nosdff -nodffe; dffunmap; abc -g AND; opt_clean; write_aiger -zinit model_$g.aig"
    yosys-abc -c "read_aiger model_$g.aig; fold; strash; pdr -T ${T:-900}" 2>&1 | grep -E "Property proved|asserted|Output .* was asserted|failed|UNDECIDED" | tail -1
  else
    yosys -q -p "read_verilog -formal $V; expose spex_lane/g_*; read_verilog -sv -formal -D$g lane_props.sv; prep -top $TOP; flatten; async2sync; dffunmap; opt_clean; setundef -undriven -anyseq; write_smt2 -wires model_$g.smt2"
    base=$(timeout ${T:-900} yosys-smtbmc -s yices -t $K model_$g.smt2 | grep -E "Status|Assert failed" | tr '\n' ' ')
    step=$(timeout ${T:-900} yosys-smtbmc -s yices -i -t $K model_$g.smt2 | grep -E "Status|Assert failed" | tr '\n' ' ')
    case "$base$step" in
      *FAILED*) echo "FAILED: base [$base] induction [$step]" ;;
      *PASSED*PASSED*) echo "Property proved (k-induction, k = $K)" ;;
      *) echo "UNDECIDED: base [$base] induction [$step]" ;;
    esac
  fi
done
