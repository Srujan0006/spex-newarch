# SPEX engine semantics (v0.1)

This is the behaviour both the RTL (`src/engine.ml`) and the reference model
(`src/model.ml`) implement. If the two disagree on any output on any cycle, the
test harness stops with the cycle number and both output sets.

## State

| State | Width | Notes |
|---|---|---|
| `sync1`, `pins_s`, `pins_q` | 8 each | 2-flop synchroniser, then the previous value for change detection |
| phase | IDLE, FETCH(beat 0..4), EVAL | |
| `cur_loc` | 6 | current location |
| role | 2 | latched at start: 0 Drive, 1 Check, 2 Stress |
| active record | 512 | 4 beat registers of 128 bits |
| `changed` | 8 | pin changes latched during FETCH |
| change ages | 8 x 3 | how long ago each latched change was seen |
| clocks c0, c1, c2 | 3 x 16 | saturate at 0xFFFF |
| timestamp | 32 | free running from reset |
| `pout`, `poe` | 8 each | pin output value and enable registers |
| `tx_sr`, `rx_sr`, `cnt` | 8 each | data path |
| LFSR | 16 | reset value 0xACE1, taps 16, 14, 13, 11 |
| TX FIFO, RX FIFO | 8 x 8 | |
| violation log | 8 x 48 | `{timestamp 32, loc 6, kind 2, pins 8}` |
| coverage | 256 x 32 SRAM | `{count 8, min 12, max 12}` per `{loc, edge}` |

## Each cycle

Let `chg_now = pins_s xor pins_q` and `changed_all = changed | chg_now`.

**FETCH beat b** (b = 0..4). For b < 4 the location store is read at
`{cur_loc, b}`. The word read in beat b arrives in beat b + 1 and is stored as record
beat b. `changed` accumulates `changed_all`. On beat 4 the **entry action** runs (from
the header, which arrived in beat 1) and the phase becomes EVAL. Entry therefore
takes 5 cycles in which no edge can fire.

**EVAL.** For each edge k = 0..3:

```
fire_k = valid
       & ((pins_s xor pin_val) & pin_mask) == 0          pin levels
       & (chg_mask == 0 | (changed_all & chg_mask) != 0)  pin change
       & lo <= clock[clk] <= hi                            timing window
       & flag[flag_sel] xor flag_inv                       data flag
       & stress_ok                                         Stress role only
```

The lowest k with `fire_k` wins. If an edge wins, its action runs. If its target is
the current location it is an internal transition: no fetch, no entry action, and
evaluation continues next cycle. Otherwise the phase becomes FETCH(0) at the target.

If no edge fires:

- **UNEXPECTED** if `changed_all & watch != 0`;
- **TIMEOUT** if the invariant is enabled, `clock[inv_clk] > inv_hi`, and no TIMEOUT
  has been logged in this visit. Any taken edge re-arms it.

A violation is pushed into the log and pulses `viol` the next cycle. Then the
policy: 0 halt (IDLE, `halted_viol` set), 1 continue, 2 jump to the host's
`recover_loc` (with a fetch), 3 halt. `changed` and the ages are cleared in every
EVAL cycle.

The timestamp logged for UNEXPECTED is the cycle the synchronised change was first
seen (`pins_s` changed), even when it was seen during FETCH. For TIMEOUT it is the
first cycle the clock is past `inv_hi`.

## Actions

An action (entry action or edge action) does, in this order of reading:

- **Clocks**: each clock in `clk_reset` reads 0 on the next cycle; others count up.
- **Pins** (Drive and Stress roles only): for pins in `drive_mask`, `pout = out_val`,
  `poe = out_oe`. If `tx_pin_en`, pin `tx_pin` is set to the old `tx_sr[0]` and
  enabled. In Check role the pin registers never change.
- **tx_op**: 1 load from TX FIFO, 2 load bit-reversed, 3 shift right filling with 1.
  A load from an empty FIFO gives 0xFF.
- **rx_op** (edges only): 1 shift in `pins_s[rx_pin]` at the MSB (LSB-first data),
  2 shift in at the LSB (MSB-first data), 3 push `rx_sr` into the RX FIFO.
- **cnt_op**: 1 decrement, 2 load 7, 3 load 8.

Entry actions cannot send a bit or touch `rx_sr` (no room in the header).

Data flags: 0 true, 1 `cnt == 0`, 2 `tx_sr[0]`, 3 `rx_sr[0]`, 4 TX FIFO empty,
5 RX FIFO full, 6 `lfsr[0]`, 7 `rx_sr[7:1] == match_addr[6:0]`, 8..15 read 0
(reserved for the bit lanes).

Stress role, per edge: 0 fire as soon as the guard holds, 1 only when the clock
equals `lo`, 2 only when it equals `hi`, 3 each cycle with probability 1/16
(`lfsr[3:0] == 0`) and always at `hi`. Clock select 3 reads clock 2.

## Pins

Output stage: for open-drain pins (host mask) the pad is driven low when
`pout = 0` and `poe = 1`, and released otherwise.

Reaction time: a pin change at the pad is seen 2 cycles later (`pins_s`); an edge that
fires on it changes `pout` the cycle after. Pad to pad: 3 cycles plus the output pad.

## Coverage

With `cover_en`, every taken edge updates `{cur_loc, edge}` in a 1-port SRAM:
count + 1 (saturating at 255), and min/max of the edge's clock value (saturated to
12 bits). The update is a read in stage S1 and a merged write in S2. If an edge fires
while S1 is busy: the same address is merged, a different address is dropped and
`cov_overrun` is set.

## Host side (core ports)

`start` (role, `start_loc`), `stop`; location-store and coverage writes are ignored
while running; TX push, RX pop, log pop. `irq` = RX not empty, or log not empty, or
halted on violation, or an entry with `irq_on_entry` since the last `irq_ack`. FIFO
heads are only defined when the FIFO is not empty.
