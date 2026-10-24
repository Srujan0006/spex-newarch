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
```

`out/` holds the generated Verilog (`spex_core.v`, `spex_sim_top.v`) from this run.
