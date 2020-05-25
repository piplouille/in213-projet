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
  | Matrice1Dval m -> Printf.printf "\\begin{bmatrix}\n" ; print_matrice1D stdout m ; Printf.printf "\\end{bmatrix}"
  | Matrice2Dval m -> Printf.printf "\\begin{bmatrix}\n" ; print_matrice2D stdout m ; Printf.printf "\\end{bmatrix}" 
and

print_matrice2D oc m = 
  match m with
  (* extrait les lignes d'une matrice *)
  | [] -> ()
  | l::q -> print_ligne oc l ; print_matrice2D oc q

and
print_matrice1D oc m = 
  match m with
  | [] -> ()
  | e::l -> print_elem oc e ; if l = [] then () else Printf.fprintf oc "& "; print_matrice1D oc l
    
and
print_ligne oc l = match l with
  | _ -> print_matrice1D oc l ; Printf.fprintf oc "\\\\\n"

and
print_elem oc e = match e with
  | Stringval _ | Intval _ | Operatval _ -> printval e ; Printf.fprintf oc " "
  | _ -> Printf.fprintf oc "ELEM "
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
  | [] -> Matrice1Dval ([])
  | l::q -> (
    match l with
    | EMatrice _ -> Matrice2Dval (extrait_table m rho)
    | _ -> Matrice1Dval (extrait_liste m rho)
  )

and
extrait_liste m rho =
  match m with
  | [] -> []
  | l::q -> 
    if q = [] then [eval l rho] else (match l with 
    | EString _ | EInt _ | EBinop _ | EMonop _ -> (eval l rho)::(extrait_liste q rho)
    | _ -> error (Printf.sprintf "mauvais type dans matrice")
  )

and
extrait_table m rho =
  match m with
  | [] -> []
  | l::q -> (
    (match l with
    | EMatrice l -> extrait_liste l rho::extrait_table q rho
    | _ -> []
    )
  )

;;

let eval e = eval e init_env ;;
