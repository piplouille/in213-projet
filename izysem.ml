(* ~~Adapter le makefile~~
~~Ajouter dans loop ligne pour eval~~
Ecrire sem *)

open Izyast;;

type izyval =
  | Intval of int
  | Stringval of string
  | Congruval of (izyval * izyval * izyval)
  | Operatval of (string * izyval * izyval)
  | Suiteval of (izyval * string * string)
  | Matriceval of izyval list

and environment = (string * izyval) list
;;


let rec printval = function
  | Intval n -> Printf.printf "%d" n
  | Stringval s -> Printf.printf "%s" s
  | Congruval (v, w, x) -> (match (v, w, x) with
    (n, m, Intval p) -> (
      printval n ; Printf.printf " \\equiv " ; printval m ;
      if p >= 10
      then  (Printf.printf " \\pmod {%d}" p)
      else (Printf.printf " \\pmod %d" p)
      )
    | _ -> (printval v ; Printf.printf " \\equiv " ; printval w ; Printf.printf " \\pmod {"; printval x ; Printf.printf "}")
  )
  | Operatval (op, n, m) -> (printval n ; (match op with
    | "=" -> Printf.printf "&%s&{" op
    | _ -> Printf.printf "%s{" op 
    )  
    ; printval m ; Printf.printf "}")
  | Suiteval (u, n, e) -> (Printf.printf "(" ; printval u ; Printf.printf "_{%s})_{%s\\in" n n; 
    (match e with
    | "N" | "R" | "C" | "Q" | "Z" -> Printf.printf "\\mathbb{%s}}" e
    | _ -> Printf.printf " %s}" e)
  )
  | Matriceval m -> print_matrice stdout m
and

print_matrice oc m = match m with
(* extrait les lignes d'une matrice *)
    | [] -> ()
    | e::l -> print_elem oc e ; (if l=[] then Printf.fprintf oc "\\" else ()) ; print_matrice oc l
    
and

print_elem oc n = match n with
    | Stringval _ -> printval n
    | Intval _ -> printval n
    | Operatval _ -> printval n
    | Matriceval m -> Printf.fprintf oc "[" ; print_matrice oc m ; Printf.fprintf oc "]"
    | _ -> Printf.fprintf oc "Erreur de type de donénes dans matrice"
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
      | "+" | "-" | "*" | "/" | "^" | "|" | "<" | ">" | "=" | "<=" | ">=" -> Operatval (op, eval e1 rho, eval e2 rho)
      | _ -> error (Printf.sprintf "Unknown binary op: %s" op)
     )
  | EMonop ("-", e) -> (
      match eval e rho with
      | Intval n -> Intval (-n)
      | Stringval n -> Stringval ("-"^n)
      | _ -> error "Opposite of a bad type"
     )
  | EMonop (op, _) -> error (Printf.sprintf "Unknown unary op: %s" op)
  | EMatrice m -> extrait_matrice m rho
  | ESuite (u, n, e) -> Suiteval (eval u rho, n, e)

and
extrait_matrice m rho =
  match m with
  | [] -> Matriceval []
  | l::q -> Matriceval [(extrait_ligne l rho);(extrait_matrice q rho)]

and
extrait_ligne l rho =
  match l with
  | EMatrice m -> extrait_matrice m rho
  | EString _ | EInt _ | EBinop _ | EMonop _ -> eval l rho
  | _ -> error (Printf.sprintf "mauvais type dans matrice")

(* and
extrait_matrice m rho r =
  match m with
  | [] -> Matriceval []
  | l::q -> extrait_matrice q rho r::(extrait_ligne l rho [])

and extrait_ligne l rho p =
  match l with
  | EMatrice m -> extrait_matrice m rho p
  | _ -> [p;eval l rho] *)
;;

let eval e = eval e init_env ;;
