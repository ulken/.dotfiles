#!/usr/bin/env bash

PROPERTY_LIST_FILE="com.ulknest.brew-update.plist"

cp "./$PROPERTY_LIST_FILE" "$HOME/Library/LaunchAgents/"

launchctl load "$PROPERTY_LIST_FILE"
