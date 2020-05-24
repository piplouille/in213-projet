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
    (Intval n, Intval m, Intval p) -> (
      if p >= 10
      then Printf.printf "%d \\equiv %d \\pmod {%d}" n m p
      else Printf.printf "%d \\equiv %d \\pmod %d" n m p)
  | _ -> Printf.printf "no way\n"
  )
  | Operatval (op, n, m) -> (
    match (op, n, m) with
    | (op, Intval n, Intval m) -> Printf.printf "%d%s%d" n op m
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

let rec eval e rho =
  match e with
  | EString s -> Stringval s
  | EInt n -> Intval n
  | EIdent v -> Stringval v
  | ECongruence (a, b, n) -> (
    match (eval a rho, eval b rho, eval n rho) with
     (Intval a, Intval b, Intval n) -> Congruval (Intval a, Intval b, Intval n)
    | _ -> Stringval "mauvais type pour les congruences"
  )
  | EBinop (op, e1, e2) -> (
      match (op, eval e1 rho, eval e2 rho) with
      | ("+", Intval n1, Intval n2) -> Operatval ("+", Intval n1, Intval n2)
      | ("-", Intval n1, Intval n2) -> Operatval ("-", Intval n1, Intval n2)
      | ("*", Intval n1, Intval n2) -> Operatval ("*", Intval n1, Intval n2)
      | ("/", Intval n1, Intval n2) -> Operatval ("/", Intval n1, Intval n2)
      | ("|", Intval n1, Intval n2) -> Operatval ("|", Intval n1, Intval n2)
      | ("<",  Intval n1, Intval n2) -> Operatval ("<", Intval n1, Intval n2)
      | (">",  Intval n1, Intval n2) -> Operatval (">", Intval n1, Intval n2)
      | ("=",  Intval n1, Intval n2) -> Operatval ("=", Intval n1, Intval n2)
      | ("<=", Intval n1, Intval n2) -> Operatval ("<=", Intval n1, Intval n2)
      | (">=", Intval n1, Intval n2) -> Operatval (">=", Intval n1, Intval n2)
      | (("+"|"-"|"*"|"/"), _, _) ->
          error "Arithmetic on non-integers"
      | (("<"|">"|"="|"<="|">="), _, _) ->
          error "Comparison of non-integers"
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
