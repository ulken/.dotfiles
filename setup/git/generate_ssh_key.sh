#!/usr/bin/env bash

email="$1"

if [ -z "$email" ]; then
	email="$(git config --global user.email)"
fi

ssh-keygen -t rsa -b 4096 -C "$email"