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
%token PLUS MINUS MULT DIV DIVISIBLE EQUAL GREATER SMALLER GREATEREQUAL SMALLEREQUAL
%token LPAR RPAR SEMICOLON
%left EQUAL GREATER SMALLER GREATEREQUAL SMALLEREQUAL
%left PLUS MINUS
%left MULT DIV
%left DIVISIBLE

%start main
%type <Izyast.expr> main

%%

main: expr SEMICOLON { $1 }
    | SEMICOLON main { $2 }
;

/* Grammaire ci-dessous a finir */

expr:
 INT        { EInt $1 }
 | IDENT { EIdent $1 }
 | LPAR expr RPAR { $2 }
;
