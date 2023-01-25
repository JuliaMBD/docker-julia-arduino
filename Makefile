image = okamumu/julia
tag = 1.8.3-arduino

build-amd64:
	docker build -f Dockerfile -t $(image):$(tag)-amd64 .

push-amd64:
	docker push $(image):$(tag)-amd64

clean-amd64:
	docker rmi $(image):$(tag)-amd64

build-arm64:
	docker build -f Dockerfile -t $(image):$(tag)-arm64 .

push-arm64:
	docker push $(image):$(tag)-arm64

clean-arm64:
	docker rmi $(image):$(tag)-arm64

push-multi:
	docker manifest create $(image):$(tag) $(image):$(tag)-amd64 $(image):$(tag)-arm64
	docker manifest push $(image):$(tag)

