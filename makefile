SERVICES := nginx vault

.PHONY: all build $(SERVICES)

all: build


##########
# DOCKER #
##########

# Run `make build` at the top level to build all service images
build: $(SERVICES)

# Run `make nginx` or `make vault` from top-level directory to build specific service
$(SERVICES):
	$(MAKE) -C services/$@


##############
# KUBERNETES #
##############

# Deploy all k8s resources via kustomize
k8s-deploy:
	kubectl apply -k services

# Delete all k8s resources
k8s-delete:
	kubectl delete -k services


# Local development environment
port-forward:
	@echo "Site running on http://localhost and https://localhost"
	@kubectl port-forward svc/nginx 80:80 443:443

dev: k8s-deploy
	@sleep 2
	port-forward
