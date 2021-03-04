# shellcheck shell=sh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=1000

export EDITOR="vim"

export DOTFILES_REPOSITORY=".dotfiles"
export ZSH_HOME="$HOME/.zsh"

# homebrew
export HOMEBREW_CASK_OPTS="--no-quarantine" # don't show "Are you sure you want to..." when first launching an (cask) app 

# prompt
export PURE_GIT_UNTRACKED_DIRTY=1

# vim mode
export MODE_INDICATOR="" # already handled by theme prompt

# thefuck
export THEFUCK_REQUIRE_CONFIRMATION=false
