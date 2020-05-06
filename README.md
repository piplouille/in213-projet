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

1. Lexeur (parser)
2. Analyseur syntaxique
3. Sémantique
4. Ajouter des fonctions (ex : génération d'une matrice diago)

## Lexeur

But :
* Eliminer bruits du texte source : commentaires, espaces
* Reconnaître opérateurs et mots-clés
* Reconnaître identificateurs, chaînes de caractères littérales et nombres littéraux
