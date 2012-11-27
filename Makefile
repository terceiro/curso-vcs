NAME = curso-vcs
TEXSRCS = curso-vcs.tex
EXTRA_DIST += animations.mk figs/animate.rb
OTHER = figs/evolucao.png $(wildcard figs/git-screenshot-*.pdf)
USE_PDFLATEX = 1

%.png : %.svg
	inkscape -T --export-area-page --export-png=$@ $<

-include animations.mk
-include /usr/share/latex-mk/latex.gmk

CLEAN_FILES += *.nav *.snm *.vrb ${OTHER}
clean::
	@echo cleaned
