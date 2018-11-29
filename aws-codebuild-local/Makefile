.SILENT:

all: aws-codebuild-local

aws-codebuild-local:
	docker build -t $@ .

test:
	../local_builds/codebuild_build.sh -i ubuntu:18.10 -a /tmp -d
