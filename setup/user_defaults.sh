#!/usr/bin/env bash

echo "Applying user defaults"

# repeat keys by pressing and holding down
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# initial key repeat delay
defaults write -g InitialKeyRepeat -int 14

# key repeat rate
defaults write -g KeyRepeat -float 1.3

# show ~/Library
chflags nohidden ~/Library

# show hidden files
defaults write com.apple.finder AppleShowAllFiles YES

# show path bar
defaults write com.apple.finder ShowPathbar -bool true

# show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# default to PNG for screenshots
defaults write com.apple.screencapture type png

# default location for screenshots
SCREENSHOTS_PATH=~/Pictures/screenshots

mkdir -p "$SCREENSHOTS_PATH"

defaults write com.apple.screencapture location "$SCREENSHOTS_PATH"

# disable boot-up sound
sudo nvram SystemAudioVolume=%80

# allow installs from anywhere
sudo spctl —master-disable

# disable downloaded applications warning
defaults write com.apple.LaunchServices LSQuarantine -bool NO

# kill/reboot affected services
killall SystemUIServer
