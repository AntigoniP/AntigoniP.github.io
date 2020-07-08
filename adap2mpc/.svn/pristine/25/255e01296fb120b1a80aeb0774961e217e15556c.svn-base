# Source: http://tex.stackexchange.com/questions/40738/how-to-properly-make-a-latex-project

SELF_DIR := $(dir $(lastword $(MAKEFILE_LIST)))
LATEXMK = perl $(SELF_DIR)latexmk.pl

# MAIN LATEXMK RULE

# -pdf tells latexmk to generate PDF directly (instead of DVI).
# -pdflatex="" tells latexmk to call a specific backend with specific options.
# -use-make tells latexmk to call make for generating missing files.

# -interactive=nonstopmode keeps the pdflatex backend from stopping at a
# missing file reference and interactively asking you for an alternative.

%.bbl %.pdf: %.tex $(DEPS) FORCE_MAKE
	$(LATEXMK) -pdf -pdflatex="pdflatex -synctex=1 -interaction=nonstopmode -halt-on-error -file-line-error" $<

# Cleaning rules

clean-common:
	$(LATEXMK) -c || true
	rm -f *~ *.backup *.bak *.brf *.bbl *.nav *.vrb *.snm tex_files/*.nav tex_files/*.snm tex_files/*.aux tex_files/*.toc tex_files/*.log tex_files/*.synctex.gz tex_files/*.vrb tex_files/*~ tex_files/*.backup tex_files/*.bak tex_files/*.brf tex_files/*.bbl tex_files/*.out

mrproper-common: clean-common
	$(LATEXMK) -C || true
	rm -f $(PDF) tex_files/*.pdf
