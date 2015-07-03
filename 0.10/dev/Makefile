build: Dockerfile
	docker build -t mini-nodejs:builder .

tag: build
	docker tag -f mini-nodejs:builder mutterio/mini-nodejs:builder

publish: tag
	docker push mutterio/mini-nodejs:builder
