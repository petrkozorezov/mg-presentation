-include ../../Makefile
BS        = $(shell which bs 2>/dev/null)
PUML      = $(shell which puml 2>/dev/null)
SVG_FILES = img/bid-request-seq.svg img/happy-pass-arch.svg

.PHONY: serve pdf img

img/%.svg: img/%.puml
	$(PUML) generate img/$*.puml -s -o img/$*.svg

img: $(SVG_FILES)

serve: img
	$(BS) serve

pdf: img
	$(BS) pdf

clean:
	rm -rf $(SVG_FILES) pdf/*
