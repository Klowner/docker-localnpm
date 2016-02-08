TAG=klowner/local-npm
REV=latest
DEV_TAG=4.2-dev

all: build

foo:
	@echo ${UID} ${PWD}

node_modules:
	@docker pull iron/node:${DEV_TAG}
	@docker run --rm -v ${PWD}:/app -w /app iron/node:${DEV_TAG} npm install
	@docker run --rm -v ${PWD}:/app -w /app iron/node:${DEV_TAG} npm dedupe

build: node_modules
	@docker build --tag=${TAG}:${REV} .

push: build
	@docker push ${TAG}:${REV}

clean:
	@sudo rm -rf node_modules
