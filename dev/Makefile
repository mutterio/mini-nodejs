REGISTRY=mutterio
NAME=mini-nodejs
TAG=builder_4.1.2

build: Dockerfile
	docker build -t ${NAME} .

tag: build
	docker tag -f ${NAME} ${REGISTRY}/${NAME}:${TAG}

publish: tag
	docker push ${REGISTRY}/${NAME}:${TAG}
