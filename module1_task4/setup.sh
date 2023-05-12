#!/bin/bash

set -e

# Check if Hugo is already installed
if ! command -v hugo >/dev/null 2>&1; then
    # Download Hugo
    HUGO_VERSION=0.88.1
    wget -q "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.deb" -O hugo.deb

    # Install Hugo
    dpkg -i hugo.deb
    apt-get install -f -y
    rm hugo.deb
fi

# Install Make if not already installed
apt-get update
apt-get install -y make

# Build the website using Make
make build

# Verify the presence of the generated website
if [ -f ./dist/index.html ]; then
    echo "SETUPOK: Website generated successfully."
else
    echo "SETUPERROR: Website generation failed."
    exit 1
fi
