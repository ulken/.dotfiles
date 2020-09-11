#!/usr/bin/env bash

SOURCE_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROPERTY_LIST_PATH="$SOURCE_PATH/com.ulknest.brew-update.plist"

cp "$PROPERTY_LIST_PATH" "$HOME/Library/LaunchAgents/"

launchctl load "$PROPERTY_LIST_PATH"
