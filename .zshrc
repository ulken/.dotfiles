# shellcheck shell=bash
# shellcheck disable=SC1090,SC2034

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# PATH
path+=/usr/local/sbin
path+="/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
path+="$ZSH_HOME/zsh-completions/src"

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

# completion
source "$ZSH_HOME/zsh-z/zsh-z.plugin.zsh"

autoload -U compinit
compinit

zstyle ':completion:*' menu select

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
