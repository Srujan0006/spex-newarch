(** The chip: host SPI port + engine core, with the SRAM ports outside (the Tiny
    Tapeout top instantiates the IHP macros). Pin map (GUIDE step 10):

    ui[0] CS_n, ui[1] SCK, ui[2] MOSI; uo[0] MISO, uo[1] IRQ, uo[2] VIOL pulse,
    uo[3] ENTRY, uo[7:4] debug nibble (CONFIG.dbg_sel); uio = the 8 protocol pins.

    Debug nibble: 0 cur_loc[3:0], 1 {cur_loc[5:4], taken_edge}, 2 {taken, accepting,
    running, halted_viol}, 3 {viol_kind, rx_overflow, cov_overrun}. *)

open! Base
open! Hardcaml
open Signal

module I = struct
  type 'a t =
    { clock : 'a
    ; clear : 'a
    ; cs_n : 'a
    ; sck : 'a
    ; mosi : 'a
    ; pins_in : 'a [@bits 8]
    ; ram : 'a Engine.Ram_in.t [@rtlprefix "ram_"]
    }
  [@@deriving hardcaml]
end

module O = struct
  type 'a t =
    { miso : 'a
    ; irq : 'a
    ; viol : 'a
    ; entry : 'a
    ; dbg : 'a [@bits 4]
    ; pins_out : 'a [@bits 8]
    ; pins_oe : 'a [@bits 8]
    ; ram : 'a Engine.Ram_out.t [@rtlprefix "ram_"]
    }
  [@@deriving hardcaml]
end

let create scope (i : _ I.t) : _ O.t =
  let st = Engine.Status.Of_signal.wires () in
  let spi =
    Host_spi.create
      scope
      { clock = i.clock; clear = i.clear; cs_n = i.cs_n; sck = i.sck; mosi = i.mosi; st }
  in
  let core =
    Engine.create
      scope
      { clock = i.clock; clear = i.clear; pins_in = i.pins_in; host = spi.host; ram = i.ram }
  in
  Engine.Status.Of_signal.assign st core.status;
  let s = core.status in
  { miso = spi.miso
  ; irq = s.irq
  ; viol = s.viol
  ; entry = s.in_entry
  ; dbg =
      mux
        spi.dbg_sel
        [ select s.cur_loc 3 0
        ; concat_msb [ select s.cur_loc 5 4; s.taken_edge ]
        ; concat_msb [ s.taken; s.accepting; s.running; s.halted_viol ]
        ; concat_msb [ s.viol_kind; s.rx_overflow; s.cov_overrun ]
        ]
  ; pins_out = core.pins_out
  ; pins_oe = core.pins_oe
  ; ram = core.ram
  }
;;

(** Simulation top: the chip plus behavioural single-port RAMs. *)
module Sim_top = struct
  module I = struct
    type 'a t =
      { clock : 'a
      ; clear : 'a
      ; cs_n : 'a
      ; sck : 'a
      ; mosi : 'a
      ; pins_in : 'a [@bits 8]
      }
    [@@deriving hardcaml]
  end

  module O = struct
    type 'a t =
      { miso : 'a
      ; irq : 'a
      ; viol : 'a
      ; entry : 'a
      ; dbg : 'a [@bits 4]
      ; pins_out : 'a [@bits 8]
      ; pins_oe : 'a [@bits 8]
      }
    [@@deriving hardcaml]
  end

  let create scope (i : _ I.t) : _ O.t =
    let ram_in = Engine.Ram_in.Of_signal.wires () in
    let c =
      create
        scope
        { clock = i.clock
        ; clear = i.clear
        ; cs_n = i.cs_n
        ; sck = i.sck
        ; mosi = i.mosi
        ; pins_in = i.pins_in
        ; ram = ram_in
        }
    in
    let r = c.ram in
    let sp = Engine.Top.sp_ram ~clock:i.clock ~size:256 in
    Engine.Ram_in.Of_signal.assign
      ram_in
      { rec_rdata = sp ~addr:r.rec_addr ~re:r.rec_re ~we:r.rec_we ~wdata:r.rec_wdata
      ; cov_rdata = sp ~addr:r.cov_addr ~re:r.cov_re ~we:r.cov_we ~wdata:r.cov_wdata
      };
    { miso = c.miso
    ; irq = c.irq
    ; viol = c.viol
    ; entry = c.entry
    ; dbg = c.dbg
    ; pins_out = c.pins_out
    ; pins_oe = c.pins_oe
    }
  ;;
end
