NAME = curso-vcs
TEXSRCS = curso-vcs.tex
EXTRA_DIST += animations.mk figs/animate.rb
GENERATED_FIGS = figs/evolucao.png
OTHER = $(wildcard figs/git-screenshot-*.pdf) $(wildcard figs/logos/*) $(GENERATED_FIGS)
USE_PDFLATEX = 1

%.png : %.svg
	inkscape -T --export-area-page --export-png=$@ $<

-include animations.mk
-include /usr/share/latex-mk/latex.gmk

CLEAN_FILES += *.nav *.snm *.vrb $(GENERATED_FIGS)
clean::
	@echo cleaned

commit-pdf: $(NAME).pdf
	cp $(NAME).pdf /tmp/$(NAME).pdf
	git checkout pdf
	cp /tmp/$(NAME).pdf $(NAME).pdf
	git commit -m "$(shell git log master^..master --format=%H)" $(NAME).pdf
	git checkout master
	cp /tmp/$(NAME).pdf $(NAME).pdf
	touch $(NAME).pdf
