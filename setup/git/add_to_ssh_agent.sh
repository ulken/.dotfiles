#!/usr/bin/env bash

key="${1:-id_rsa}"

# start SSH agent in background
eval "$(ssh-agent -s)"

# add private key to agent
ssh-add -K "$HOME/.ssh/$key"
