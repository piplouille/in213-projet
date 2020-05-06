(* le lexeur 
On séparera en deux cas notre rule : dans le texte, et dans une formule
*)

{
    (* prélude 
    fonctions pour gérer les chînes de caractères : les backslash etc
    on peut simplifier si on n'a pas besoin *)
    open Pcfparse ;;
    exception Eoi ;;

    let pc c = Printf.eprintf "Lu '%c'\n%!" c;;
    let ps c = Printf.eprintf "Lu '%s'\n%!" c;;

    (* Emprunt� de l'analyseur lexical du compilateur OCaml *)
    (* To buffer string literals *)

    let initial_string_buffer = Bytes.create 256;;
    let string_buff = ref initial_string_buffer;;
    let string_index = ref 0;;

    let reset_string_buffer () =
        string_buff := initial_string_buffer;
        string_index := 0;;

    let store_string_char c =
        if !string_index >= Bytes.length (!string_buff) then begin
        let new_buff = Bytes.create (Bytes.length (!string_buff) * 2) in
        Bytes.blit (!string_buff) 0 new_buff 0 (Bytes.length (!string_buff));
        string_buff := new_buff
        end;
        Bytes.unsafe_set (!string_buff) (!string_index) c;
        incr string_index;;

    let get_stored_string () =
        let s = Bytes.to_string (Bytes.sub (!string_buff) 0 (!string_index)) in
        string_buff := initial_string_buffer;
        s;;

}

let newline = ('\010' | '\013' | "\013\010")

rule lex = parse
    (' ' | '\t' | newline )
      { lex lexbuf }     (* on passe les espaces *)
  | ['0'-'9']+ as lxm
      { INT(int_of_string lxm) }
  | [ 'A'-'Z' 'a'-'z' ] [ 'A'-'Z' 'a'-'z' ]* as lxm
      { match lxm with
          "let" -> LET
        | "rec" -> REC
        | "in" -> IN
        | "fun" -> FUN
        | "if" -> IF
        | "then" -> THEN
        | "else" -> ELSE
        | "true" -> TRUE
        | "false" -> FALSE
        | _ -> IDENT(lxm) }
  | "="   { EQUAL }
  | ">"   { GREATER} | "<"  { SMALLER }
  | ">="  { GREATEREQUAL} | "<="  { SMALLEREQUAL }
  | "+"   { PLUS } | "-"   { MINUS } | "*" { MULT } | "/" { DIV }
  | ";"   { SEMICOLON }
  | "->"  { ARROW }
  | '('   { LPAR }
  | ')'   { RPAR }
  | '"'   { reset_string_buffer();
            in_string lexbuf;
            STRING (get_stored_string()) }
  | eof   { raise Eoi }
  | _  as c { Printf.eprintf "Invalid char `%c'\n%!" c ; lex lexbuf }

and in_formule = parse
    '\end'
      { () }
  | eof
      { raise Eoi }
  | _ as c
      { store_string_char c; in_string lexbuf }

