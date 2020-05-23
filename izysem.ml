(* ~~Adapter le makefile~~
~~Ajouter dans loop ligne pour eval~~
Ecrire sem *)

open Izyast;;

type izyval =
  | Intval of int
  | Stringval of string

and environment = (string * izyval) list
;;

let rec printval = function
  | Intval n -> Printf.printf "%d" n
  | Stringval s -> Printf.printf "%S" s
;;

(* Environnement. *)
let init_env = [] ;;

let error msg = raise (Failure msg) ;;

let extend rho x v = (x, v) :: rho ;;

let lookup var_name rho =
  try List.assoc var_name rho
  with Not_found -> error (Printf.sprintf "Undefined ident '%s'" var_name)
;;

(*| EString of string                          (* Le texte random du fichier *)
    | EInt of int                               (* 1, 2, 3 *)
    | EIdent of string                          (* x, toto, fact *)
    | ECongruence of (expr * expr * expr)       (* expr congrue à expr modulo expr *)
    (* | EDivisible of (expr * expr) *)
    | EBinop of (string * expr * expr)          (* + - = * / | *)
    | EMonop of (string * expr)                 (* - *)
    | EMatrice of expr list                     (* [ [1, 2, 3], [4, 5, 6] ] *)
    | ESuite of (e
*)

let rec eval e rho =
  match e with
  | EString s -> Stringval s
  | EInt n -> Intval n
  | EIdent v -> Stringval "A FINIR"
  | ECongruence (a, b, n) -> Stringval "A FINIR"
  | EBinop (op, n, m) -> Stringval "A FINIR"
  | EMonop (op, n) -> Stringval "A FINIR"
  | EMatrice m -> Stringval "A FINIR"
  | ESuite (u, n, e) -> Stringval "A FINIR"
;;

let eval e = eval e init_env ;;
