SERVICES := $(wildcard services/*)

.PHONY: all build

all: build

# Run `make build` at the top level to build all service images
build:
	@for svc in $(SERVICES); do \
		echo "Building $$svc..."; \
		$(MAKE) -C $$svc build; \
	done
