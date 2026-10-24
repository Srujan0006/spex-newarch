# Per-path post-route timing of the new_arch 6x4 harden (adapted from experiments/rtl_spike/sta_paths.tcl).
# the harden, once per corner:  CORNER=slow|typ|fast openroad -exit -no_splash hardcaml/spex/harden/sta_paths.tcl
#   (fetch) the record macros' clock-to-output into the beat registers; (address) EVAL into the record macros' address
#   and enables; (coverage) both directions at u_cov; (pins) into the registers driving the output pins; overall worst
#   setup and hold; slew / capacitance / fanout violators
set pdk $::env(PDK_ROOT)/ihp-sg13cmos5l/libs.ref
array set std  {slow slow_1p08V_125C typ typ_1p20V_25C fast fast_1p32V_m40C}
array set sram {slow slow_1p08V_125C typ typ_1p20V_25C fast fast_1p32V_m55C}
set c $::env(CORNER)
read_liberty $pdk/sg13cmos5l_stdcell/lib/sg13cmos5l_stdcell_$std($c).lib
read_liberty $pdk/sg13cmos5l_sram/lib/RM_IHPSG13_1P_256x64_c2_bm_bist_$sram($c).lib
read_liberty $pdk/sg13cmos5l_sram/lib/RM_IHPSG13_1P_256x32_c2_bm_bist_$sram($c).lib
# the newest database at or after detailed routing (final/ if the flow finished; otherwise the last step's), and the
# newest extracted parasitics: timing is reported even when routing left violations (owner, 2026-10-23)
proc step_no {d} { if {[regexp {/([0-9]+)-[^/]+/} $d -> n]} { return [scan $n %d] } else { return 9999 } }
proc by_step {files} { return [lsort -command {apply {{a b} {expr {[step_no $a] - [step_no $b]}}}} $files] }
set odbs [glob -nocomplain runs/wokwi/final/odb/*.odb]
if {![llength $odbs]} {
    set odbs [by_step [glob -nocomplain runs/wokwi/*/*.odb]]
    set odbs [list [lindex $odbs end]]
}
puts "database: [lindex $odbs 0]"
read_db [lindex $odbs 0]
set spef [glob -nocomplain runs/wokwi/final/spef/nom*/*.spef]
if {![llength $spef]} { set spef [by_step [glob -nocomplain runs/wokwi/*-openroad-rcx/nom*/*.spef runs/wokwi/*-openroad-rcx/*.nom*.spef]] }
if {[llength $spef]} { puts "parasitics: [lindex $spef end]"; read_spef [lindex $spef end] } else { puts "WARNING: no extracted parasitics, wire load only" }
set sdc [glob -nocomplain runs/wokwi/final/sdc/*.sdc]
if {![llength $sdc]} { set sdc [by_step [glob -nocomplain runs/wokwi/*/*.sdc]] }
read_sdc [lindex $sdc end]
set_propagated_clock [all_clocks]

set rec [get_cells {u_rec0 u_rec1}]
set cov [get_cells u_cov]
set fields {slew cap fanout}
# each group on its own: a -from/-to over all three macros reports one worst path (run 40074901833: u_cov to u_cov
# for both), which hides the record-store paths
puts "\n==================== corner $c: (fetch) record macros clock-to-output -> beat registers"
report_checks -from $rec -path_delay max -fields $fields -digits 3
puts "\n==================== corner $c: (address) EVAL guards -> priority -> next location -> record macro address / enables"
report_checks -to $rec -path_delay max -fields $fields -digits 3
puts "\n==================== corner $c: (coverage) u_cov read -> merge -> u_cov write"
report_checks -from $cov -path_delay max -fields $fields -digits 3
puts "\n==================== corner $c: (coverage) -> u_cov address / enables / data"
report_checks -to $cov -path_delay max -fields $fields -digits 3
puts "\n==================== corner $c: (pins) -> registers driving uo_out / uio_out / uio_oe"
# the outputs go through output buffers, so walk back from each port through single-input cells to the flop that
# drives it (OpenROAD has no all_fanin)
set regs {}
foreach port [get_ports {uo_out[*] uio_out[*] uio_oe[*]}] {
    set net [get_nets -quiet [get_full_name $port]]
    for {set hop 0} {$hop < 6 && $net ne ""} {incr hop} {
        set drv [get_pins -quiet -of_objects $net -filter "direction == output"]
        if {$drv eq ""} { break }
        set cell [get_cells -of_objects [lindex $drv 0]]
        if {[regexp {df|dl|RM_IHPSG13} [get_property $cell ref_name]]} { lappend regs [get_full_name $cell]; break }
        set ins [get_pins -quiet -of_objects $cell -filter "direction == input"]
        if {[llength $ins] != 1} { break }
        set net [get_nets -quiet -of_objects [lindex $ins 0]]
    }
}
set regs [lsort -unique $regs]
puts "pin registers: [llength $regs]"
if {[llength $regs]} { report_checks -to [get_cells $regs] -path_delay max -fields $fields -digits 3 }
puts "\n==================== corner $c: overall worst setup path (any group)"
report_checks -path_delay max -fields $fields -digits 3
puts "\n==================== corner $c: overall worst hold path (any group)"
report_checks -path_delay min -fields $fields -digits 3
puts "\n==================== corner $c: summary"
report_worst_slack -max -digits 3
report_worst_slack -min -digits 3
report_tns -digits 3
report_check_types -max_slew -max_capacitance -violators
# max fanout: the clock tree's leaf buffers drive 15-16 flops against the SDC's signal limit of 8; count the rest
report_check_types -max_fanout -violators > fanout_$c.rpt
set f [open fanout_$c.rpt]
set fo 0
foreach line [split [read $f] "\n"] {
    if {[regexp {VIOLATED} $line] && ![regexp {^clkbuf_} [string trim $line]]} { incr fo }
}
close $f
puts "max fanout violators outside the clock tree: $fo"
