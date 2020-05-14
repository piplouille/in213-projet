type token =
  | STRING of (string)
  | INT of (int)
  | IDENT of (string)
  | CONGRU
  | MODULO
  | PLUS
  | MINUS
  | MULT
  | DIV
  | DIVISE
  | EQUAL
  | GREATER
  | SMALLER
  | GREATEREQUAL
  | SMALLEREQUAL
  | LPAR
  | RPAR
  | SEMICOLON
  | APPARTIENT

open Parsing;;
let _ = parse_error;;
# 6 "izyparse.mly"
  open Izyast;;
# 27 "izyparse.ml"
let yytransl_const = [|
  260 (* CONGRU *);
  261 (* MODULO *);
  262 (* PLUS *);
  263 (* MINUS *);
  264 (* MULT *);
  265 (* DIV *);
  266 (* DIVISE *);
  267 (* EQUAL *);
  268 (* GREATER *);
  269 (* SMALLER *);
  270 (* GREATEREQUAL *);
  271 (* SMALLEREQUAL *);
  272 (* LPAR *);
  273 (* RPAR *);
  274 (* SEMICOLON *);
  275 (* APPARTIENT *);
    0|]

let yytransl_block = [|
  257 (* STRING *);
  258 (* INT *);
  259 (* IDENT *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\002\000\002\000\002\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\004\000\004\000\005\000\005\000\005\000\005\000\000\000"

let yylen = "\002\000\
\002\000\002\000\005\000\006\000\001\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\001\000\
\002\000\001\000\001\000\001\000\001\000\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\020\000\019\000\021\000\000\000\000\000\000\000\
\023\000\000\000\000\000\016\000\018\000\000\000\017\000\000\000\
\002\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\015\000\000\000\000\000\000\000\
\000\000\000\000\022\000\000\000\000\000\000\000\000\000\004\000"

let yydgoto = "\002\000\
\009\000\010\000\011\000\012\000\013\000"

let yysindex = "\004\000\
\001\255\000\000\000\000\000\000\000\000\027\255\011\255\001\255\
\000\000\253\254\188\255\000\000\000\000\011\255\000\000\006\255\
\000\000\011\255\000\000\019\255\019\255\019\255\019\255\019\255\
\019\255\019\255\019\255\019\255\019\255\020\255\003\255\035\255\
\023\255\023\255\255\254\255\254\000\000\208\255\208\255\208\255\
\208\255\208\255\000\000\015\255\011\255\013\255\021\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\104\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\040\255\000\000\
\085\255\100\255\055\255\070\255\000\000\115\255\130\255\145\255\
\160\255\175\255\000\000\000\000\000\000\000\000\119\255\000\000"

let yygindex = "\000\000\
\028\000\249\255\184\000\000\000\035\000"

let yytablesize = 218
let yytable = "\016\000\
\018\000\003\000\004\000\005\000\001\000\044\000\030\000\006\000\
\024\000\018\000\032\000\003\000\004\000\005\000\019\000\048\000\
\007\000\006\000\008\000\003\000\004\000\005\000\031\000\018\000\
\018\000\006\000\007\000\003\000\004\000\005\000\022\000\023\000\
\024\000\046\000\014\000\017\000\043\000\047\000\018\000\045\000\
\015\000\000\000\014\000\022\000\022\000\022\000\022\000\022\000\
\022\000\022\000\022\000\022\000\022\000\022\000\022\000\000\000\
\022\000\022\000\013\000\013\000\013\000\013\000\013\000\013\000\
\000\000\013\000\013\000\013\000\013\000\013\000\000\000\013\000\
\013\000\014\000\014\000\014\000\014\000\014\000\014\000\000\000\
\014\000\014\000\014\000\014\000\014\000\000\000\014\000\014\000\
\011\000\011\000\011\000\011\000\000\000\000\000\000\000\011\000\
\011\000\011\000\011\000\011\000\000\000\011\000\011\000\012\000\
\012\000\012\000\012\000\005\000\005\000\000\000\012\000\012\000\
\012\000\012\000\012\000\000\000\012\000\012\000\006\000\006\000\
\005\000\005\000\000\000\003\000\000\000\006\000\006\000\006\000\
\006\000\006\000\000\000\006\000\006\000\007\000\007\000\003\000\
\003\000\000\000\000\000\000\000\007\000\007\000\007\000\007\000\
\007\000\000\000\007\000\007\000\009\000\009\000\000\000\000\000\
\000\000\000\000\000\000\009\000\009\000\009\000\009\000\009\000\
\000\000\009\000\009\000\008\000\008\000\000\000\000\000\000\000\
\000\000\000\000\008\000\008\000\008\000\008\000\008\000\000\000\
\008\000\008\000\010\000\010\000\000\000\000\000\000\000\000\000\
\000\000\010\000\010\000\010\000\010\000\010\000\000\000\010\000\
\010\000\020\000\021\000\022\000\023\000\024\000\025\000\026\000\
\027\000\028\000\029\000\033\000\034\000\035\000\036\000\037\000\
\038\000\039\000\040\000\041\000\042\000\020\000\021\000\022\000\
\023\000\024\000"

let yycheck = "\007\000\
\004\001\001\001\002\001\003\001\001\000\003\001\014\000\007\001\
\010\001\004\001\018\000\001\001\002\001\003\001\018\001\003\001\
\016\001\007\001\018\001\001\001\002\001\003\001\017\001\004\001\
\004\001\007\001\016\001\001\001\002\001\003\001\008\001\009\001\
\010\001\019\001\016\001\008\000\017\001\045\000\004\001\005\001\
\006\000\255\255\016\001\004\001\005\001\006\001\007\001\008\001\
\009\001\010\001\011\001\012\001\013\001\014\001\015\001\255\255\
\017\001\018\001\004\001\005\001\006\001\007\001\008\001\009\001\
\255\255\011\001\012\001\013\001\014\001\015\001\255\255\017\001\
\018\001\004\001\005\001\006\001\007\001\008\001\009\001\255\255\
\011\001\012\001\013\001\014\001\015\001\255\255\017\001\018\001\
\004\001\005\001\006\001\007\001\255\255\255\255\255\255\011\001\
\012\001\013\001\014\001\015\001\255\255\017\001\018\001\004\001\
\005\001\006\001\007\001\004\001\005\001\255\255\011\001\012\001\
\013\001\014\001\015\001\255\255\017\001\018\001\004\001\005\001\
\017\001\018\001\255\255\005\001\255\255\011\001\012\001\013\001\
\014\001\015\001\255\255\017\001\018\001\004\001\005\001\017\001\
\018\001\255\255\255\255\255\255\011\001\012\001\013\001\014\001\
\015\001\255\255\017\001\018\001\004\001\005\001\255\255\255\255\
\255\255\255\255\255\255\011\001\012\001\013\001\014\001\015\001\
\255\255\017\001\018\001\004\001\005\001\255\255\255\255\255\255\
\255\255\255\255\011\001\012\001\013\001\014\001\015\001\255\255\
\017\001\018\001\004\001\005\001\255\255\255\255\255\255\255\255\
\255\255\011\001\012\001\013\001\014\001\015\001\255\255\017\001\
\018\001\006\001\007\001\008\001\009\001\010\001\011\001\012\001\
\013\001\014\001\015\001\020\000\021\000\022\000\023\000\024\000\
\025\000\026\000\027\000\028\000\029\000\006\001\007\001\008\001\
\009\001\010\001"

let yynames_const = "\
  CONGRU\000\
  MODULO\000\
  PLUS\000\
  MINUS\000\
  MULT\000\
  DIV\000\
  DIVISE\000\
  EQUAL\000\
  GREATER\000\
  SMALLER\000\
  GREATEREQUAL\000\
  SMALLEREQUAL\000\
  LPAR\000\
  RPAR\000\
  SEMICOLON\000\
  APPARTIENT\000\
  "

let yynames_block = "\
  STRING\000\
  INT\000\
  IDENT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 26 "izyparse.mly"
                     ( _1 )
# 186 "izyparse.ml"
               : Izyast.expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Izyast.expr) in
    Obj.repr(
# 27 "izyparse.mly"
                     ( _2 )
# 193 "izyparse.ml"
               : Izyast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 34 "izyparse.mly"
                               ( ECongruence (_1, _3, _5) )
# 202 "izyparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 35 "izyparse.mly"
                                        ( ESuite (_2, _4, _6) )
# 211 "izyparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'arith_expr) in
    Obj.repr(
# 37 "izyparse.mly"
         ( _1 )
# 218 "izyparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arith_expr) in
    Obj.repr(
# 41 "izyparse.mly"
                                     ( EBinop ("=", _1, _3) )
# 226 "izyparse.ml"
               : 'arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arith_expr) in
    Obj.repr(
# 42 "izyparse.mly"
                                     ( EBinop (">", _1, _3) )
# 234 "izyparse.ml"
               : 'arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arith_expr) in
    Obj.repr(
# 43 "izyparse.mly"
                                     ( EBinop (">=", _1, _3) )
# 242 "izyparse.ml"
               : 'arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arith_expr) in
    Obj.repr(
# 44 "izyparse.mly"
                                     ( EBinop ("<", _1, _3) )
# 250 "izyparse.ml"
               : 'arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arith_expr) in
    Obj.repr(
# 45 "izyparse.mly"
                                     ( EBinop ("<=", _1, _3) )
# 258 "izyparse.ml"
               : 'arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arith_expr) in
    Obj.repr(
# 46 "izyparse.mly"
                                     ( EBinop ("+", _1, _3) )
# 266 "izyparse.ml"
               : 'arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arith_expr) in
    Obj.repr(
# 47 "izyparse.mly"
                                     ( EBinop ("-", _1, _3) )
# 274 "izyparse.ml"
               : 'arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arith_expr) in
    Obj.repr(
# 48 "izyparse.mly"
                                     ( EBinop ("*", _1, _3) )
# 282 "izyparse.ml"
               : 'arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arith_expr) in
    Obj.repr(
# 49 "izyparse.mly"
                                     ( EBinop ("/", _1, _3) )
# 290 "izyparse.ml"
               : 'arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arith_expr) in
    Obj.repr(
# 50 "izyparse.mly"
                                     ( EBinop ("|", _1, _3) )
# 298 "izyparse.ml"
               : 'arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'application) in
    Obj.repr(
# 51 "izyparse.mly"
                                     ( _1 )
# 305 "izyparse.ml"
               : 'arith_expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'atom) in
    Obj.repr(
# 61 "izyparse.mly"
                   ( EMonop ("-", _2) )
# 312 "izyparse.ml"
               : 'application))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'atom) in
    Obj.repr(
# 62 "izyparse.mly"
                   ( _1 )
# 319 "izyparse.ml"
               : 'application))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 66 "izyparse.mly"
                 ( EInt (_1) )
# 326 "izyparse.ml"
               : 'atom))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 67 "izyparse.mly"
                 ( EString (_1) )
# 333 "izyparse.ml"
               : 'atom))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 68 "izyparse.mly"
                 ( EIdent (_1) )
# 340 "izyparse.ml"
               : 'atom))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 69 "izyparse.mly"
                 ( _2 )
# 347 "izyparse.ml"
               : 'atom))
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
