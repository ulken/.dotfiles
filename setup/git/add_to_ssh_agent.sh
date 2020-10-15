#!/usr/bin/env bash

key="${1:-id_rsa}"

# add private key to agent
ssh-add -K "$HOME/.ssh/$key"

