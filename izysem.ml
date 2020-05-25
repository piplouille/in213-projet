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
  | Matrice1Dval of izyval list
  | Matrice2Dval of izyval list list

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
  | Matrice1Dval m -> print_matrice stdout m
and

print_matrice oc m = 
  Printf.fprintf oc "DEBUT " ;
  match m with
(* extrait les lignes d'une matrice *)
  | [] -> ()
  | e::l -> print_ligne oc e
  (* | e::l -> print_elem oc e ; (if l=[] then Printf.fprintf oc "\\" else ()) ; print_matrice oc l *)
  ;
  Printf.fprintf oc "FIN"
    
and

print_ligne oc l = match l with
  | _ -> Printf.fprintf oc "LIGNE "

(* and

print_elem oc n = match n with
    | Stringval _ -> printval n
    | Intval _ -> printval n
    | Operatval _ -> printval n
    | Matriceval m -> Printf.fprintf oc "[" ; print_matrice oc m ; Printf.fprintf oc "]"
    | _ -> Printf.fprintf oc "Erreur de type de donénes dans matrice" *)
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
  | [] -> Printf.printf "Je suis une matrice vide" ; Intval 1
  | l::q -> (
    match l with
    | EMatrice _ -> Printf.printf "Je suis une matrice 2D" ; Matrice2Dval (extrait_table m rho)
    | _ -> Printf.printf "Je suis une matrice 1D" ; Matrice1Dval (extrait_liste m rho)
  )

and
extrait_liste m rho =
  match m with
  | l::q -> 
    if q = [] then [eval l rho] else (match l with 
    | EString _ | EInt _ | EBinop _ | EMonop _ -> (eval l rho)::(extrait_liste q rho)
    | _ -> error (Printf.sprintf "mauvais type dans matrice")
  )

and
extrait_table m rho =



;;

let eval e = eval e init_env ;;
