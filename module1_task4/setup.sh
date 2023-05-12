#!/bin/bash

set -e

# Check if Hugo is already installed
if ! command -v hugo >/dev/null 2>&1; then
    # Update the package lists
    apt-get update

    # Install Hugo
    apt-get install -y hugo
fi

# Check if Make is already installed
if ! command -v make >/dev/null 2>&1; then
    # Install Make
    apt-get install -y make
fi

# Clone the project repository
git clone https://github.com/OmarElati/holbertonschool-validation.git

# Navigate to the project directory
cd holbertonschool-validation

# Build the website using Make
make build

# Verify the presence of the generated website
if [ -f ./dist/index.html ]; then
    echo "Website generated successfully."
else
    echo "Error: Website generation failed."
    exit 1
fi
