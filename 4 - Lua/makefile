IMAGE_NAME?=calculator_lua
CONTAINER_NAME?=calculator_lua

.DEFAULT_GOAL := run
.PHONY: build run tests clean

build:
	docker build -t $(IMAGE_NAME) .

run: build
	docker run --rm -it --name $(CONTAINER_NAME) $(IMAGE_NAME) sh -c "lua calculator.lua"

tests: build
	docker run --rm -it --name $(CONTAINER_NAME) $(IMAGE_NAME) sh -c "lua tests.lua"

clean:
	docker rmi $(IMAGE_NAME) || true
	docker rm -f $(CONTAINER_NAME) || true
