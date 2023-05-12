#!/bin/bash

set -e

# Update the package lists
apt-get update

# Install required packages
apt-get install -y curl git

# Install Hugo
HUGO_VERSION=0.88.1
curl -L -o hugo.tar.gz "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz"
tar -xf hugo.tar.gz
mv hugo /usr/local/bin/

# Install Make
apt-get install -y make

# Run the build command
make build

# Clone the project repository
git clone https://github.com/OmarElati/holbertonschool-validation.git

# Navigate to the project directory
cd holbertonschool-validation

# Verify the presence of the generated website
if [ -f ./dist/index.html ]; then
    echo "SETUPOK: Website generated successfully."
else
    echo "SETUPERROR: Website generation failed."
    exit 1
fi
