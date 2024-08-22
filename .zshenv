# shellcheck shell=sh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE

export EDITOR="vim"

export DOTFILES_REPOSITORY=".dotfiles"
export ZSH_HOME="$HOME/.zsh"

# homebrew
export HOMEBREW_CASK_OPTS="--no-quarantine" # don't show "Are you sure you want to..." when first launching an (cask) app

# prompt
export PURE_GIT_UNTRACKED_DIRTY=1

# vim mode
export MODE_INDICATOR="" # already handled by theme prompt

# go
export GOPATH="$HOME/go"
export GOROOT="/usr/local/go"
export GOBIN="$GOPATH/bin"

# 1password ssh agent
export SSH_AUTH_SOCK="~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

# pnpm
export PNPM_HOME="/Users/ulken/Library/pnpm"

# azure functions
export FUNCTIONS_CORE_TOOLS_TELEMETRY_OPTOUT=true

# rust
. "$HOME/.cargo/env"
