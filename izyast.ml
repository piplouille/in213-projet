(* Définition du type OCaml des arbres de syntaxe abstraite *)

type expr =
    | ETexte of string                          (* Le texte random du fichier *)
    | EInt of int                               (* 1, 2, 3 *)
    | EIdent of string                          (* x, toto, fact *)
    | ECongruence of (expr * expr * expr)       (* expr congrue à expr modulo expr *)
    (* | EDivisible of (expr * expr) *)
    | EBinop of (string * expr * expr)          (* + - = * / | *)
    | EMonop of (string * expr)                 (* - *)
    (* | EMatrice of expr list                     [ [1, 2, 3], [4, 5, 6] ] *)
    | ESuite of (expr * string * string)      (* (string)_string € string *)
    (* on pourrait ajouter la définition d'ensemble après !! *)
;;

(* extrait les lignes d'une matrice *)
(* let lignes_matrice m =
    Printf.printf "Va pas trop vite, attends la prochaine version pour les matrices\n\n"
;; *)

let rec print oc = function
    | ETexte s -> Printf.fprintf oc "\"%s\"" s
    | EInt n -> Printf.fprintf oc "%d" n
    | EIdent s -> Printf.fprintf oc "%s" s
    | ECongruence (m, p, n) -> Printf.fprintf oc "%a ≡ %a [%a]" print m print p print n
    | EBinop (op,e1,e2) ->
        Printf.fprintf oc "(%a %s %a)" print e1 op print e2
    | EMonop (op,e) -> Printf.fprintf oc "%s%a" op print e
    | ESuite (u, n, e) -> Printf.fprintf oc "(%a)_%s€%s" print u n e
;;
