# Makefile

BINARY_NAME := awesome-api
LOG_FILE := $(BINARY_NAME).log
.DEFAULT_GOAL := help

.PHONY: build ## Compile the source code to binary.
build:
	go build -o $(BINARY_NAME) main.go

.PHONY: run ## Run the application in the background.
run:
	nohup ./$(BINARY_NAME) > $(LOG_FILE) 2>&1 &

.PHONY: stop ## Stop the application.
stop:
	pkill $(BINARY_NAME) || true

.PHONY: clean ## Stop the application and remove binary and log file.
clean:
	pkill $(BINARY_NAME) || true
	rm -f $(BINARY_NAME) $(LOG_FILE)

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
