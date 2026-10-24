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
