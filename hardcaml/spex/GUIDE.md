# SPEX in Hardcaml: instructor's guide for Claude Code

**Who this is for.** A Claude Code session running on srujan's machine (Windows with
WSL), working in this folder. srujan is designing a chip for the first time. You are
the instructor: you run the steps, explain each result in plain words, and only move
on when the checkpoint passes.

**What already exists.** A working SPEX engine in Hardcaml with a spec compiler, a
reference model, protocol tests (UART, SPI, I2C), random lockstep tests, generated
Verilog that matches the Hardcaml simulation, a synthesis estimate and a mutation
test. Part A reproduces all of that on this machine. Part B builds what is missing
for the competition entry.

**Read first:** `ENGINE.md` (exact behaviour, cycle by cycle) and `CHANGES.md` (what
changed from the architecture draft and why).

---

## Rules for the instructor

1. **One step at a time.** Run the step, show the output, explain what it proves in two
   or three sentences, then go on. If a checkpoint fails, stop and fix it before
   anything else.
2. **Never accept a changed expect output without explaining it.** `dune promote`
   rewrites the expected output in the test file. Before promoting, read the diff with
   srujan and say why the new output is right. A diff you can't explain is a bug.
3. **The model and the RTL stay independent.** `src/model.ml` must never call
   `src/engine.ml`. If both need a change, write the change in `ENGINE.md` first, then
   change each one separately. The lockstep test is only worth something because the
   two were written apart.
4. **Every new feature gets three things:** a line in `ENGINE.md`, a directed test, and
   a mutant in `mutation/mutate.py` that the tests kill.
5. **Measure, don't guess.** After any RTL change re-run the Verilog replay (Step 4)
   and the synthesis (Step 5) and write the new numbers into `CHANGES.md`.
6. **Keep a log.** Append one line per finished step to `PROGRESS.md` (date, step,
   result, numbers), so the next session can pick up.
7. **Explain words the first time you use them**: flop, combinational, cycle,
   synchroniser, expect test, lockstep, mutant, synthesis, gate level, harden.

---

## Map of the code

| File | What it is | Read it when |
|---|---|---|
| `src/layout.ml` | The 512-bit location record: header and edge fields, op codes. Single source of truth for the encoding. | First |
| `src/spec.ml` | The spec DSL (`loc`, `edge`, `falls`, `at`, `set`, `send_bit` …), the compiler to records, the decoder and a listing printer. | Second |
| `src/protocols.ml` | Example specs: UART TX and RX, SPI controller mode 0, I2C controller write. This is the chip's "firmware". | Third |
| `src/engine.ml` | The RTL: synchroniser, FETCH/EVAL phases, guard evaluation, actions, FIFOs, violation log, coverage pipeline, SRAM ports. `Top` adds behavioural RAMs for simulation. | Fourth |
| `src/model.ml` | The reference model in plain OCaml, written from `ENGINE.md`. | With the engine |
| `test/harness.ml` | Runs the Hardcaml simulation and the model together and compares every output every cycle. | Before the tests |
| `test/test_*.ml` | Expect tests: UART, SPI and I2C, the Stress and Cover roles, random lockstep, a waveform. | Each in turn |
| `test/vectors/vectors.ml` | Records test vectors and writes a Verilog testbench. | Step 4 |
| `bin/gen.ml` | Writes the generated Verilog. | Step 4 |
| `synth/` | Yosys scripts, approximate IHP cell library, path tracer. | Step 5 |
| `mutation/mutate.py` | Mutation test of the RTL. | Step 6 |

---

## Part A: reproduce the proof

### Step 1. Install the tools

In WSL (Ubuntu):

```sh
sudo apt-get update
sudo apt-get install -y opam iverilog yosys build-essential m4 pkg-config libgmp-dev python3
opam init -y --disable-sandboxing
opam switch create spex ocaml-base-compiler.5.2.1
eval $(opam env --switch=spex)
opam install -y dune hardcaml.v0.17.0 ppx_hardcaml.v0.17.0 hardcaml_waveterm.v0.17.0 ppx_jane ppx_expect stdio
```

Hardcaml v0.17.1 needs OCaml 5.3; v0.17.0 works on 5.2 and is what this code was
tested with. If you choose OCaml 5.3 and v0.17.1, re-run every checkpoint.

**Checkpoint 1:** `opam list hardcaml` shows `v0.17.0`, and `iverilog -V` and `yosys -V` both print versions.

> Note for the cloud sandbox only: there, opam.ocaml.org was blocked and package
> sources had to be rewritten to `git+https://github.com/...` URLs. On a normal
> machine none of that is needed.

### Step 2. Build and run every test

```sh
cd hardcaml/spex          # this folder
dune build
dune test                 # silent = every expect test matches
```

**Checkpoint 2:** `dune test` prints nothing and exits 0. It takes about 15 seconds.

Then walk srujan through what the tests show. Open each file and read the
`[%expect]` blocks together:

