ANIMATION_FRAMES += $(shell seq -f 'figs/distributed-vcs-%03g.png'         1 4)
ANIMATION_FRAMES += $(shell seq -f 'figs/rcs-%03g.png'                     1 5)
ANIMATION_FRAMES += $(shell seq -f 'figs/cvs-%03g.png'                     1 4)
ANIMATION_FRAMES += $(shell seq -f 'figs/centralized-interaction-%03g.png' 1 8)
ANIMATION_FRAMES += $(shell seq -f 'figs/svn-%03g.png'                     1 4)
ANIMATION_FRAMES += $(shell seq -f 'figs/git-branch-merge-%03g.png'        1 7)
ANIMATION_FRAMES += $(shell seq -f 'figs/git-fast-forward-%03g.png'        1 5)
ANIMATION_FRAMES += $(shell seq -f 'figs/git-rebase-%03g.png'              1 7)
ANIMATION_FRAMES += $(shell seq -f 'figs/central-repository-%03g.png'      1 6)
ANIMATION_FRAMES += $(shell seq -f 'figs/integration-manager-%03g.png'     1 3)
ANIMATION_FRAMES += $(shell seq -f 'figs/dictator-and-lieutenants-%03g.png' 1 4)

ANIMATION_FRAMES_SVG = ${ANIMATION_FRAMES:.png=.svg}

OTHER += ${ANIMATION_FRAMES_SVG} ${ANIMATION_FRAMES}
CLEAN_FILES += ${ANIMATION_FRAMES} ${ANIMATION_FRAMES_SVG} figs/*.stamp

# only 9 frames supported currently
figs/%-001.svg figs/%-002.svg figs/%-003.svg figs/%-004.svg figs/%-005.svg figs/%-006.svg figs/%-007.svg figs/%-008.svg figs/%-009.svg: figs/%.stamp
	@true

figs/%.stamp: figs/%.svg
	ruby figs/animate.rb $<
	touch $@
