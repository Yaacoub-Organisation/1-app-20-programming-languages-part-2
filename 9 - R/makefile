IMAGE_NAME?=calculator_r
CONTAINER_NAME?=calculator_r

.DEFAULT_GOAL := run
.PHONY: build run tests clean

build:
	docker build -t $(IMAGE_NAME) .

run: build
	docker run --rm -it --name $(CONTAINER_NAME) $(IMAGE_NAME) sh -c "Rscript calculator.R"

tests: build
	docker run --rm -it --name $(CONTAINER_NAME) $(IMAGE_NAME) sh -c "Rscript tests.R"

clean:
	docker rmi $(IMAGE_NAME) || true
	docker rm -f $(CONTAINER_NAME) || true