(* Sanity check of the software CAN node on its own: two nodes on one bus. *)

open! Base
open! Stdio
module C = Can_node

let bus2 ?(cycles = 4000) a b =
  for _ = 1 to cycles do
    let bus = a.C.drive land b.C.drive in
    C.step a ~bus;
    C.step b ~bus
  done
;;

let show name (t : C.t) =
  printf
    "%s: received %s sent %s acked %s lost_at %s stuff errors %d\n"
    name
    (Sexp.to_string [%sexp (List.rev t.received : C.frame list)])
    (Sexp.to_string [%sexp (List.rev t.sent : C.frame list)])
    (Sexp.to_string [%sexp (t.acked : bool option)])
    (Sexp.to_string [%sexp (t.lost_at : int option)])
    t.stuff_errors
;;

let%expect_test "software CAN node: one sends, one receives and ACKs" =
  let a = C.create ~n:10 ()
  and b = C.create ~n:10 () in
  C.send a { id = 0x123; data = [ 0xDE; 0xAD; 0x00; 0xFF ] };
  bus2 a b;
  show "a" a;
  show "b" b;
  [%expect {|
    a: received () sent (((id 291)(data(222 173 0 255)))) acked (true) lost_at () stuff errors 0
    b: received (((id 291)(data(222 173 0 255)))) sent () acked () lost_at () stuff errors 0
    |}]
;;

let%expect_test "software CAN node: arbitration, lower identifier wins" =
  let a = C.create ~n:10 ()
  and b = C.create ~n:10 () in
  C.send a { id = 0x123; data = [ 0x11 ] };
  C.send b { id = 0x122; data = [ 0x22 ] };
  bus2 a b;
  show "a" a;
  show "b" b;
  [%expect {|
    a: received (((id 290)(data(34)))) sent (((id 291)(data(17)))) acked (true) lost_at (11) stuff errors 0
    b: received (((id 291)(data(17)))) sent (((id 290)(data(34)))) acked (true) lost_at () stuff errors 0
    |}]
;;
