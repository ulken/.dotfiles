#!/usr/bin/env bash

key="${1:-id_rsa}"

# start SSH agent in background
eval "$(ssh-agent -s)"

# add private key to agent
ssh-add -K "$HOME/.ssh/$key"

# copy public key to clipboard
pbcopy < "$HOME/.ssh/$key.pub"
echo "Public SSH key copied to clipboard!"