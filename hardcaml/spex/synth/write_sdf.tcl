# OpenSTA: SDF of the routed netlist at one corner, for synth/sdf_replay.sh.
# env: LIB (an IHP-Open-PDK checkout with the liberty files), CORNER slow|typ|fast, NL, SPEF, OUT
set lib $::env(LIB)
set c $::env(CORNER)
array set std  {slow slow_1p08V_125C typ typ_1p20V_25C fast fast_1p32V_m40C}
array set sram {slow slow_1p08V_125C typ typ_1p20V_25C fast fast_1p32V_m55C}
read_liberty $lib/ihp-sg13cmos5l/libs.ref/sg13cmos5l_stdcell/lib/sg13cmos5l_stdcell_$std($c).lib
read_liberty $lib/ihp-sg13g2/libs.ref/sg13g2_sram/lib/RM_IHPSG13_1P_256x64_c2_bm_bist_$sram($c).lib
read_liberty $lib/ihp-sg13g2/libs.ref/sg13g2_sram/lib/RM_IHPSG13_1P_256x32_c2_bm_bist_$sram($c).lib
read_verilog $::env(NL)
link_design tt_um_srujan0006_newarch
read_spef $::env(SPEF)
create_clock -name clk -period [expr 1000.0/59.6] [get_ports clk]
set_propagated_clock [all_clocks]
write_sdf -divider . -no_timestamp $::env(OUT)
