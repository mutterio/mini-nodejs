REGISTRY=mutterio
NAME=mini-node
VERSION?=5.1.1

build: Dockerfile
	docker build -t ${NAME}-${VERSION} --build-arg VERSION=${VERSION} .
	docker build -t ${NAME}-${VERSION}-slim --build-arg VERSION=${VERSION} -f slim/Dockerfile .

tag: build
	docker tag -f ${NAME}-${VERSION} ${REGISTRY}/${NAME}:${VERSION}
	docker tag -f ${NAME}-${VERSION}-slim ${REGISTRY}/${NAME}:${VERSION}-slim

publish: tag
	docker push ${REGISTRY}/${NAME}:${VERSION}
	docker push ${REGISTRY}/${NAME}:${VERSION}-slim
