# Testing in the Software Development Methodology

## Description

simple HTTP web server written in the Golang language.
This HTTP webserver is expected to listen to incoming HTTP requests on localhost:9999:

    If a request hits the path / (e.g. http://localhost:9999/ or http://localhost:9999) then you expect a 404 Not Found (the homepage is not implemented in this task)
    If a request hits the path /health (e.g. http://localhost:9999/health) then you expect the server to answer ALIVE if it is up and running


## Usage
1. Build the project: `make build`
2. Run the project: `make run`
3. Stop the project: `make stop`
4. Clean up the project: `make clean`
5. Test the project: `make test`

## Makefile Targets

- `build`: Compile the source code of the application.
- `run`: Run the application in the background.
- `stop`: Stop the running application.
- `clean`: Clean up the application.
- `test`: Test the application.
- `help`: Display this help message.
