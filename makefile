SERVICES := nginx

.PHONY: all build $(SERVICES)

all: build

# Run `make build` at the top level to build all service images
build: $(SERVICES)

# Run `make nginx` or `make vault` from top-level directory to build service
$(SERVICES):
	$(MAKE) -C services/$@