(* Définition du type OCaml des arbres de syntaxe abstraite *)

type expr =
    | EString of string                          (* Le texte random du fichier *)
    | EInt of int                               (* 1, 2, 3 *)
    | EIdent of string                          (* x, toto, fact *)
    | ECongruence of (expr * expr * expr)       (* expr congrue à expr modulo expr *)
    | EBinop of (string * expr * expr)          (* + - = * / | *)
    | EMonop of (string * expr)                 (* - *)
    | EMatrice of expr list                     (* [ [1, 2, 3], [4, 5, 6] ] *)
    | ESuite of (expr * string * string)      (* (string)_string € string *)
    (* on pourrait ajouter la définition d'ensemble après !! *)
    (* ajouter les équations : a = ... *)
;;


let rec print oc = function
    | EString s -> Printf.fprintf oc "string \"%s\"" s
    | EInt n -> Printf.fprintf oc "entier %d" n
    | EIdent s -> Printf.fprintf oc "identificateur %s" s
    | ECongruence (m, p, n) -> Printf.fprintf oc "congru %a ≡ %a [%a]" print m print p print n
    | EBinop (op,e1,e2) ->
        Printf.fprintf oc "binop (%a %s %a)" print e1 op print e2
    | EMonop (op,e) -> Printf.fprintf oc "monop %s%a" op print e
    | ESuite (u, n, e) -> Printf.fprintf oc "suite (%a)_%s€%s" print u n e
    | EMatrice m -> Printf.fprintf oc "matrice tentée"
and

print_matrice oc m = match m with
(* extrait les lignes d'une matrice *)
    | [] -> ()
    | e::l -> print oc e ; Printf.fprintf oc " " ; print_matrice oc l
    
(* and

print_elem oc n = match n with
    | EString _ | EInt _ | EBinop _ | EMonop _ -> print oc n
    | EMatrice m -> print_matrice oc m
    | _ -> Printf.fprintf oc "Erreur de type de donénes dans matrice" *)
;;
