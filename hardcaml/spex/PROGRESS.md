# Progress log

| Date | Step | Result |
|---|---|---|
| 2026-10-24 | Build SPEX v0.1 in Hardcaml (cloud session) | Engine, spec compiler, reference model, UART/SPI/I2C specs |
| 2026-10-24 | A2 tests | All expect tests pass; every test in lockstep with the model; 300 random specs x 3,000 cycles, no mismatch |
| 2026-10-24 | A4 Verilog replay | PASS on 89,015 cycles (Icarus 12) |
| 2026-10-24 | A5 synthesis | 0.126 mm², 8,651 cells, 1,340 DFF, depth 37 (Yosys 0.33, mini.lib) |
| 2026-10-24 | A6 mutation | 22/22 killed (first pass 19/20; clock-saturation test added) |
| 2026-10-24 | A1 tools (srujan's WSL) | opam 2.1.5, OCaml 5.2.1 switch `spex`, hardcaml v0.17.0; Icarus Verilog 12.0; Yosys 0.33 |
| 2026-10-24 | A2 tests (srujan's WSL) | `dune build` OK; `dune test` silent, exit 0, 13 s; 13 expect tests; model.ml does not call engine.ml (one mention, in a comment) |
| 2026-10-24 | A3 waveform | cur_loc 0 → 1 → 2 → 0; in_entry 5 cycles per location change; no entry inside the data self-loop; TX shows start, 0xA5 LSB first, stop |
| 2026-10-24 | A4 Verilog replay (srujan's WSL) | PASS on 89,015 cycles; one corrupted vector gives FAIL: 1 mismatches |
| 2026-10-24 | A5 synthesis (srujan's WSL) | 126,252 µm², 1,340 DFF, depth 37 (Yosys 0.33, mini.lib): matches |
| 2026-10-24 | A6 mutation (srujan's WSL) | 22/22 killed, 2 min 14 s |
| 2026-10-24 | IHP liberty synthesis | **119,951 µm², 1,340 DFF** on sg13cmos5l_stdcell_typ_1p20V_25C.lib (yowasp-yosys 0.70, `synth -flatten; dfflibmap; abc; stat`, the SPEX v1 probes' script): `synth/ihp/ihp_typ.ys` |
| 2026-10-24 | 6x4 harden (private repo, run 40077932994) | **Routes: 0 violations, 0 max-cap, 0 max-slew, hold met. Worst setup slack at 20.8 ns: +6.952 slow / +12.013 typ / +14.161 fast ns = 72.2 / 113.8 / 150.6 MHz.** Utilisation 0.436. LVS, Magic and precheck not run |
| 2026-10-24 | 6x4 sign-off (private repo, run 40079086558) | **LVS clean (0 errors), precheck passed (all checks), 0 DRC, 0 antenna, IR drop 0.10 mV**; timing unchanged; stdcell 222,796 µm², utilisation 0.508; Magic warns 222 illegal overlaps (not a failure, cause unchecked) |
