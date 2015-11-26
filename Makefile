REGISTRY=mutterio
NAME=mini-node
VERSION?=4.2.2

build: Dockerfile
	# docker build -t ${NAME}-${VERSION} --build-arg VERSION=${VERSION} .
	docker build -t ${NAME}-${VERSION}-slim --build-arg VERSION=${VERSION} -f slim/Dockerfile .

tag: build
	docker tag -f ${NAME}-${VERSION} ${REGISTRY}/${NAME}:${VERSION}
	docker tag -f ${NAME}-${VERSION}-slim ${REGISTRY}/${NAME}:${VERSION}-slim

# publish: tag
# 	docker push ${REGISTRY}/${NAME}:${TAG}
# 	docker push ${REGISTRY}/${NAME}:${TAG}
