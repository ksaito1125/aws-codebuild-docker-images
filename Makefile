BUILDS=$(shell egrep -o 'ubuntu/[^ ]*' buildspec.yml | sed 's|^ubuntu/||')
NAME=$(shell dirname $@)
VERSION=$(shell basename $@)
TAG=aws/codebuild/$(NAME):$(VERSION)

.SILENT:

all: $(BUILDS)

$(BUILDS):
	cd ubuntu/$(NAME)/$(VERSION) && \
	docker build -t $(TAG) .

.PHONY: aws-codebuild-local
aws-codebuild-local:
	$(MAKE) -C $@
