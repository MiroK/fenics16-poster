.PHONY: all clean

all: poster.pdf extras.pdf

qrfenicstools.pdf: qrfenicstools.tex
	latexmk -pdflatex=lualatex -pdf $<
	mv qrfenicstools.pdf graphics

qrposter.pdf: qrposter.tex
	latexmk -pdflatex=lualatex -pdf $<
	mv qrposter.pdf graphics

qrextras.pdf: qrextras.tex
	latexmk -pdflatex=lualatex -pdf $<
	mv qrextras.pdf graphics

domains.pdf: domains.tex
	latexmk -pdf -pdflatex="pdflatex --shell-escape %O %S" $<
	mv domains.pdf graphics

plot_Ih.pdf: plot_Ih.tex
	latexmk -pdf -pdflatex="pdflatex --shell-escape %O %S" $<
	mv plot_Ih.pdf graphics

plot_Ih_clement.pdf: plot_Ih_clement.tex
	latexmk -pdf -pdflatex="pdflatex --shell-escape %O %S" $<
	mv plot_Ih_clement.pdf graphics

plot_Ih_L2.pdf: plot_Ih_L2.tex
	latexmk -pdf -pdflatex="pdflatex --shell-escape %O %S" $<
	mv plot_Ih_L2.pdf graphics

rate_plot.pdf: rate_plot.tex rate_data.txt
	latexmk -pdf -pdflatex="pdflatex --shell-escape %O %S" $<
	mv rate_plot.pdf graphics

poster.pdf: poster.tex qrfenicstools.pdf qrposter.pdf qrextras.pdf domains.pdf plot_Ih.pdf plot_Ih_clement.pdf rate_plot.pdf
	latexmk -pdf -pdflatex="pdflatex --shell-escape %O %S" $<

extras: extras.tex
	latexmk -pdf -pdflatex="pdflatex --shell-escape %O %S" $<

view: 
	evince poster.pdf &

clean:
	latexmk -C
