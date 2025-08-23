SERVICES := nginx

.PHONY: all build $(SERVICES) apply k8s-deploy clean k8s-delete dev

all: k8s-deploy


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
apply: k8s-deploy
k8s-deploy:
	kubectl apply -k services

# Delete all k8s resources
clean: k8s-delete
k8s-delete:
	kubectl delete -k services

# Local development environment
dev: build k8s-deploy
	@echo "Site running on https://localhost"

# Just for debugging
# TODO: Make first-time install script
k8s-install:
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.13.1/deploy/static/provider/cloud/deploy.yaml
	cd services/networking/bootstrap && kubectl create secret tls nginx-cache-tls \
		--cert=tls.crt \
		--key=tls.key