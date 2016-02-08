TAG=klowner/local-npm
REV=latest

all: build

foo:
	@echo ${UID} ${PWD}

deps:
	@docker pull iron/node:dev
	@docker run --rm -v ${PWD}:/app -w /app iron/node:dev npm install --no-progress
	@docker run --rm -v ${PWD}:/app -w /app iron/node:dev npm dedupe

build: deps
	@docker build --tag=${TAG}:${REV} .

push: build
	@docker push ${TAG}:${REV}

