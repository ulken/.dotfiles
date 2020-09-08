#!/usr/bin/env bash

# immediately exit on error
set -e

# check for necessary prerequisites
if ! xcode-select -p >/dev/null 2>&1; then
    echo "Xcode Command Line Tools required, please run: `xcode-select --install`"
    exit 2 # missing command
fi

./brew.sh
./post_install.sh