| Test | What it proves |
|---|---|
| `test_uart.ml` "UART TX, 16 cycles per bit" | The engine sends 5 bytes; a separate software decoder reads them back; every pin interval is a whole number of bits. |
| "UART TX at 115200 baud" | Same at a real rate: 347 cycles per bit at 40 MHz, "SPEX" decoded. |
| "UART RX in Drive role" | The receiver spec decodes 5 bytes driven by the testbench. |
| "UART Check role" | The same RX spec, watching a line it does not drive, logs a framing error as TIMEOUT and a glitch as UNEXPECTED **at the exact cycle predicted by hand**, recovers and keeps decoding. The pins were never driven. |
| `test_spi_i2c.ml` SPI | Mode-0 controller: 4 bytes out and 4 bytes back from a software SPI target; every SCK half period inside a byte is exactly 8 cycles. |
| I2C write | START, address, 3 data bytes, every byte ACKed, STOP, decoded by a software I2C target. |
| I2C clock stretching | The target holds SCL low for 300 cycles; the engine waits. |
| I2C NACK | Nobody at the address: TIMEOUT in `ack_hi`, recovery, STOP. |
| `test_roles.ml` Stress | One UART spec with a 32 ± 4 window: Drive gives 28-cycle bits, Stress at_hi 36, Stress random spreads over 28..36. |
| Cover | Count and min/max clock per edge after 3 bytes: counts are exactly 3, 3, 3 and 24. |
| Clock saturation | Added after mutation testing (Step 6). |
| `test_lockstep.ml` | 300 random specs × 3,000 cycles with random pins and host traffic in all roles: the RTL and the model agree on every output on every one of 900,000 cycles. |
| `test_wave.ml` | A waveform of one UART frame, for reading the engine phases. |

Every test runs through the harness, so **every test is also a lockstep test**
against the model.

### Step 3. Read the engine with a waveform

Open `test/test_wave.ml`'s expect block. Point out: `cur_loc` goes 0 → 1 → 2 → 0
(idle, data, stop); `in_entry` is high for 5 cycles after each change of location;
there is no entry on the data → data self-loop; `pins_out` is the TX line.

Exercise for srujan: change the byte from `0xA5` to `0x0F`, run `dune test`, and
predict the new waveform before looking at the diff. Then undo it.

### Step 4. Generate Verilog and replay the tests on it

```sh
dune exec bin/gen.exe -- out
./_build/default/test/vectors/vectors.exe $PWD/out
cd out && iverilog -g2012 -o simv tb.v spex_sim_top.v && vvp -n simv; cd ..
```

**Checkpoint 4:** `PASS: generated Verilog matches Hardcaml on 89015 cycles`.

What it proves: the Verilog file the chip flow will read behaves exactly like the
Hardcaml simulation that all the tests used, cycle by cycle, on every output.

To show the testbench is not blind: edit one number in `out/vectors.txt`, run `vvp`
again, see `FAIL`, then regenerate.

### Step 5. Synthesis estimate

```sh
cd synth
yosys -q -l synth.log synth.ys; grep -E "Chip area|  DFF " synth.log | tail -2
yosys -q path.ys; python3 lp.py | head -1
cd ..
```

**Checkpoint 5:** about 126,000 µm² (0.126 mm²), 1,340 DFF, depth 37.

Explain: the cell areas in `mini.lib` are approximations of the IHP library, there
is no placement and no wires, so this is a ranking tool, not the final number.
Gate 1 from the architecture (engine ≤ 0.15 mm²) passes. Depth 37 is the same as
the earlier probe that reached 49.8 MHz at the slow corner after layout.

### Step 6. Mutation test

```sh
python3 mutation/mutate.py
```

**Checkpoint 6:** every mutant KILLED (22/22). Results go to `mutation/results.md`.

Explain: each mutant is one deliberate bug in the RTL. A survivor means the tests
can't see that bug. The first run here had one survivor (clocks that wrap instead of
saturating, visible only after 65,536 cycles). The fix was a new directed test, not
a change to the RTL. That's how this step should be used.

**End of Part A.** Write the numbers into `PROGRESS.md`.

---

## Part B: build the rest of the entry

Do these in order. Each has a goal, notes, and an acceptance test. Rules 3 to 5
apply to every step.

### Step 7. Settle the encoding budget

The edge record has no spare bits (see `CHANGES.md`). Before adding features,
decide where these go, and write the decision into `CHANGES.md`:

- a per-location clock prescaler (header has 2 spare bits: ÷1, ÷8, ÷64, ÷512);
- bit-lane commands (new data-op codes or a lane-op field);
- lane flags (flag codes 8..15 are already reserved for them).

**Accept:** `Layout` widths still sum to 64 and 112 (or a new documented record
size), all tests pass.

### Step 8. I2C read and I2C target

- Controller read: after the address byte with R/W = 1, the controller releases SDA,
  shifts in 8 bits (`rx shift_msb`), ACKs all but the last byte, pushes each byte.
