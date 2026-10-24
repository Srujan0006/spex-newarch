(** SPEX protocol specs: a small OCaml DSL and the compiler to location records.

    A spec is a timed automaton. Each location has an entry action, an optional
    invariant (a clock bound whose overrun is a TIMEOUT), a watch mask (pin changes
    no edge takes are UNEXPECTED) and up to four edges. Each edge has a guard
    (pins, pin change, a clock window, a data flag) and an action. *)

open! Base
open! Hardcaml
open Layout

type guard =
  { mask : int
  ; value : int
  ; changed : int
  ; clk : int
  ; lo : int
  ; hi : int
  ; flag : int
  ; flag_inv : bool
  }
[@@deriving sexp_of]

type action =
  { drive_mask : int
  ; out_val : int
  ; out_oe : int
  ; tx_pin : int option
  ; reset : int list
  ; tx_op : int
  ; rx_op : int
  ; rx_pin : int
  ; cnt_op : int
  }
[@@deriving sexp_of]

type edge =
  { guard : guard
  ; action : action
  ; stress : int
  ; goto : string
  }
[@@deriving sexp_of]

type loc =
  { name : string
  ; entry : action
  ; inv : (int * int) option (** clock, upper bound *)
  ; watch : int
  ; policy : int
  ; accepting : bool
  ; irq : bool
  ; edges : edge list
  }
[@@deriving sexp_of]

type t =
  { name : string
  ; locs : loc list (** the first location is index 0 *)
  }
[@@deriving sexp_of]

let max_clock = 0xFFFF
let bit p = 1 lsl p

(* ---- guards ---- *)

let always =
  { mask = 0; value = 0; changed = 0; clk = 0; lo = 0; hi = max_clock; flag = 0; flag_inv = false }
;;

let pin_hi p g = { g with mask = g.mask lor bit p; value = g.value lor bit p }
let pin_lo p g = { g with mask = g.mask lor bit p; value = g.value land lnot (bit p) }
let changes p g = { g with changed = g.changed lor bit p }
let rises p g = g |> pin_hi p |> changes p
let falls p g = g |> pin_lo p |> changes p
let window ?(clk = 0) lo hi g = { g with clk; lo; hi }

(** Fire exactly when the clock reads [n]. With the clock reset by the previous
    edge, the time between the two edges is [n + 1] cycles. *)
let at ?clk n g = window ?clk n n g

let after ?clk n g = window ?clk n max_clock g
let flag f g = { g with flag = f; flag_inv = false }
let not_flag f g = { g with flag = f; flag_inv = true }

(* ---- actions ---- *)

let nop =
  { drive_mask = 0
  ; out_val = 0
  ; out_oe = 0
  ; tx_pin = None
  ; reset = []
  ; tx_op = Tx_op.none
  ; rx_op = Rx_op.none
  ; rx_pin = 0
  ; cnt_op = Cnt_op.none
  }
;;

(** Drive pin [p] to [v] (an open-drain pin releases on [true]). *)
let set p v a =
  { a with
    drive_mask = a.drive_mask lor bit p
  ; out_val = (if v then a.out_val lor bit p else a.out_val land lnot (bit p))
  ; out_oe = a.out_oe lor bit p
  }
;;

(** Stop driving pin [p]. *)
let release p a =
  { a with drive_mask = a.drive_mask lor bit p; out_oe = a.out_oe land lnot (bit p) }
;;

let send_bit p a = { a with tx_pin = Some p }
let reset c a = { a with reset = c :: a.reset }
let tx op a = { a with tx_op = op }
let rx ?(pin = 0) op a = { a with rx_op = op; rx_pin = pin }
let cnt op a = { a with cnt_op = op }
let edge ?(stress = Stress.asap) ~goto guard action = { guard; action; stress; goto }

let loc ?(entry = nop) ?inv ?(watch = 0) ?(policy = Policy.halt) ?(accepting = false)
  ?(irq = false) name edges
  =
  { name; entry; inv; watch; policy; accepting; irq; edges }
;;

(* ---- compiler ---- *)

let index_of (t : t) name =
  match List.findi t.locs ~f:(fun _ l -> String.equal l.name name) with
  | Some (k, _) -> k
  | None -> raise_s [%message "unknown location" (name : string) (t.name : string)]
;;

let check_field what v w =
  if v < 0 || v >= 1 lsl w
  then raise_s [%message "field out of range" (what : string) (v : int) (w : int)]
;;

let resets l = List.fold l ~init:0 ~f:(fun acc c -> acc lor bit c)

(** Deadlock guard. If every edge of a location has a closed window on the same
    clock, the location can only be left before that clock passes the largest [hi].
    Without an invariant a missed window would hang the engine silently, so the
    compiler adds that bound as the invariant and a miss becomes a TIMEOUT. *)
