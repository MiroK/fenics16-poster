.PHONY: qrcode.pdf all clean

all: poster.pdf

qrfenicstools.pdf: qrfenicstools.tex
	latexmk -pdflatex=lualatex -pdf $<
	mv qrfenicstools.pdf graphics

poster.pdf: poster.tex qrfenicstools.pdf 
	latexmk -pdf -pdflatex="pdflatex --shell-escape %O %S" $<

clean:
	latexmk -C
