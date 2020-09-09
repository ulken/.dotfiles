#!/usr/bin/env bash

shell=$(dscl . -read ~/ UserShell | rev | cut -d ' ' -f 1 | rev | xargs basename)

if ! [ "$shell" = "zsh" ]; then
    chsh -s "$(which zsh)"
fi
