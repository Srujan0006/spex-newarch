(** Example SPEX specs: the "firmware" for UART, SPI and I2C.

    Timing is in engine cycles. Every edge that ends a timed interval resets clock 0,
    so [at (n - 1)] means "n cycles after the previous edge". Location entry takes 5
    cycles, so any interval that crosses into a new location must be >= 6 cycles. *)

open! Base
open Layout
open Spec

(** UART transmitter, 8N1, LSB first. Bytes come from the TX FIFO. [n] = cycles per
    bit. With [jitter] > 0 each bit edge may move inside [n - jitter, n + jitter]:
    Drive role takes the earliest point, Stress role picks the point by [stress]. *)
let uart_tx ?(jitter = 0) ?(stress = Stress.asap) ~pin ~n () =
  let bit_end g = g |> window (n - 1 - jitter) (n - 1 + jitter) in
  { name = "uart_tx"
  ; locs =
      [ loc
          "idle"
          ~entry:(nop |> set pin true)
          [ edge
              ~goto:"data"
              (always |> not_flag Flag.tx_empty)
              (nop |> set pin false |> tx Tx_op.load |> cnt Cnt_op.load8 |> reset 0)
          ]
      ; loc
          "data"
          [ edge
              ~stress
              ~goto:"stop"
              (always |> bit_end |> flag Flag.cnt_zero)
              (nop |> set pin true |> reset 0)
          ; edge
              ~stress
              ~goto:"data"
              (always |> bit_end)
              (nop |> send_bit pin |> tx Tx_op.shift |> cnt Cnt_op.dec |> reset 0)
          ]
      ; loc
          "stop"
          ~accepting:true
          [ edge
              ~stress
              ~goto:"data"
              (always |> bit_end |> not_flag Flag.tx_empty)
              (nop |> set pin false |> tx Tx_op.load |> cnt Cnt_op.load8 |> reset 0)
          ; edge ~stress ~goto:"idle" (always |> bit_end) nop
          ]
      ]
  }
;;

(** UART receiver, 8N1. The same spec is a receiver in Drive role and a line monitor
    in Check role: a glitch inside the start bit is UNEXPECTED, a low stop bit
    (framing error) is a TIMEOUT. Set the recover location to "idle" (index 0). *)
let uart_rx ~pin ~n =
  let half = (n / 2) - 1 in
  { name = "uart_rx"
  ; locs =
      [ loc "idle" ~policy:Policy.recover [ edge ~goto:"start" (always |> falls pin) (nop |> reset 0) ]
      ; loc
          "start"
          ~inv:(0, half)
          ~watch:(bit pin)
          ~policy:Policy.recover
          [ edge
              ~goto:"data"
              (always |> pin_lo pin |> at half)
              (nop |> reset 0 |> cnt Cnt_op.load8)
          ]
      ; loc
          "data"
          ~inv:(0, n - 1)
          ~policy:Policy.recover
          [ edge
              ~goto:"idle"
              (always |> at (n - 1) |> flag Flag.cnt_zero |> pin_hi pin)
              (nop |> rx Rx_op.push)
          ; edge
              ~goto:"data"
              (always |> at (n - 1) |> not_flag Flag.cnt_zero)
              (nop |> rx ~pin Rx_op.shift_lsb |> cnt Cnt_op.dec |> reset 0)
          ]
      ]
  }
;;

(** SPI controller, mode 0 (CPOL 0, CPHA 0), MSB first. Each TX FIFO byte is one
    transfer; the byte read on MISO goes to the RX FIFO. CS stays low while the TX
    FIFO has more bytes. [hp] = cycles per SCK half period. *)
let spi_controller ~cs ~sck ~mosi ~miso ~hp =
  { name = "spi_ctrl_mode0"
  ; locs =
      [ loc
          "idle"
          ~entry:(nop |> set cs true |> set sck false |> set mosi false)
          [ edge
              ~goto:"setup"
              (always |> not_flag Flag.tx_empty)
              (nop |> set cs false |> tx Tx_op.load_rev |> cnt Cnt_op.load8 |> reset 0)
          ]
      ; loc
          "setup"
          [ edge
              ~goto:"lo"
              (always |> at (hp - 1))
              (nop |> send_bit mosi |> tx Tx_op.shift |> reset 0)
          ]
      ; loc
          "lo"
          [ edge
              ~goto:"hi"
              (always |> at (hp - 1))
              (nop |> set sck true |> rx ~pin:miso Rx_op.shift_msb |> cnt Cnt_op.dec |> reset 0)
          ]
      ; loc
          "hi"
          [ edge
              ~goto:"done"
              (always |> at (hp - 1) |> flag Flag.cnt_zero)
              (nop |> set sck false |> rx Rx_op.push |> reset 0)
          ; edge
              ~goto:"lo"
              (always |> at (hp - 1))
              (nop |> set sck false |> send_bit mosi |> tx Tx_op.shift |> reset 0)
          ]
      ; loc
          "done"
          ~accepting:true
          [ edge
              ~goto:"setup"
              (always |> at (hp - 1) |> not_flag Flag.tx_empty)
              (nop |> tx Tx_op.load_rev |> cnt Cnt_op.load8 |> reset 0)
          ; edge ~goto:"idle" (always |> at (hp - 1)) nop
          ]
      ]
  }
