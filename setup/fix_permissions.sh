#!/usr/bin/env bash

echo "Fixing file permissions"

# remove quarantine attribute from Quick Look plugins
xattr -d -r com.apple.quarantine ~/Library/QuickLook