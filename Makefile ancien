# Compilateurs
OCC = ocamlopt
OCL = ocamllex
OCY = ocamlyacc

# Fichiers compilés, à produire pour fabriquer l'exécutable
OBJS = izylex.cmx izyast.cmx izyparse.cmx izyloop.cmx

izyloop: $(OBJS)
	$(OCC) -o $@ $(OBJS)

# Les cibles auxiliaire
clean::
	/bin/rm -f *~ *.cmo *.cmx *.o *.cmi *.cmt *.cmti \
                   izyparse.ml izyparse.mli izylex.ml izyloop

# Les dépendances
izyloop.cmx: izyast.cmi izyparse.cmi izylex.cmi

izylex.cmx: izyparse.cmi

izyparse.cmi: izyast.cmi

izyparse.cmx: izyast.cmi

izyparse.mli: izyparse.ml

izyast.cmi: izyast.cmx

izylex.cmi: izylex.cmx

# Générations de fichiers compilés selon leurs extensions (suffixes) :
# .ext1.ext2 : comment passer de foo.ext1 à foo.ext2
.ml.cmx:
	$(OCC) -c $<

.mli.cmi:
	$(OCC) -c $<

.mll.ml:
	$(OCL) $<

.mly.ml:
	$(OCY) $<

# Déclaration de suffixes :
#  - d'abord, on supprime les suffixes connus de make (.c, .o, etc.)
.SUFFIXES:

# - ensuite, on déclare nos suffixes
.SUFFIXES: .ml .mli .mly .mll .cmx .cmi
