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

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Izyast.expr
