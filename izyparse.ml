type token =
  | INT of (int)
  | IDENT of (string)
  | TRUE
  | FALSE
  | STRING of (string)
  | PLUS
  | MINUS
  | MULT
  | DIV
  | EQUAL
  | GREATER
  | SMALLER
  | GREATEREQUAL
  | SMALLEREQUAL
  | LPAR
  | RPAR
  | SEMICOLON
  | LET
  | REC
  | IN
  | FUN
  | ARROW
  | IF
  | THEN
  | ELSE

open Parsing;;
let _ = parse_error;;
# 6 "izyparse.mly"
  open Izyast;;
# 33 "izyparse.ml"
let yytransl_const = [|
  259 (* TRUE *);
  260 (* FALSE *);
  262 (* PLUS *);
  263 (* MINUS *);
  264 (* MULT *);
  265 (* DIV *);
  266 (* EQUAL *);
  267 (* GREATER *);
  268 (* SMALLER *);
  269 (* GREATEREQUAL *);
  270 (* SMALLEREQUAL *);
  271 (* LPAR *);
  272 (* RPAR *);
  273 (* SEMICOLON *);
  274 (* LET *);
  275 (* REC *);
  276 (* IN *);
  277 (* FUN *);
  278 (* ARROW *);
  279 (* IF *);
  280 (* THEN *);
  281 (* ELSE *);
    0|]

let yytransl_block = [|
  257 (* INT *);
  258 (* IDENT *);
  261 (* STRING *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\002\000\002\000\002\000\000\000"

let yylen = "\002\000\
\002\000\002\000\001\000\001\000\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\003\000\004\000\000\000\000\000\006\000\000\000\
\000\000\002\000\001\000\005\000"

let yydgoto = "\002\000\
\007\000\008\000"

let yysindex = "\001\000\
\255\254\000\000\000\000\000\000\002\255\255\254\000\000\244\254\
\246\254\000\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\002\000\004\000"

let yytablesize = 17
let yytable = "\003\000\
\004\000\001\000\003\000\004\000\011\000\012\000\000\000\010\000\
\009\000\000\000\000\000\000\000\000\000\005\000\000\000\006\000\
\005\000"

let yycheck = "\001\001\
\002\001\001\000\001\001\002\001\017\001\016\001\255\255\006\000\
\005\000\255\255\255\255\255\255\255\255\015\001\255\255\017\001\
\015\001"

let yynames_const = "\
  TRUE\000\
  FALSE\000\
  PLUS\000\
  MINUS\000\
  MULT\000\
  DIV\000\
  EQUAL\000\
  GREATER\000\
  SMALLER\000\
  GREATEREQUAL\000\
  SMALLEREQUAL\000\
  LPAR\000\
  RPAR\000\
  SEMICOLON\000\
  LET\000\
  REC\000\
  IN\000\
  FUN\000\
  ARROW\000\
  IF\000\
  THEN\000\
  ELSE\000\
  "

let yynames_block = "\
  INT\000\
  IDENT\000\
  STRING\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 26 "izyparse.mly"
                     ( _1 )
# 138 "izyparse.ml"
               : Izyast.expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Izyast.expr) in
    Obj.repr(
# 27 "izyparse.mly"
                     ( _2 )
# 145 "izyparse.ml"
               : Izyast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 33 "izyparse.mly"
            ( EInt _1 )
# 152 "izyparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 34 "izyparse.mly"
         ( EIdent _1 )
# 159 "izyparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 35 "izyparse.mly"
                  ( _2 )
# 166 "izyparse.ml"
               : 'expr))
(* Entry main *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let main (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Izyast.expr)
