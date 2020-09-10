#!/usr/bin/env bash

name="$1"
email="$2"

if [ -z "$name" ]; then
	echo "User name required"
	exit 1
fi

if [ -z "$email" ]; then
	echo "User email required"
	exit 1
fi

git config --global user.name "$name"
git config --global user.email "$email"

echo "Git user name: $(git config --global user.name)"
echo "Git user email: $(git config --global user.email)"