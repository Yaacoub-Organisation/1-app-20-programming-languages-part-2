IMAGE_NAME?=calculator_rs
CONTAINER_NAME?=calculator_rs

.DEFAULT_GOAL := run
.PHONY: build run tests clean

build:
	docker build -t $(IMAGE_NAME) .

run: build
	docker run --rm -it --name $(CONTAINER_NAME) $(IMAGE_NAME) sh -c "cargo run --quiet"

tests: build
	docker run --rm -it --name $(CONTAINER_NAME) $(IMAGE_NAME) sh -c "cargo test --tests --quiet"

clean:
	docker rmi $(IMAGE_NAME) || true
	docker rm -f $(CONTAINER_NAME) || true