let auto_invariant (l : loc) =
  match l.edges with
  | [] -> None
  | e :: _ ->
    let c = e.guard.clk in
    if List.for_all l.edges ~f:(fun e -> e.guard.clk = c && e.guard.hi < max_clock)
    then Some (c, List.fold l.edges ~init:0 ~f:(fun acc e -> max acc e.guard.hi))
    else None
;;

let header_of (l : loc) : int Header.t =
  if Option.is_some l.entry.tx_pin || l.entry.rx_op <> Rx_op.none
  then raise_s [%message "entry actions cannot send a bit or touch rx" (l.name : string)];
  let inv_en, inv_clk, inv_hi =
    match l.inv, auto_invariant l with
    | Some (c, hi), _ | None, Some (c, hi) -> 1, c, hi
    | None, None -> 0, 0, 0
  in
  { drive_mask = l.entry.drive_mask
  ; out_val = l.entry.out_val
  ; out_oe = l.entry.out_oe
  ; clk_reset = resets l.entry.reset
  ; tx_op = l.entry.tx_op
  ; cnt_op = l.entry.cnt_op
  ; inv_en
  ; inv_clk
  ; inv_hi
  ; watch = l.watch
  ; policy = l.policy
  ; accepting = Bool.to_int l.accepting
  ; irq_on_entry = Bool.to_int l.irq
  ; spare = 0
  }
;;

let edge_of t (e : edge) : int Edge.t =
  let g = e.guard
  and a = e.action in
  { pin_mask = g.mask
  ; pin_val = g.value land g.mask
  ; chg_mask = g.changed
  ; clk = g.clk
  ; lo = g.lo
  ; hi = g.hi
  ; flag = g.flag
  ; flag_inv = Bool.to_int g.flag_inv
  ; drive_mask = a.drive_mask
  ; out_val = a.out_val
  ; out_oe = a.out_oe
  ; tx_pin_en = Bool.to_int (Option.is_some a.tx_pin)
  ; tx_pin = Option.value a.tx_pin ~default:0
  ; clk_reset = resets a.reset
  ; tx_op = a.tx_op
  ; rx_op = a.rx_op
  ; cnt_op = a.cnt_op
  ; rx_pin = a.rx_pin
  ; stress = e.stress
  ; target = index_of t e.goto
  ; valid = 1
  }
;;

module Pack (X : Interface.S) = struct
  let pack (v : int X.t) =
    X.iter2 v X.port_names_and_widths ~f:(fun v (n, w) -> check_field n v w);
    X.Of_bits.pack (X.map2 v X.port_widths ~f:(fun v w -> Bits.of_int ~width:w v))
  ;;
end

module Pack_header = Pack (Header)
module Pack_edge = Pack (Edge)

(** Compile to one 512-bit record per location. *)
let compile (t : t) : Bits.t array =
  if List.length t.locs > num_locs then raise_s [%message "too many locations" t.name];
  List.map t.locs ~f:(fun l ->
    if List.length l.edges > num_edges
    then raise_s [%message "too many edges" (l.name : string)];
    let hdr = Pack_header.pack (header_of l) in
    let edges =
      List.init num_edges ~f:(fun k ->
        match List.nth l.edges k with
        | Some e -> Pack_edge.pack (edge_of t e)
        | None -> Bits.zero edge_bits)
    in
    Bits.concat_lsb (hdr :: edges))
  |> Array.of_list
;;

(** Split a record into the 128-bit words written to the location store at
    address {loc, beat}. *)
let beats_of record =
  List.init beats ~f:(fun b -> Bits.select record (((b + 1) * beat_bits) - 1) (b * beat_bits))
;;

(* ---- decoder (for the model, listings and round-trip tests) ---- *)

let decode record : int Header.t * int Edge.t array =
  let hdr = Header.Of_bits.unpack (Bits.select record (header_bits - 1) 0) |> Header.map ~f:Bits.to_int in
  let edges =
    Array.init num_edges ~f:(fun k ->
      let lo = header_bits + (edge_bits * k) in
      Edge.Of_bits.unpack (Bits.select record (lo + edge_bits - 1) lo) |> Edge.map ~f:Bits.to_int)
  in
  hdr, edges
;;

let listing (t : t) =
  let records = compile t in
  List.iteri t.locs ~f:(fun k l ->
    let hdr, edges = decode records.(k) in
    Stdio.printf
      "%2d %-10s inv=%s watch=%02x policy=%d\n"
      k
      l.name
      (if hdr.inv_en = 1 then Printf.sprintf "c%d<=%d" hdr.inv_clk hdr.inv_hi else "-")
      hdr.watch
      hdr.policy;
    Array.iteri edges ~f:(fun j (e : int Edge.t) ->
      if e.valid = 1
      then
        Stdio.printf
          "     e%d pins %02x/%02x chg %02x c%d in [%d,%d] flag %s%d -> %d\n"
          j
          e.pin_mask
          e.pin_val
          e.chg_mask
          e.clk
          e.lo
          e.hi
          (if e.flag_inv = 1 then "!" else "")
          e.flag
          e.target))
;;
