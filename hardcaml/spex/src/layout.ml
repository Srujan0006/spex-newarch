(** The SPEX location record: one 512-bit word per location.

    This file is the single source of truth for the encoding. The RTL ([Engine]),
    the spec compiler ([Spec]) and the reference model ([Model]) all pack and unpack
    records through these two interfaces, so field order and widths can only change
    here. [pack] puts the first field at the least significant bit.

    record[63:0]            header
    record[64+112k+111 : 64+112k]  edge k, k = 0..3 *)

open! Base
open! Hardcaml

let num_edges = 4
let num_locs = 64
let header_bits = 64
let edge_bits = 112
let record_bits = header_bits + (num_edges * edge_bits)
let beat_bits = 128
let beats = record_bits / beat_bits
let clock_bits = 16

(** Header: what happens on entry, the invariant, and what to do on a violation. *)
module Header = struct
  type 'a t =
    { drive_mask : 'a [@bits 8] (** pins whose value/OE the entry action sets *)
    ; out_val : 'a [@bits 8]
    ; out_oe : 'a [@bits 8]
    ; clk_reset : 'a [@bits 3] (** clocks reset on entry *)
    ; tx_op : 'a [@bits 2]
    ; cnt_op : 'a [@bits 2]
    ; inv_en : 'a [@bits 1] (** invariant: clock [inv_clk] <= [inv_hi] *)
    ; inv_clk : 'a [@bits 2]
    ; inv_hi : 'a [@bits 16]
    ; watch : 'a [@bits 8] (** a change on these pins that no edge takes is UNEXPECTED *)
    ; policy : 'a [@bits 2] (** on violation: 0 halt, 1 log and continue, 2 recover *)
    ; accepting : 'a [@bits 1]
    ; irq_on_entry : 'a [@bits 1]
    ; spare : 'a [@bits 2]
    }
  [@@deriving hardcaml]
end

(** Edge: guard, actions, target. *)
module Edge = struct
  type 'a t =
    { (* guard *)
      pin_mask : 'a [@bits 8]
    ; pin_val : 'a [@bits 8]
    ; chg_mask : 'a [@bits 8] (** 0 = no change needed, else any of these pins changed *)
    ; clk : 'a [@bits 2] (** clock the window applies to (3 reads clock 2) *)
    ; lo : 'a [@bits 16]
    ; hi : 'a [@bits 16]
    ; flag : 'a [@bits 4] (** data flag, see [Flag] *)
    ; flag_inv : 'a [@bits 1]
    ; (* pin actions *)
      drive_mask : 'a [@bits 8]
    ; out_val : 'a [@bits 8]
    ; out_oe : 'a [@bits 8]
    ; tx_pin_en : 'a [@bits 1] (** drive pin [tx_pin] with tx_sr[0] *)
    ; tx_pin : 'a [@bits 3]
    ; (* timer and data actions *)
      clk_reset : 'a [@bits 3]
    ; tx_op : 'a [@bits 2]
    ; rx_op : 'a [@bits 2]
    ; cnt_op : 'a [@bits 2]
    ; rx_pin : 'a [@bits 3]
    ; stress : 'a [@bits 2] (** Stress role: 0 asap, 1 at lo, 2 at hi, 3 random *)
    ; target : 'a [@bits 6]
    ; valid : 'a [@bits 1]
    }
  [@@deriving hardcaml]
end

let () =
  assert (Header.fold Header.port_widths ~init:0 ~f:( + ) = header_bits);
  assert (Edge.fold Edge.port_widths ~init:0 ~f:( + ) = edge_bits)
;;

module Tx_op = struct
  let none = 0
  let load = 1 (* pop TX FIFO into tx_sr (0xFF if empty) *)
  let load_rev = 2 (* same, bit-reversed: MSB-first protocols *)
  let shift = 3 (* tx_sr <= {1, tx_sr[7:1]} *)
end

module Rx_op = struct
  let none = 0
  let shift_lsb = 1 (* rx_sr <= {pin, rx_sr[7:1]} *)
  let shift_msb = 2 (* rx_sr <= {rx_sr[6:0], pin} *)
  let push = 3 (* push rx_sr into the RX FIFO *)
end

module Cnt_op = struct
  let none = 0
  let dec = 1
  let load7 = 2
  let load8 = 3
end

module Flag = struct
  let true_ = 0
  let cnt_zero = 1
  let tx_bit = 2 (* tx_sr[0] *)
  let rx_bit0 = 3 (* rx_sr[0] *)
  let tx_empty = 4
  let rx_full = 5
  let random = 6 (* lfsr[0] *)
  let addr_match = 7 (* rx_sr[7:1] = match_addr[6:0] (I2C target) *)
  (* 8..15 read as 0; reserved for bit-lane flags *)
end

module Policy = struct
  let halt = 0
  let continue = 1
  let recover = 2
end

module Role = struct
  let drive = 0
  let check = 1
  let stress = 2
end

module Stress = struct
  let asap = 0
  let at_lo = 1
  let at_hi = 2
  let random = 3
end

(** Violation kind bits. *)
module Kind = struct
  let unexpected = 1
  let timeout = 2
end
