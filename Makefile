VIEWER=okular

all: presentation.bbl presentation.aux
	pdflatex presentation.tex

fast: *.tex
	pdflatex presentation.tex

presentation.aux: presentation.tex
	pdflatex presentation.tex

presentation.bbl: presentation.aux literature.bib
	biber presentation

.PHONY: clean cleaner

clean:
	$(RM) *.aux *.bbl *.bcf *.blg *.log *.nav *.out *.run.xml *.snm *.toc

cleaner: clean
	$(RM) presentation.pdf *.fdb_latexmk

view: fast
	$(VIEWER) presentation.pdf &
