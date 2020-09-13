# shellcheck shell=bash

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

DOTFILES_REPOSITORY=".dotfiles"
ZSH_HOME="$HOME/.zsh"

function .fs() {
  "$(which git)" --git-dir="$HOME/$DOTFILES_REPOSITORY" --work-tree="$HOME" "$@"
}

# prompt
# shellcheck disable=SC2034
PURE_GIT_UNTRACKED_DIRTY=1

fpath+="$ZSH_HOME/pure"

autoload -U promptinit
promptinit
prompt pure

# plugins

# shellcheck disable=SC1090
source "$ZSH_HOME/zsh-autosuggestions/zsh-autosuggestions.zsh"

# fzf
if [ -f ~/.fzf.zsh ]; then
  # shellcheck disable=SC1090
  source ~/.fzf.zsh
fi

# fnm
eval "$(fnm env --multi)"
