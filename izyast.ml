(* Définition du type OCaml des arbres de syntaxe abstraite *)

type expr =
    | EFormule of expr