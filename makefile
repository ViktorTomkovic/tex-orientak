#!/bin/bash
CMND=`date +%Y-%m-%d`
PRO=$(CMND)-propozície.pdf
POK=$(CMND)-pokyny.pdf
FILES=$(`find -name '*~'`)
default: all
pokyny: pokyny.pdf
propozicie: propozície.pdf
all: propozície.pdf pokyny.pdf
	cp propozície.pdf $(PRO)
	cp pokyny.pdf $(POK)
propozície.pdf: propozície.tex commands.tex
	xelatex propozície.tex
	xelatex propozície.tex
pokyny.pdf: pokyny.tex commands.tex
	xelatex pokyny.tex
	xelatex pokyny.tex
clean:
	if [ -n "$(FILES)" ]; then rm "$(FILES)"; fi;
	rm -f *.aux
	rm -f *.log
	rm -f *.out
	rm -f *.bbl
	rm -f *.blg
