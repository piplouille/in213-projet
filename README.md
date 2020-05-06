In213 - projet
===
*15 mai*

# Principe de mon langage

> Passer d'une écriture simplifiée à un format LaTeX, plus précisément les formules mathématiques

* Différencier le texte de formules (balises)
* Ecrire des équations et des systèmes d'équation
* Ecrire des matrices
* Ecrire des suites et des séries

# Etapes du projet

1. Lexeur (parser) le .mll
2. Analyseur syntaxique le .mly et .ml si voulu
3. Sémantique
4. Ajouter des fonctions (ex : génération d'une matrice diago)

## Lexeur

But :
* Eliminer bruits du texte source : commentaires, espaces
* Reconnaître opérateurs et mots-clés
* Reconnaître identificateurs, chaînes de caractères littérales et nombres littéraux

# Prises de notes

## Lexeur et parser

règles : definir retour à la ligne, sous windows newline yen a deux possibles

règle de lexing principale :
* qund j'ai un blanc, je jette
* les entiers naturels : chiffre au moins une fois
* cas des identificateurs :
    * mots clefs ET noms de vaiables : je vérifie si chaine est un de mes mots clefs, sinon je renvoie que c'est un ident
* cas des = etc
* puis cas des chaines (pareil pour les commentaires) :
        dès qu'on repère ", on la met dans un buffer : comme ça, pas de concaténation de chaines
        in string peut être simplifiée complètement (virer 103-119), _ as c (n'importe quoi hors fin de chaine) alors je stocke
    


Considérer que [[matrice]], dans le texte qui enrobe : pas de crochets ; 
si j'ai du texte, règle principale, si balise, règle à part

main appelle le parser, c'est lui qui décide d'appeler le lexeur

en c, le parser est dans un état ù il est en plein milie d'une expr, il demande prochain token
lexer donne if ;
parser dit envoie le suivant ;
lexer donne suivant, et c'est ( i lcontinue, sinon syntaxe error ;
yacc = parser

lexeur renvoie lexem dont le type est défini par paseur ;
pcfparse.mly : description qui permt de dire ce que parseur peut obtenir ;
occamlyacc : quand il compile mly, il voit déclaration token et génère type caml qi y correspond ;
on le retrouve dans pcfparse.mly

pcflex.mll : ce qu'on retrouve, ce sont ces types ^



si lexeur déconne, on va le voir et corriger facilement
lexeur sera standard
pcfast.ml : c'est pour alléger le main,
* représente arbre de syntaxe issu du parsing
* parser ne fait pas qu ereconnaitre bonne formation des phrases, il construit qq chose
* trouver les noeuds de l'arbre : dépend du périmètre de ce qu'on veut écrire 
    * structure de langage pauvre => arbre simple
    * begin formula, end formula, [matrice] si à l'intérieur je mets n'imp, structure syntaxique simple
        * puisque doc = texte banal ou début formule contenant tableau avec du texte banal ou intégrale dans aquelle texte banal
        * dans latex, n peut mettre ce qu'on veut, les trous dans la structure, du blabla
        * structure rigide, on accepte tout, mais éléments lexicaux jouent quand même
                [[e,a,f][a,e,f]], le e, a, f c'est du blabla mais qui lexicalement ne contient pas de crochets
                dans une matrice, il peut y avoir une séquence de soit "blabla" soit une matrice
                on peut interdir que tableau contienne liste tableau ou liste blabla, mais pas les deux