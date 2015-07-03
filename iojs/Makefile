build: Dockerfile
	docker build -t mini-iojs .

tag: build
	docker tag -f mini-iojs mutterio/mini-iojs:2.3

publish: tag
	docker push mutterio/mini-iojs
