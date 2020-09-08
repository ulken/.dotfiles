#!/usr/bin/env bash

# ensure Homebrew is installed and up-to-date

INSTALL_SCRIPT_URL="https://raw.githubusercontent.com/Homebrew/install/master/install.sh"

command_exists() {
    command -v "$1" >/dev/null 2>&1 
}

install_brew() {
    /bin/bash -c "$(curl -fsSL $INSTALL_SCRIPT_URL)"
}

if ! command_exists brew; then
    echo "Setting up brewery..."
    install_brew
    echo "✅ Homebrew installed"
else
    echo "✅ Brewery already up and running"
fi

echo "Refilling kegs..."
brew doctor
brew update

# time to get brewing
echo "Time to brew!"
brew bundle install