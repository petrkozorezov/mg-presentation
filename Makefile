BUILD_UTILS   := build_utils
DOCKER         = $(shell which docker 2>/dev/null)
BS             = $(shell which bs 2>/dev/null)
PUML           = $(shell which puml 2>/dev/null)
DOCKROSS       = ./dockross
DOCKROSS_PORTS_ARGS = '-p 4100:4100'
DOCKROSS_PRIV_ARGS  = '--privileged'
SVG_FILES           = uml/payment_flow.svg uml/payment_tech_interact_flow.svg uml/payment_money_flow.svg uml/payment_fsm.svg uml/mg_arch.svg uml/mg_arch_real.svg uml/mg_start.svg uml/mg_call.svg uml/mg_timer.svg uml/mg_payment_start.svg uml/mg_payment_af.svg uml/mg_payment_auth.svg uml/mg_payment_notify.svg
.PHONY: d_sh d_% ds_sh ds_% dia serve

## Execute within dockross build image -p 4100:4100

d_sh: $(DOCKROSS)
	$(DOCKROSS) bash

d_%: $(DOCKROSS)
	$(DOCKROSS) make $*

## with privileged mode
dp_sh: $(DOCKROSS)
	DOCKCROSS_ARGS=$(DOCKROSS_PRIV_ARGS) $(DOCKROSS) bash

dp_%: $(DOCKROSS)
	DOCKCROSS_ARGS=$(DOCKROSS_PRIV_ARGS) $(DOCKROSS) make $*

## with port mapping
ds_sh: $(DOCKROSS)
	DOCKCROSS_ARGS=$(DOCKROSS_PORTS_ARGS) $(DOCKROSS) bash

ds_%: $(DOCKROSS)
	DOCKCROSS_ARGS=$(DOCKROSS_PORTS_ARGS) $(DOCKROSS) make $*

$(DOCKROSS):
	$(DOCKER) build -t backslide-build-image $(BUILD_UTILS)
	$(DOCKER) run backslide-build-image > $(DOCKROSS)
	chmod +x $(DOCKROSS)

## Normal targets: execute with local rebar3

uml/%.svg: uml/%.puml
	$(PUML) generate uml/$*.puml -s -o uml/$*.svg

dia: $(SVG_FILES)

serve: dia
	$(BS) serve

pdf: dia
	$(BS) pdf

clean:
	rm -rf $(SVG_FILES) $(DOCKROSS)
