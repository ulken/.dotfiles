# shellcheck shell=bash
# shellcheck disable=SC1090,SC2034

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

DOTFILES_REPOSITORY=".dotfiles"
ZSH_HOME="$HOME/.zsh"

function .fs() {
  "$(which git)" --git-dir="$HOME/$DOTFILES_REPOSITORY" --work-tree="$HOME" "$@"
}

# prompt
PURE_GIT_UNTRACKED_DIRTY=1

fpath+="$ZSH_HOME/pure"

autoload -U promptinit
promptinit
prompt pure

# plugins

plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting
)

for plugin in "${plugins[@]}"; do
  source "$ZSH_HOME/$plugin/$plugin.zsh"
done

# fzf
if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
fi

# fnm
eval "$(fnm env --multi)"
