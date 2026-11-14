# SPEX: a chip that executes protocol specifications

An entry for the [Jane Street protocol emulator ASIC competition](https://blog.janestreet.com/protocol-emulator-asic-competition/): Tiny Tapeout, IHP SG13CMOS5L, 8x4 tiles, deadline 2027-01-18.

SPEX does not run a program. It runs a **timed-automaton specification** of the protocol: locations, clocks, timing windows and pin events. The same spec runs in four roles:

| Role | What the chip does |
|---|---|
| Drive | plays the controller or the target |
| Check | watches a bus and flags timing or sequence violations, with a timestamp and the spec state |
| Stress | drives at the earliest, latest, random or swept edge of every legal timing window |
| Cover | records which spec transitions a device exercised, and the minimum and maximum measured timing of each |

The engine is checked against an independent reference model on every cycle of every test, and formal proofs on the RTL hold for every spec that could be loaded (the SRAM contents are free in the proofs). The v1 specs were model-checked with TChecker; the new_arch specs are not yet.

**Status (2026-11-14):** the new_arch engine (Hardcaml, `hardcaml/spex/`) hardens at 8x4: LVS clean, 0 DRC, Tiny Tapeout precheck 9/9, 56.0 MHz at the slow corner, and the routed netlist matches the Hardcaml simulation through the chip's pins. Details and evidence: `hardcaml/spex/PROGRESS.md`; the submission draft is `hardcaml/spex/docs/submission-draft.md`.

## Start here

- `hardcaml/spex/README.md`: the new_arch engine (build, tests, proofs, harden).
- `hardcaml/spex/ENGINE.md`: its cycle-by-cycle semantics.
- `docs/SEMANTICS.md`, `docs/DECISIONS.md`: the v1 semantics and decision log.

## Layout

This repo lives at `~/JaneStreet/SPEX`, next to the earlier PIO-style entry (DTC) in `~/JaneStreet/PIO`.

```
hardcaml/spex/           new_arch engine (Hardcaml): RTL, model, tests, formal, harden (current design)
v1/                      SPEX v1 Python work: spex/ (dsl, compiler, decoder, refsim, tchecker, host),
                         spec/, tests/ (model/, oracles/), scripts/, tb/, formal/, pyproject.toml
docs/                    SEMANTICS, DECISIONS, CLAIMS, BUGS, HELDOUT, notes/
experiments/             area_probe/ (Yosys sketches), macro_floorplan/, rtl_spike/
src/ test/ info.yaml     Tiny Tapeout harness (ttihp-verilog-template@cmos5l)
.github/                 CI: newarch_harden (hardcaml/spex/harden), model and tchecker (v1/)
```

v1 tests: `cd v1 && python3 -B -m pytest -q`. new_arch: `hardcaml/spex/README.md`.

## Licence

Apache-2.0.
