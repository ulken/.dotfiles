#!/usr/bin/env bash

email="$1"
key="${2:-id_rsa}"

if [ -z "$email" ]; then
  email="$(git config --global user.email)"
fi

ssh-keygen -t rsa -b 4096 -C "$email" -f "$HOME/.ssh/$key"

pbcopy < "$HOME/.ssh/$key.pub"
echo "Public SSH key copied to clipboard!"
