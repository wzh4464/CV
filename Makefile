# Unified build for Zihan Wu's CV (shared across all branches).
# `main.tex` is the only per-branch content; everything else is shared infra.

MAIN    := main
LATEXMK := latexmk
PDF     := $(MAIN).pdf

.PHONY: all build clean distclean watch

all: build

build: $(PDF)

$(PDF): $(MAIN).tex financecv.cls
	$(LATEXMK) -pdf -interaction=nonstopmode -halt-on-error -synctex=1 $(MAIN).tex

watch:
	$(LATEXMK) -pdf -pvc -interaction=nonstopmode -synctex=1 $(MAIN).tex

# Remove build artifacts but keep the PDF.
clean:
	$(LATEXMK) -c $(MAIN).tex
	rm -f $(MAIN).synctex.gz

# Remove everything generated, including the PDF.
distclean:
	$(LATEXMK) -C $(MAIN).tex
	rm -f $(MAIN).synctex.gz
