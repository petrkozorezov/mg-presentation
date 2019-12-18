BUILD_UTILS   := ../../build_utils
DOCKER         = docker
DOCKROSS       = ../../dockross
DOCKROSS_PORTS_ARGS = '-p 4100:4100'
DOCKROSS_PRIV_ARGS  = '--privileged'

.PHONY: d_sh d_% ds_sh ds_% dp_% dp_sh

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
