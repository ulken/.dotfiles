#!/usr/bin/env bash

shell=$(dscl . -read ~/ UserShell)

if ! [ "$shell" = "$(brew --prefix)/bin/zsh" ]; then
  chsh -s "$(which zsh)"
fi
