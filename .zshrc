# shellcheck shell=bash
# shellcheck disable=SC1090,SC2034

# PATH
path+=/usr/local/sbin
path+="/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
path+="$ZSH_HOME/zsh-completions/src"

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
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-history-substring-search # must come after `zsh-syntax-highlighting`
  zsh-vim-mode
)

for plugin in "${plugins[@]}"; do
  source "$ZSH_HOME/$plugin/$plugin.zsh"
done

# keybindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Homebrew

# partials
for file in ~/.{env,aliases,functions,fzf}.zsh; do
  if [ -r "$file" ]; then
    source "$file"
  fi
done

# fnm
eval "$(fnm env --multi)"

# thefuck
eval "$(thefuck --alias)"
