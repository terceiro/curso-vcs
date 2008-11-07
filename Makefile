NAME = curso-vcs
TEXSRCS = curso-vcs.tex
EXTRA_DIST += animations.mk figs/animate.rb
OTHER = figs/evolucao.eps

%.eps : %.svg
	inkscape -T --export-bbox-page --export-eps=$@ $<

-include animations.mk
-include /usr/share/latex-mk/latex.gmk

CLEAN_FILES += *.nav *.snm *.vrb ${OTHER}
clean::
	@echo cleaned
