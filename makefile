TEXBIN=latexmk
SRCDIR=src
TEXDIR=$(SRCDIR)/tex
BIBDIR=$(SRCDIR)/bib
OUTDIR=output
MAINFILE=main
BIBFILE=references

all: build

build:
	cd $(TEXDIR); \
	cp ../../$(BIBDIR)/$(BIBFILE).bbl .; \
	$(TEXBIN) -xelatex -bibtex -f -output-directory=../../$(OUTDIR) $(MAINFILE).tex; \
	rm $(BIBFILE).bbl

cleanrest:
	cd $(OUTDIR); rm -f $(MAINFILE).nav $(MAINFILE).snm

clean: cleanrest
	cd $(OUTDIR); $(TEXBIN) -c -r ../latexmkrc ../$(TEXDIR)/$(MAINFILE).tex

cleanall: cleanrest
	cd $(OUTDIR); $(TEXBIN) -C -r ../latexmkrc ../$(TEXDIR)/$(MAINFILE).tex
