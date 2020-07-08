.PHONY: mrproper clean FORCE_MAKE paper

include ../config.mk

paper.tgz: paper.tex paper.bbl paper.pdf $(DEPS)
	tar cvzf $@ $^

clean: clean-common

mrproper: # erase everything except this Makefile !
	ls | grep -v Makefile | xargs rm -rf 

include ../latex.mk
