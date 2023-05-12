#!/bin/bash

# Update the package lists
apt-get update

# Install required packages
apt-get install -y hugo make

# Verify if the installation was successful
if command -v hugo >/dev/null 2>&1 && command -v make >/dev/null 2>&1; then
  echo "SETUPOK"
else
  echo "SETUPERROR"
fi

# Run the build command
make build

# Verify if the website was generated successfully
if [ -d "dist" ]; then
  echo "GENERATIONOK"
else
  echo "GENERATIONERROR"
  exit 1
fi
