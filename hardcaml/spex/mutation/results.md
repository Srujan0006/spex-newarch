| Mutant | Result |
|---|---|
| edge priority: edge 1 beats edge 0 | KILLED |
| window lower bound exclusive | KILLED |
| window upper bound exclusive | KILLED |
| pin changes during entry are lost | KILLED |
| Check role drives the pins | KILLED |
| TIMEOUT logged every cycle, not once per visit | KILLED |
| self-loop refetches the record | KILLED |
| TX shift fills with 0 | KILLED |
| RX MSB-first shift takes the wrong end | KILLED |
| counter load8 loads 7 | KILLED |
| coverage count wraps instead of saturating | KILLED |
| open-drain pin drives high | KILLED |
| Stress at_hi fires at lo | KILLED |
| clocks wrap instead of saturating | KILLED |
| one-flop synchroniser | KILLED |
| change age starts at 0 | KILLED |
| second-change age starts at 0 | KILLED |
| FIFO full one entry early | KILLED |
| FIFO empty from used's low bits (full reads as empty) | KILLED |
| recover jumps to the start location | KILLED |
| irq_ack ignored | KILLED |
| UNEXPECTED ignores the watch mask | KILLED |
| data flag inversion ignored | KILLED |
| ignore age in windows (entry-time changes judged at the EVAL clock) | KILLED |
| no floor at 0 for a clock reset after the change | KILLED |
| AMBIGUOUS: suppression dropped | KILLED |
| AMBIGUOUS only when no edge fires | KILLED |
| AMBIGUOUS: chg_mask left out of the relevant mask | KILLED |
| store write while running reaches the SRAM | KILLED |
| recover jumps to the live recover_loc | KILLED |
| coverage read while running returns SRAM data | KILLED |
| host_err cause: last cause wins | KILLED |
| stop leaves the lanes running | KILLED |
| image_valid set by a crc_expect write | KILLED |
| the image check sweep skips the last word | KILLED |
| start allowed while the image is invalid | KILLED |
| send_bit drives the inverted bit | KILLED |
| timestamp counter is only 24 bits | KILLED |
| logged timestamp borrow register is only 21 bits | KILLED |
| RX FIFO: lane 0 data replaced when the engine waits | KILLED |
| wait buffer forgets a push that lost | KILLED |
| pin source 'lane 0 AND engine' ignores the engine | KILLED |
| prescaler /8 counts every cycle | KILLED |
| send_bit edges also command the lanes | KILLED |
| lane flags read as 0 | KILLED |
| tx_collision never set | KILLED |
| drop counter wraps instead of saturating | KILLED |
| engine push into a full RX FIFO not counted | KILLED |
| RX watermark compared with > | KILLED |
| TX watermark ignores its enable | KILLED |
| pin source select read from the next pin's field | KILLED |
| pin source 'lane 1 AND engine' reads lane 0 | KILLED |
| rx_to_tx ignored: lane bytes stay in the RX FIFO | KILLED |
| stuff bit one bit early | KILLED |
| stuff bit not complemented | KILLED |
| RX stuff bit taken as a data bit | KILLED |
| CRC feedback ignores the bit | KILLED |
| CRC inversion ignored | KILLED |
| readback never compares | KILLED |
| lost arbitration and bit error swapped | KILLED |
| RX never resynchronises | KILLED |
| fractional carry dropped | KILLED |
| RX MSB-first shift takes the wrong end | KILLED |
| END drops the partial byte | KILLED |
| NRZI decode inverted | KILLED |
| a partial RX byte lost at stop is not counted | KILLED |
| RX Done before a trailing stuff bit | KILLED |
| skip one bit short (18 for CAN) | KILLED |
| skip one bit long (20 for CAN) | KILLED |
| skipped bits left out of the CRC | KILLED |
| length field read one bit late | KILLED |
| len_max ignored | KILLED |
| data pin register one cycle late (fed from pins_s) | KILLED |
| dq fed from d's input (no data edge ever seen) | KILLED |
| cq fed from cs's input (no clock edge ever seen) | KILLED |
| residual mode: CRC start (len_pos) ignored | KILLED |
| residual compared in the push cycle (byte's last bit not in) | KILLED |
| residual crc_ok sticky (only ever set) | KILLED |
| residual compares the CRC's low half | KILLED |
| sync_hit not suppressed in residual mode | KILLED |
| residual mode: len_en not ignored | KILLED |
| SPI samples MOSI on the falling edge | KILLED |
| SPI address does not auto-increment | KILLED |
| location store bytes assembled big-endian | KILLED |
| location store beat written on byte 14 | KILLED |
| STATUS not sent during the command byte | KILLED |
| RX FIFO popped when its byte is loaded, not when sent | KILLED |
| violation log popped after byte 4 | KILLED |
| coverage write goes to the incremented address | KILLED |
| CS_n high does not reset the bit counter | KILLED |
| CTRL start and stop bits swapped | KILLED |
| vlog byte 5 does not wrap the address | KILLED |
| TX FIFO byte pushed without its data | KILLED |
| drop counters cleared by CTRL bit 4 | KILLED |
| drop counter bank aliases the CSRs at 0x00 | KILLED |
| compiler ignores END | KILLED |
| compiler ignores the lane done flag | KILLED |
| compiler: recover jumps nowhere | KILLED |
| compiler checks an edge's load after its own END | KILLED |

99/99 killed
