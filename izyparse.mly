/*
le parser, on définit ici tous nos mots
*/

%{
  open Izyast;;
%}

%token FORMULE END
%token <string> STRING
%token <int> INT
%token CONGRU MODULO
%token PLUS MINUS MULT DIV PUI DIVISE EQUAL GREATER SMALLER GREATEREQUAL SMALLEREQUAL
%token LPAR RPAR LCRO RCRO SEMICOLON VIRGULE
%token APPARTIENT
%left EQUAL GREATER SMALLER GREATEREQUAL SMALLEREQUAL
%right PLUS MINUS
%right MULT DIV
%right DIVISE

%start main
%type <Izyast.expr> main

%%

main: FORMULE expr END { $2 }
    | STRING { EString ($1) }
    | END main { $2 }
;


/* Grammaire */

expr:
  expr CONGRU expr MODULO expr { ECongruence ($1, $3, $5) }
| LPAR expr RPAR STRING APPARTIENT STRING { ESuite ($2, $4, $6) }
| STRING { EString ($1) }
| LCRO in_matrice RCRO { EMatrice ($2) }
| LCRO RCRO { EMatrice ([]) }
| arith_expr { $1 }
;

/* après une ouverture de matrice, on peut trouver */
in_matrice:
| liste { $1 }
;

liste:
  application VIRGULE liste { ($1::$3) }
| application { [$1] }
| LCRO liste RCRO VIRGULE liste { [EMatrice ($2); EMatrice($5)] }
| LCRO liste RCRO { $2 }
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
| arith_expr PUI arith_expr       { EBinop ("^", $1, $3) }
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
| LPAR expr RPAR { $2 }
;
