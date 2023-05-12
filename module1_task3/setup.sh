#!/bin/bash

# Update the package lists
apt-get update

# Install required packages
apt-get install -y hugo make

# Run the build command
make build
