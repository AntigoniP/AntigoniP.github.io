.PHONY: mrproper clean FORCE_MAKE

DOT2TEX = dot2tex --crop -t math

DOT_GRAPHVIZ = $(wildcard *.dot)
TEX_GRAPHVIZ = $(DOT_GRAPHVIZ:.dot=.tex)
PDF_GRAPHVIZ = $(DOT_GRAPHVIZ:.dot=.pdf)

TEX = $(wildcard *.tex)
PDF = $(TEX:.tex=.pdf)

all: $(TEX_GRAPHVIZ) $(PDF_GRAPHVIZ) $(PDF)

%.tex: %.dot
	$(DOT2TEX) $^ > $@

clean: clean-common
	rm -f $(TEX_GRAPHVIZ)
	rm -f $(PDF_GRAPHVIZ)

mrproper: mrproper-common

include ../latex.mk
