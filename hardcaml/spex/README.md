# SPEX in Hardcaml

SPEX is a protocol-emulator engine for the Jane Street ASIC competition (IHP 130 nm,
Tiny Tapeout 6x4). It runs a protocol **spec** (a timed automaton) instead of a
program, and the same spec works in three roles: **Drive** a bus, **Check** another
device against the spec with exact violation timestamps, and **Stress** its timing
windows; **Cover** (edge counts and timing margins) can be switched on in any role.

| Start here | |
|---|---|
| [GUIDE.md](GUIDE.md) | Step-by-step guide for a Claude Code session: reproduce the proof, then build the rest |
| [ENGINE.md](ENGINE.md) | Exact cycle-by-cycle behaviour of the engine |
| [CHANGES.md](CHANGES.md) | What changed from the architecture draft, and the measurements |
| [PROGRESS.md](PROGRESS.md) | Log of finished steps |

```sh
eval $(opam env --switch=spex)
dune build && dune test                    # all expect tests, all in lockstep with the model
dune exec bin/gen.exe -- out               # generated Verilog
./_build/default/test/vectors/vectors.exe $PWD/out && (cd out && iverilog -g2012 -o simv tb.v spex_sim_top.v && vvp -n simv)
python3 mutation/mutate.py                 # mutation test of the RTL
formal/prove.sh                            # formal proofs (Yosys + ABC PDR) on out/spex_core.v
formal/prove_lanes.sh                      # bit-lane proofs L1-L3 on out/spex_lane.v
python3 formal/vacuity.py                  # each property must fail on a mutant
# chip-level replay through the pins (vectors.exe writes out/tb_chip.v), with the IHP SRAM
# models; for the gate-level replay replace spex_chip.v and project.v by the routed netlist
# and add the sg13cmos5l stdcell models (+ -DUSE_POWER_PINS for a powered netlist)
(cd out && iverilog -g2012 -DFUNCTIONAL -o simv_chip tb_chip.v ../harden/src/project.v spex_chip.v \
   $SRAM/RM_IHPSG13_1P_256x64_c2_bm_bist.v $SRAM/RM_IHPSG13_1P_256x32_c2_bm_bist.v \
   $SRAM/RM_IHPSG13_1P_core_behavioral_bm_bist.v && vvp -n simv_chip)
#   SRAM=<IHP-Open-PDK 2bbec755>/ihp-sg13g2/libs.ref/sg13g2_sram/verilog
```

`out/` holds the generated Verilog (`spex_core.v`, `spex_sim_top.v`) from this run.
