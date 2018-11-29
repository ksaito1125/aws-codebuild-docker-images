BUILDS=$(shell egrep -o 'ubuntu/[^ ]*' buildspec.yml | sed 's|^ubuntu/||')
NAME=$(shell dirname $@)
VERSION=$(shell basename $@)
TAG=aws/codebuild/$(NAME):$(VERSION)
BLD_OPTS=$(if http_proxy, --build-arg http_proxy=$$http_proxy --build-arg https_proxy=$$https_proxy --build-arg no_proxy=$$no_proxy)

.SILENT:

all: $(BUILDS)

$(BUILDS):
	cd ubuntu/$(NAME)/$(VERSION) && \
	docker build $(BLD_OPTS) -t $(TAG) .

BUILDS_LOCAL=aws-codebuild-local test
.PHONY: aws-codebuild-local
$(BUILDS_LOCAL):
	$(MAKE) -C aws-codebuild-local $@
