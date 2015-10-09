REGISTRY=mutterio
NAME=mini-nodejs
TAG=builder

build: Dockerfile
	docker build -t ${NAME} .

tag: build
	docker tag -f ${NAME} ${REGISTRY}/${NAME}:${TAG}

publish: tag
	docker push ${REGISTRY}/${NAME}:${TAG}
