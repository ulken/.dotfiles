# shellcheck shell=bash
# shellcheck disable=SC1090,SC2034

# options
setopt INC_APPEND_HISTORY_TIME

# PATH
path+="/usr/local/sbin"
path+="/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
path+="$ZSH_HOME/zsh-completions/src"
path+="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin"

function .fs() {
  "$(which git)" --git-dir="$HOME/$DOTFILES_REPOSITORY" --work-tree="$HOME" "$@"
}

# prompt
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
  zsh-vim-mode
  zsh-autosuggestions
  zsh-history-substring-search
  fast-syntax-highlighting
)

for plugin in "${plugins[@]}"; do
  for plugin_path in $ZSH_HOME/$plugin/$plugin{,.plugin}.zsh; do
    if [ -r "$plugin_path" ]; then
      source "$plugin_path"
    fi
  done
done

# keybindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey -rpM viins '^[^[' # Esc-Esc to enter Vim Normal mode fast

# help for built-ins
unalias run-help 2> /dev/null
autoload run-help
HELPDIR=/usr/local/share/zsh/help
alias help=run-help

# fnm
eval "$(fnm env)"

# thefuck
eval "$(thefuck --alias)"

# ssh-agent
if [ ! -S "$SSH_AUTH_SOCK" ]; then
  eval "$(ssh-agent -s)"
fi

if ! ssh-add -L > /dev/null; then
  ssh-add -qA
fi

# partials
for file in $HOME/.{env,aliases,functions,fzf}.zsh; do
  if [ -r "$file" ]; then
    source "$file"
  fi
done
