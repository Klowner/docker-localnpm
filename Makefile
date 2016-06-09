REPO=klowner/local-npm
REV=$(shell egrep -o "([0-9]\.*)+" package.json)

.PHONY: all build push clean test

all: build

node_modules: package.json
	@docker pull iron/node:dev
	@docker run --rm -v ${PWD}:/app -w /app iron/node:dev npm install --no-progress
	@docker run --rm -v ${PWD}:/app -w /app iron/node:dev npm dedupe

build: node_modules
	@docker pull iron/node:latest
	@docker build --tag=${REPO}:${REV} .
	@docker build --tag=${REPO}:latest .

push: build
	@docker push ${REPO}:${REV}
	@docker push ${REPO}:latest

clean:
	@sudo rm -rf node_modules

test:
	@docker run --rm -v ${PWD}/data:/data ${REPO}:${REV} app:help
