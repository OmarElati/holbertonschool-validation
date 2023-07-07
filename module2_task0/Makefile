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
	$(MAKE) run
	sleep 2
	@curl -s http://localhost:9999 > /dev/null && curl -s http://localhost:9999/health > /dev/null || (echo "TESTFAILED" && exit 1)
	@pkill $(BINARY_NAME)
	@grep -q -e "TESTFAILED" -e "TESTOK" -e "ALIVE" -e "404" $(LOG_FILE) && (echo "TESTFAILED" && exit 1) || true

.PHONY: help ## Print this help message.
help:
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
