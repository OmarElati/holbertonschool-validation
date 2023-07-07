# Makefile

BINARY_NAME := awesome-api
LOG_FILE := $(BINARY_NAME).log
.DEFAULT_GOAL := help

.PHONY: build
build:
	go build -o $(BINARY_NAME) main.go

.PHONY: run
run:
	nohup ./$(BINARY_NAME) > $(LOG_FILE) 2>&1 &

.PHONY: stop
stop:
	pkill $(BINARY_NAME) || true

.PHONY: clean
clean: stop
	@lsof -ti :9999 | xargs kill -9 || true
	rm -f $(BINARY_NAME) $(LOG_FILE)

.PHONY: test
test:
	$(MAKE) run
	sleep 2
	@pkill $(BINARY_NAME)
	@grep -q "TESTFAILED" $(LOG_FILE) || (echo "TESTFAILED" && exit 1)
	@grep -q -e "TESTOK" -e "ALIVE" -e "404" $(LOG_FILE) && (echo "TESTFAILED" && exit 1) || true

.PHONY: help
help:
	@echo "help: Print this help message."
	@echo "build: Compile the source code to binary."
	@echo "run: Run the application in the background."
	@echo "stop: Stop the application."
	@echo "clean: Stop the application and remove binary and log file."
	@echo "test: Test the application by sending requests."
