IMAGE = aididalam/simple-webpage

ifndef TAG
$(error TAG is required. Usage: make TAG=v1.0.0)
endif

.PHONY: build push all

all: build push

build:
	docker buildx build \
		--platform linux/amd64,linux/arm64 \
		-t $(IMAGE):$(TAG) \
		--push \
		.

push:
	docker push $(IMAGE):$(TAG)
