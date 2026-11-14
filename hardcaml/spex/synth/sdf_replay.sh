#!/usr/bin/env bash
# Delay-annotated replay of the routed netlist (review F5): out/tb_chip.v's vectors on the
# post-layout netlist with cell, SRAM and wire delays from OpenSTA (routed SPEF) at one
# corner, one inertial delay per cell output (synth/sdf_delays.py: Icarus 12's own SDF
# annotator aborts on this netlist). Inputs change at the falling clock edge and the
# outputs are compared at the next falling edge, as in the zero-delay replay.
# usage: synth/sdf_replay.sh NETLIST SPEF CORNER HALF_PERIOD_NS [LIB]
#   LIB: an IHP-Open-PDK checkout (rev 2bbec755, as the harden) holding the liberty files;
#   default $IHP_LIB. Works in $WORK (default /tmp/sdf_replay). slow / typ take the max
#   over each output's paths (setup side), fast the min (hold side).
# Planted bug: the slow corner at a 5 ns half period (100 MHz) must FAIL.
set -euo pipefail
NL=$(realpath "$1"); SPEF=$(realpath "$2"); C=$3; HP=$4; LIB=$(realpath "${5:-$IHP_LIB}")
HERE=$(cd "$(dirname "$0")/.." && pwd)
WORK=${WORK:-/tmp/sdf_replay}; mkdir -p "$WORK"
ST=$HOME/pdk/ihp/ihp-sg13cmos5l/libs.ref/sg13cmos5l_stdcell/verilog
SR=$HOME/pdk/ihp/ihp-sg13g2/libs.ref/sg13g2_sram/verilog
LIB=$LIB CORNER=$C NL=$NL SPEF=$SPEF OUT=$WORK/$C.sdf sta -exit "$HERE/synth/write_sdf.tcl" > "$WORK/sta_$C.log" 2>&1
python3 "$HERE/synth/gl_cells.py" "$ST/sg13cmos5l_stdcell.v" "$WORK/cells_func.v" > /dev/null
python3 "$HERE/synth/sdf_delays.py" $([ "$C" = fast ] && echo --min) "$WORK/$C.sdf" "$NL" \
    "$WORK/models_$C.v" "$WORK/nl_$C.v" "$WORK/cells_func.v" \
    "$SR/RM_IHPSG13_1P_256x64_c2_bm_bist.v" "$SR/RM_IHPSG13_1P_256x32_c2_bm_bist.v"
sed -e 's/task tick; begin #5 clk = 1; #5 clk = 0; end endtask/task tick; begin #(`HP) clk = 1; #(`HP) clk = 0; end endtask/' \
    -e 's/\.i_SRAM_1P_behavioral_bm_bist/.c.i_SRAM_1P_behavioral_bm_bist/g' "$HERE/out/tb_chip.v" > "$WORK/tb_dly.v"
iverilog -g2012 -DFUNCTIONAL -DHP="$HP" -o "$WORK/simv_$C" "$WORK/tb_dly.v" "$WORK/nl_$C.v" "$WORK/models_$C.v" \
    "$ST"/*udp*.v "$SR/RM_IHPSG13_1P_core_behavioral_bm_bist.v"
vvp -n "$WORK/simv_$C"
