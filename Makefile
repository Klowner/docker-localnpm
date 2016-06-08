REPO=klowner/local-npm
REV=$(shell egrep -o "([0-9]\.*)+" package.json)

all: build

deps:
	@docker pull iron/node:latest
	@docker pull iron/node:dev
	@docker run --rm -v ${PWD}:/app -w /app iron/node:dev npm install --no-progress
	@docker run --rm -v ${PWD}:/app -w /app iron/node:dev npm dedupe

build: deps
	@docker build --tag=${REPO}:${REV} .
	@docker build --tag=${REPO}:latest .

push: build
	@docker push ${REPO}:${REV}
	@docker push ${REPO}:latest

clean:
	@sudo rm -rf node_modules
