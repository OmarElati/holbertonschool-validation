# Makefile

.DEFAULT_GOAL := help

.PHONY: build ## Compile the source code to binary.
build:
	go build

.PHONY: run ## Run the application in the background.
run:
	./awesome-api > ./awesome-api.log 2>&1 &

.PHONY: stop ## Stop the application.
stop:
	pkill awesome-api || true

.PHONY: clean ## Stop the application and remove binary and log file.
clean:
	pkill awesome-api || true
	rm -rf awesome-api awesome-api.log

.PHONY: test ## Test the application by sending requests.
test:
	curl http://localhost:9999
	curl http://localhost:9999/health

.PHONY: lint ## Fail when the linter catches an error.
lint:
	golangci-lint run

.PHONY: help ## Print this help message.
help:
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