- Target: watch for START (`falls sda` while `pin_hi scl`), shift in the address,
  compare with flag 7 (`addr_match`, address in the `match_addr` input), ACK by
  pulling SDA during the 9th clock, then receive or send data.

**Accept:** new tests against a software I2C controller and target in the testbench,
at 100 kHz and 400 kHz, including a STOP in the middle of a byte (should be
UNEXPECTED or a clean recovery, your choice, documented).

### Step 9. SPI target, modes 0 to 3

The target follows SCK edges (`rises sck` / `falls sck` guards). Because entry takes 5
cycles, two SCK edges closer than ~6 cycles apart can't be followed. Measure the
fastest SCK the spec passes at, and write it into `CHANGES.md` (the draft guessed
2 to 3 MHz). Keep each bit inside one location (self-loops have no entry cost)
where you can.

**Accept:** all four modes at the measured top speed and at 1 MHz; a test at a speed
just above the limit shows a violation, not silent corruption.

### Step 10. Host port and Tiny Tapeout top

Build the host SPI port from the architecture: mode-0 target on `ui[0..2]`/`uo[0]`,
command byte + 16-bit address + data, spaces 0 to 5 (CSRs, location store, coverage,
violation log, TX FIFO, RX FIFO). It drives the `Host_in` ports of the core. Then a
`tt_um_srujan_spex` top with the pin map (IRQ on `uo[1]`, VIOL pulse on `uo[2]`,
ENTRY on `uo[3]`, debug mux on `uo[4..7]`, protocol pins on `uio`), and the
Tiny Tapeout `ena`, `clk`, `rst_n` (clear = not `rst_n`).

Write a host-side loader (OCaml or Python) that takes a compiled spec and produces the
SPI byte stream, plus a CRC over the location store.

**Accept:** a test that loads the UART spec through the SPI port only, sends bytes
through the TX FIFO over SPI, and decodes them on `uio[0]`. Reuse the dtc_spi cocotb
harness on the generated Verilog for the same test.

### Step 11. Bit lanes

Implement the lane from `architecture/area-probe/bit_lane.v` in Hardcaml (fractional
divider with edge resync, NRZ/NRZI/Manchester, stuffing, CRC up to 32, sync match),
the lane flags, and pin source select. Give the lane its own small reference model
and lockstep test, like the engine.

**Accept:** one protocol the engine can't do alone, end to end: CAN frames with
stuffing and CRC-15, or USB low-speed NRZI with bit stuffing and CRC5/CRC16.

### Step 12. Formal properties

Run SymbiYosys on the generated Verilog. Properties to prove (k-induction):

1. At most one edge is taken per cycle, and it is the lowest-index true edge.
2. In Check role `pins_oe` never changes after start.
3. No pin change is lost: a change on a watched pin either fires an edge or logs
   UNEXPECTED, including changes during FETCH.
4. TIMEOUT is logged exactly on the first cycle the clock passes `inv_hi`, once per
   visit.
5. FIFO counters stay in range; coverage counts saturate.

**Accept:** all proofs pass; each property also fails on at least one mutant from
`mutation/mutate.py` (to show it isn't vacuous).

### Step 13. Harden (Gate 2)

Use the Tiny Tapeout CMOS5L template, `info.yaml` at 6x4, the two 1P_256x64 macros for
the location store and the 1P_256x32 for coverage, placed as in the architecture
floorplan (record macros on opposite long edges, pins facing the middle). Run it in
GitHub Actions or locally.

**Accept (Gate 2):** routes with 0 DRC, precheck passes, slow-corner timing ≥ 40 MHz.
Then re-run the vector replay on the post-layout netlist (gate-level simulation).

### Step 14. Write-ups for the submission

Architecture and instruction set (from `ENGINE.md` and `layout.ml`), the spec language
and compiler, the example specs, the verification write-up (the layers in Part A and
Steps 12 and 13, and what each one would miss), and how AI was used.

---

## Troubleshooting

| Symptom | Likely cause |
|---|---|
| `RTL and model disagree (cycle N)` | A real bug in one of them, or `ENGINE.md` is ambiguous. Print both output sets (the error already does), find the first differing field, decide which side matches `ENGINE.md`. |
| `run_until: limit reached` | The engine is stuck in a location. Print `cur_loc` each cycle: a loop of `H.cycle t` that prints `(List.nth_exn spec.locs loc).name` whenever the location changes. Often an edge whose window was missed; the compiler's auto-invariant turns most of these into a TIMEOUT. |
| `field out of range` from `Spec.compile` | A spec value doesn't fit its field (for example a window over 65,535 cycles: use a prescaler or a counted loop). |
| `opam install` fails on hardcaml v0.17.1 | It needs OCaml 5.3. Use v0.17.0 on 5.2. |
| Verilog replay FAIL | The vectors and the Verilog are from different builds. Re-run Step 4 from the top. |
