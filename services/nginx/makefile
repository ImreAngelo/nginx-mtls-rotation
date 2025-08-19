IMAGE_NAME = nginx-mtls
TAG = latest
DOCKERFILE = Dockerfile
CONTEXT = .

.PHONY: build push run

# Build the Docker image
build:
	docker build -t $(IMAGE_NAME):$(TAG) -f $(DOCKERFILE) $(CONTEXT)

# Run locally with Docker for testing
run:
	docker run --rm -p 8080:80 -p 8443:443 $(IMAGE_NAME):$(TAG)

# Push to registry
push:
	docker push $(IMAGE_NAME):$(TAG)