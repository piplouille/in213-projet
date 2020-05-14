/*
le parser, on définit ici tous nos mots
*/

%{
  open Izyast;;
%}

%token <string> STRING
%token <int> INT
%token <string> IDENT
%token CONGRU MODULO
%token PLUS MINUS MULT DIV DIVISE EQUAL GREATER SMALLER GREATEREQUAL SMALLEREQUAL
%token LPAR RPAR SEMICOLON
%token APPARTIENT
%left EQUAL GREATER SMALLER GREATEREQUAL SMALLEREQUAL
%left PLUS MINUS
%left MULT DIV
%left DIVISE

%start main
%type <Izyast.expr> main

%%

main: expr SEMICOLON { $1 }
    | SEMICOLON main { $2 }
;


/* Grammaire */

expr:
  expr CONGRU expr MODULO expr { ECongruence ($1, $3, $5) }
| LPAR expr RPAR IDENT APPARTIENT IDENT { ESuite ($2, $4, $6) }
| arith_expr
         { $1 }
;

arith_expr:
  arith_expr EQUAL arith_expr        { EBinop ("=", $1, $3) }
| arith_expr GREATER arith_expr      { EBinop (">", $1, $3) }
| arith_expr GREATEREQUAL arith_expr { EBinop (">=", $1, $3) }
| arith_expr SMALLER arith_expr      { EBinop ("<", $1, $3) }
| arith_expr SMALLEREQUAL arith_expr { EBinop ("<=", $1, $3) }
| arith_expr PLUS arith_expr         { EBinop ("+", $1, $3) }
| arith_expr MINUS arith_expr        { EBinop ("-", $1, $3) }
| arith_expr MULT arith_expr         { EBinop ("*", $1, $3) }
| arith_expr DIV arith_expr          { EBinop ("/", $1, $3) }
| arith_expr DIVISE arith_expr       { EBinop ("|", $1, $3) }
| application                        { $1 }
;

/* On considere ci-dessous que MINUS atom est dans la categorie
 * des applications. Cela permet de traiter n - 1
 * comme une soustraction binaire, et       f (- 1)
 * comme l'application de f a l'oppose de 1.
 */

application:
  MINUS atom       { EMonop ("-", $2) }
| atom             { $1 }
;

atom:
  INT            { EInt ($1) }
| STRING         { EString ($1) }
| IDENT          { EIdent ($1) }
| LPAR expr RPAR { $2 }
;
