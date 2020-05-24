(* ~~Adapter le makefile~~
~~Ajouter dans loop ligne pour eval~~
Ecrire sem *)

open Izyast;;

type izyval =
  | Intval of int
  | Stringval of string
  | Congruval of (izyval * izyval * izyval)
  | Operatval of (string * izyval * izyval)

and environment = (string * izyval) list
;;

let rec printval = function
  | Intval n -> Printf.printf "%d" n
  | Stringval s -> Printf.printf "%s" s
  | Congruval (v, w, x) -> (match (v, w, x) with
    (n, m, Intval p) -> (
      if p >= 10
      then (printval n ; Printf.printf " \\equiv " ; printval m ; Printf.printf " \\pmod {%d}" p)
      else (printval n ; Printf.printf " \\equiv " ; printval m ; Printf.printf " \\pmod %d" p)
      )
    | _ -> Printf.printf "no way\n"
  )
  | Operatval (op, n, m) -> (printval n ; Printf.printf "%s" op ; printval m)
;;

(* Environnement. *)
let init_env = [] ;;

let error msg = raise (Failure msg) ;;

let extend rho x v = (x, v) :: rho ;;

let lookup var_name rho =
  try List.assoc var_name rho
  with Not_found -> error (Printf.sprintf "Undefined ident '%s'" var_name)
;;

let rec eval e rho =
  match e with
  | EString s -> Stringval s
  | EInt n -> Intval n
  | EIdent v -> Stringval v
  | ECongruence (a, b, n) -> Congruval(eval a rho, eval b rho, eval n rho)
  | EBinop (op, e1, e2) -> (
      match op with 
      | "+" | "-" | "*" | "/" | "|" | "<" | ">" | "=" | "<=" | ">=" -> Operatval (op, eval e1 rho, eval e2 rho)
      | _ -> error (Printf.sprintf "Unknown binary op: %s" op)
     )
  | EMonop ("-", e) -> (
      match eval e rho with
      | Intval n -> Intval (-n)
      | _ -> error "Opposite of a non-integer"
     )
  | EMonop (op, _) -> error (Printf.sprintf "Unknown unary op: %s" op)
  | EMatrice m -> Stringval "A FINIR"
  | ESuite (u, n, e) -> Stringval "A FINIR"
;;

let eval e = eval e init_env ;;
