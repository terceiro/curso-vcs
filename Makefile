NAME = curso-vcs
TEXSRCS = curso-vcs.tex
EXTRA_DIST += animations.mk figs/animate.rb
GENERATED_FIGS = figs/evolucao.png
OTHER = $(wildcard figs/git-screenshot-*.pdf) $(wildcard figs/logos/*) $(GENERATED_FIGS)
USE_PDFLATEX = 1
PROJECT = $(shell basename $(CURDIR))
HEAD = $(shell git log master^..master --format=%H)

%.png : %.svg
	inkscape -T --export-area-page --export-png=$@ $<

-include animations.mk
-include /usr/share/latex-mk/latex.gmk

CLEAN_FILES += *.nav *.snm *.vrb $(GENERATED_FIGS)
clean::
	@echo cleaned

commit-pdf: $(NAME).pdf
	cd /tmp                      && \
		git clone $(CURDIR)        && \
		cd $(PROJECT)              && \
		git checkout pdf           && \
		cp $(CURDIR)/$(NAME).pdf . && \
		git commit -m $(HEAD) $(NAME).pdf && \
		git push origin pdf
	$(RM) -rf /tmp/$(PROJECT)