;;

(** I2C controller, write transactions. SCL and SDA must be open-drain. The first TX
    FIFO byte is the address byte (addr << 1 | 0), the rest are data; the bus is
    released with STOP when the FIFO is empty. Supports clock stretching. A NACK is
    a TIMEOUT in "ack_hi"; set the recover location to "nack", which sends STOP.
    [q] = cycles per quarter SCL period. *)
let i2c_controller_write ~scl ~sda ~q =
  let half = (2 * q) - 1 in
  { name = "i2c_ctrl_write"
  ; locs =
      [ loc
          "idle"
          ~entry:(nop |> set scl true |> set sda true)
          [ edge
              ~goto:"start"
              (always |> not_flag Flag.tx_empty |> pin_hi scl |> pin_hi sda)
              (nop |> set sda false |> tx Tx_op.load_rev |> cnt Cnt_op.load8 |> reset 0)
          ]
      ; loc "start" [ edge ~goto:"b_lo" (always |> at half) (nop |> set scl false |> reset 0) ]
      ; loc
          "b_lo"
          [ edge
              ~goto:"b_lo2"
              (always |> at (q - 1))
              (nop |> send_bit sda |> tx Tx_op.shift |> cnt Cnt_op.dec |> reset 0)
          ]
      ; loc "b_lo2" [ edge ~goto:"b_hi" (always |> at (q - 1)) (nop |> set scl true |> reset 0) ]
      ; loc
          "b_hi"
          ~watch:(bit sda)
          [ edge
              ~goto:"ack_lo"
              (always |> after half |> pin_hi scl |> flag Flag.cnt_zero)
              (nop |> set scl false |> reset 0)
          ; edge
              ~goto:"b_lo"
              (always |> after half |> pin_hi scl)
              (nop |> set scl false |> reset 0)
          ]
      ; loc "ack_lo" [ edge ~goto:"ack_lo2" (always |> at (q - 1)) (nop |> set sda true |> reset 0) ]
      ; loc "ack_lo2" [ edge ~goto:"ack_hi" (always |> at (q - 1)) (nop |> set scl true |> reset 0) ]
      ; loc
          "ack_hi"
          ~inv:(0, half + 16)
          ~policy:Policy.recover
          [ edge
              ~goto:"b_lo"
              (always |> after half |> pin_hi scl |> pin_lo sda |> not_flag Flag.tx_empty)
              (nop |> set scl false |> tx Tx_op.load_rev |> cnt Cnt_op.load8 |> reset 0)
          ; edge
              ~goto:"stop_lo"
              (always |> after half |> pin_hi scl |> pin_lo sda)
              (nop |> set scl false |> reset 0)
          ]
      ; loc "stop_lo" [ edge ~goto:"stop_lo2" (always |> at (q - 1)) (nop |> set sda false |> reset 0) ]
      ; loc "stop_lo2" [ edge ~goto:"stop_hi" (always |> at (q - 1)) (nop |> set scl true |> reset 0) ]
      ; loc
          "stop_hi"
          [ edge
              ~goto:"stop_done"
              (always |> after half |> pin_hi scl)
              (nop |> set sda true |> reset 0)
          ]
      ; loc "stop_done" ~accepting:true [ edge ~goto:"idle" (always |> at half) nop ]
      ; loc
          "nack"
          ~entry:(nop |> set scl false |> reset 0)
          [ edge ~goto:"stop_lo" (always |> at (q - 1)) (nop |> reset 0) ]
      ]
  }
;;

