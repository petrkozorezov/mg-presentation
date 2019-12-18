-include ../../Makefile

BS        = bs
PUML      = puml
SVG_FILES = uml/payment_flow.svg uml/payment_tech_interact_flow.svg uml/payment_money_flow.svg uml/payment_fsm.svg uml/mg_arch.svg uml/mg_arch_real.svg uml/mg_start.svg uml/mg_call.svg uml/mg_timer.svg uml/mg_payment_start.svg uml/mg_payment_af.svg uml/mg_payment_auth.svg uml/mg_payment_notify.svg

.PHONY: dia pdf clean

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

echo:
	echo $(PUML)
