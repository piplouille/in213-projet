/*
le parser, on définit ici tous nos mots
*/

%{
  open Izyast;;
%}

%token <int> INT
%token <string> IDENT
%token TRUE FALSE
%token <string> STRING
%token PLUS MINUS MULT DIV EQUAL GREATER SMALLER GREATEREQUAL SMALLEREQUAL
%token LPAR RPAR SEMICOLON
%token LET REC IN FUN ARROW
%token IF THEN ELSE
%left EQUAL GREATER SMALLER GREATEREQUAL SMALLEREQUAL
%left PLUS MINUS
%left MULT DIV

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
