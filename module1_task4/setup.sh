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
