# Website Project

This repository contains a website project built with Go-Hugo and Make.

## Prerequisites

Before building the website, make sure you have the following requirements:

- Go-Hugo: The website is built using Go-Hugo, a static site generator.Make sure Go-Hugo is installed on your system.
- Make

## Lifecycle

- Build the website: Run `make build` to generate the website in the `dist` directory.
- Clean the dist directory: Run `make clean` to remove the contents of the `dist` directory.
- Create a new blog post: Run `make post POST_NAME=<post_name> POST_TITLE=<post_title>` to create a new blog post with the specified name and title.

## Usage

To build and manage the website, you can use the following Makefile targets:

- `make build`: Generate the website files in the `dist/` directory.
- `make serve`: Start a local server to preview the website.
- `make clean`: Remove the `dist/` directory and any generated files.
- `make post`: Create a new blog post file in the `content/posts/` directory with a randomly generated title.

For more details on each target, use the `make help` command.
