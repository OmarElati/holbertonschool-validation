build:	## Compile source code of the application to a binary
	go build

run:	## Run the application in background by executing the binary and write log into a file
	./awesome-api >./awesome-api.log 2>&1 &

stop:	## Stop the application with the command pkill
	pkill awesome-api || true

clean:	## Stop the application and Delete the binary and log file
	pkill awesome-api || true
	rm -rf awesome-api awesome-api.log

test:	## Test it to ensure that it behaves as expected
	curl http://localhost:9999
	curl http://localhost:9999/health

lint:	## 	Fail when the linter catches and error
	golangci-lint run

help:	## Display this help message.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
