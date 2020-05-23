(* ~~Adapter le makefile~~
~~Ajouter dans loop ligne pour eval~~
Ecrire sem *)

open Izyast;;

type izyval =
  | Intval of int
  | Stringval of string
  | Congruval of (izyval * izyval * izyval)

and environment = (string * izyval) list
;;

let rec printval = function
  | Intval n -> Printf.printf "%d" n
  | Stringval s -> Printf.printf "%s" s
  | Congruval (v, w, x) -> (match (v, w, x) with
    (Intval n, Intval m, Intval p) -> Printf.printf "%d congru %d a %d" n m p
    | _ -> Printf.printf "no way\n"
  )
;;

(* Environnement. *)
let init_env = [] ;;
"A FINIR"
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
  | EIdent v -> Stringval v
  | ECongruence (a, b, n) -> (
    match (a, b, n) with
     (EInt a, EInt b, EInt n) -> Congruval (Intval a, Intval b, Intval n)
    | _ -> Stringval "mauvais type pour les congruences"
  )
  | EBinop (op, n, m) -> Stringval "A FINIR"
  | EMonop (op, n) -> Stringval "A FINIR"
  | EMatrice m -> Stringval "A FINIR"
  | ESuite (u, n, e) -> Stringval "A FINIR"
;;

let eval e = eval e init_env ;;
