IMAGE_NAME?=calculator_kotlin
CONTAINER_NAME?=calculator_kotlin

.DEFAULT_GOAL := run
.PHONY: build run tests clean

build:
	docker build -t $(IMAGE_NAME) .

run: build
	docker run --rm -it --name $(CONTAINER_NAME) $(IMAGE_NAME) sh -c "kotlinc calculator.kt tests.kt -d out && kotlin -classpath out CalculatorKt"

tests: build
	docker run --rm -it --name $(CONTAINER_NAME) $(IMAGE_NAME) sh -c "kotlinc calculator.kt tests.kt -d out && kotlin -classpath out TestsKt"

clean:
	docker rmi $(IMAGE_NAME) || true
	docker rm -f $(CONTAINER_NAME) || true