(** CAN 2.0A transmitter on bit lane 0. The lane sends SOF..data from the TX FIFO
    ([frame_bits] = 19 + 8 DLC, packed MSB first by the host), stuffs, appends CRC-15
    and checks every bit it sends (readback: lost arbitration or bit error stop it). The
    engine waits for an idle bus, then handles CRC delimiter, ACK slot and end of frame.
    Host setup: lane 0 TX, NRZ, [div] = [n], stuffing 1/5, CRC-15 (0x4599 << 17,
    width 15), readback, [data_pin] = [pin]; pin [pin] open-drain with source "lane 0
    AND engine", so the engine can pull the bus low too.

    Locations: [idle] (bus idle 11 bits and a frame in the TX FIFO), [arm] (CRC armed
    during the frame), [frame], [ack] (ACK slot sampled in its middle), [eof] (ACK
    delimiter, 7 EOF bits, 3 intermission), [noack], [lost] (arbitration lost or bit
    error; the host reads the lane status). *)
let can_tx ~pin ~n =
  { name = "can_tx"
  ; locs =
      [ loc
          "idle"
          ~entry:(nop |> set pin true)
          ~accepting:true
          [ edge ~goto:"idle" (always |> falls pin) (nop |> reset 0)
          ; edge
              ~goto:"arm"
              (always |> after ((11 * n) - 1) |> not_flag Flag.tx_empty)
              (nop |> lane (Lane_cmd.go 0))
          ]
      ; loc "arm" [ edge ~goto:"frame" always (nop |> lane (Lane_cmd.crc 0)) ]
      ; loc
          "frame"
          [ edge ~goto:"lost" (always |> flag (Flag.lane_error 0)) nop
          ; edge ~goto:"ack" (always |> flag (Flag.lane_done 0)) (nop |> reset 0)
          ]
      ; (* the lane is done at the start of the CRC delimiter; the ACK slot is the bit
           after it, sampled in its middle *)
        loc
          "ack"
          [ edge ~goto:"eof" (always |> pin_lo pin |> at (n + (n / 2))) (nop |> reset 0)
          ; edge ~goto:"noack" (always |> at (n + (n / 2))) (nop |> reset 0)
          ]
      ; loc "eof" [ edge ~goto:"idle" (always |> at ((n / 2) + (11 * n) - 1)) (nop |> reset 0) ]
      ; loc "noack" []
      ; loc "lost" []
      ]
  }
;;

(** CAN 2.0A receiver on bit lane 1, which ACKs good frames. The lane is armed on an idle
    bus, hard-syncs on SOF, destuffs, collects SOF..data into the RX FIFO (MSB first;
    [frame_bits] = 19 + 8 DLC, written by the host, which knows the DLC) and checks
    CRC-15. After a good CRC the engine drives the ACK slot dominant (pin source
    "engine", open-drain). Host setup as [can_tx] with lane 1, RX, no readback. *)
let can_rx ~pin ~n =
  { name = "can_rx"
  ; locs =
      [ loc
          "idle"
          ~entry:(nop |> set pin true)
          ~accepting:true
          [ edge ~goto:"arm" always (nop |> lane (Lane_cmd.go 1)) ]
      ; loc "arm" [ edge ~goto:"frame" always (nop |> lane (Lane_cmd.crc 1)) ]
      ; loc
          "frame"
          [ edge ~goto:"idle" (always |> flag (Flag.lane_error 1)) nop
          ; edge ~goto:"check" (always |> flag (Flag.lane_done 1)) (nop |> reset 0)
          ]
      ; loc
          "check"
          [ edge ~goto:"wait_ack" (always |> flag (Flag.lane_crc_ok 1)) nop
          ; edge ~goto:"crc_error" always nop
          ]
      ; (* the lane is done when it samples the last CRC (or stuff) bit, 2 cycles after
           its middle on the pad (synchroniser); clock 0 is 2 cycles later. The ACK slot
           starts n / 2 + n after that middle (after the CRC delimiter): drive it from
           clock n + n / 2 - 5 (needs n >= 16 to leave room for two FETCHes). *)
        loc
          "wait_ack"
          [ edge ~goto:"acking" (always |> at (n + (n / 2) - 5)) (nop |> set pin false |> reset 0) ]
      ; loc "acking" [ edge ~goto:"eof" (always |> at (n - 1)) (nop |> set pin true |> reset 0) ]
      ; loc
          "eof"
          [ edge ~goto:"idle" (always |> at ((8 * n) - 1)) (nop |> lane (Lane_cmd.end_ 1)) ]
      ; loc "crc_error" []
      ]
  }
;;
