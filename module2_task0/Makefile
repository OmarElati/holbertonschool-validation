BINARY_NAME := awesome-api
LOG_FILE := awesome-api.log

build:
	go build -o awesome-api

run: # Run the application in the background and write logs to a file
	./awesome-api > awesome-api.log 2>&1 &

stop: # Stop the application by killing the process
	-pkill -f awesome-api
	sleep 1
	-pgrep -f awesome-api | xargs -r kill -9

clean: # Clean up the application by stopping it, deleting the binary, and log file
	rm -f awesome-api awesome-api.log

test: # Test the application by making requests to the server
	@./awesome-api > awesome-api.log 2>&1 & echo $$! > awesome-api.pid; \
	sleep 1; \
	if curl -s http://localhost:9999 | grep -q "404"; then \
		echo "TESTFAILED: Application is not running"; \
		if [ -f "awesome-api.pid" ]; then \
			kill `cat awesome-api.pid`; \
			rm -f awesome-api.pid; \
		fi; \
		exit 1; \
	else \
		echo "TESTOK"; \
	fi; \
	if curl -s http://localhost:9999/health | grep -q "ALIVE"; then \
		echo "TESTFAILED: Application is not running"; \
		if [ -f "awesome-api.pid" ]; then \
			kill `cat awesome-api.pid`; \
			rm -f awesome-api.pid; \
		fi; \
		exit 1; \
	else \
		echo "TESTOK"; \
	fi; \
	if [ -f "awesome-api.pid" ]; then \
		kill `cat awesome-api.pid`; \
		rm -f awesome-api.pid; \
	fi

help: # Display help information
	@echo "Available targets:"
	@echo "  build    - Compile the source code of the application"
	@echo "  run      - Run the application in the background"
	@echo "  stop     - Stop the running application"
	@echo "  clean    - Clean up the application"
	@echo "  test     - Test the application"
	@echo "  help     - Display this help message"
