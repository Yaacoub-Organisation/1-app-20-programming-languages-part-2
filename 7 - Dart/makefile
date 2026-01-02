IMAGE_NAME?=calculator_dart
CONTAINER_NAME?=calculator_dart

.DEFAULT_GOAL := run
.PHONY: build run tests clean

build:
	docker build -t $(IMAGE_NAME) .

run: build
	docker run --rm -it --name $(CONTAINER_NAME) $(IMAGE_NAME) sh -c "dart --disable-analytics run calculator.dart"

tests: build
	docker run --rm -it --name $(CONTAINER_NAME) $(IMAGE_NAME) sh -c "dart --disable-analytics run tests.dart"

clean:
	docker rmi $(IMAGE_NAME) || true
	docker rm -f $(CONTAINER_NAME) || true