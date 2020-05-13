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

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Izyast.expr
