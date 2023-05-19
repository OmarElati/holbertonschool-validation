BINARY_NAME := awesome-api
LOG_FILE := awesome-api.log

build: lint # Compile the source code of the application
	go build -o $(BINARY_NAME)

run: # Run the application in the background
	./$(BINARY_NAME) > $(LOG_FILE) 2>&1 &

stop: # Stop the running application
	-pkill -f $(BINARY_NAME)
	sleep 1
	-pgrep -f $(BINARY_NAME) | xargs -r kill -9

clean: stop ## Clean up the application
	-rm -f $(BINARY_NAME) $(LOG_FILE)

test: # Test the application
	@./awesome-api > awesome-api.log 2>&1 & echo $$! > awesome-api.pid; \
	sleep 1; \
	if ! curl -s http://localhost:9999 | grep -q "404"; then \
		echo "TESTFAILED: Application is not running"; \
		kill `cat awesome-api.pid` || true; \
		rm -f awesome-api.pid; \
		exit 1; \
	fi; \
	if ! curl -s http://localhost:9999/health | grep -q "ALIVE"; then \
		echo "TESTFAILED: Application is not running"; \
		kill `cat awesome-api.pid` || true; \
		rm -f awesome-api.pid; \
		exit 1; \
	fi; \
	kill `cat awesome-api.pid` || true; \
	rm -f awesome-api.pid

lint: # Lint target
	golangci-lint run

help: # Display help information
	@echo "Available targets:"
	@echo "  build    : Compile the source code of the application"
	@echo "  run      : Run the application in the background"
	@echo "  stop     : Stop the running application"
	@echo "  clean    : Clean up the application"
	@echo "  test     : Test the application"
	@echo "  help     : Display help information"
	@echo "  lint     : Lint target"
