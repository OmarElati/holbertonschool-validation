#!/bin/bash

set -e

# Update the package lists
apt-get update

# Install required packages
apt-get install -y hugo make

# Run the build command
make build

# Clone the project repository
git clone https://github.com/OmarElati/holbertonschool-validation.git

# Navigate to the project directory
cd holbertonschool-validation

# Verify the presence of the generated website
if [ -f ./dist/index.html ]; then
    echo "Website generated successfully."
else
    echo "Error: Website generation failed."
    exit 1
fi
