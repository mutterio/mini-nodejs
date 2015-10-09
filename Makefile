REGISTRY=mutterio
NAME=mini-nodejs
TAG=latest

build: Dockerfile
	docker build -t ${NAME} .
	docker build -t ${NAME}-slim -f Dockerfile.slim .

tag: build
	docker tag -f ${NAME} ${REGISTRY}/${NAME}:${TAG}
	docker tag -f ${NAME}-slim ${REGISTRY}/${NAME}:slim

publish: tag
	docker push ${REGISTRY}/${NAME}:${TAG}
