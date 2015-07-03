build: Dockerfile
	docker build -t mini-nodejs .

tag: build
	docker tag -f mini-nodejs mutterio/mini-nodejs

publish: tag
	docker push mutterio/mini-nodejs
