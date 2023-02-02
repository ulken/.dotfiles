# shellcheck shell=bash
# shellcheck disable=SC1090,SC2034

# options
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY

# PATH
path=("/usr/local/opt/coreutils/libexec/gnubin" $path)
path=("$HOME/.bin" $path)
path+="/usr/local/sbin"
path+="/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
path+="$ZSH_HOME/zsh-completions/src"
path+="$GOPATH"
path+="$GOROOT/bin"

function .fs() {
  "$(which git)" --git-dir="$HOME/$DOTFILES_REPOSITORY" --work-tree="$HOME" "$@"
}

# prompt
fpath+="$ZSH_HOME/pure"

autoload -U promptinit
promptinit
prompt pure

# completion

autoload -U compinit
compinit

eval "$(zoxide init zsh)"

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

# ensure ssh identities stored in Keychain are loaded
if ! ssh-add -L > /dev/null; then
  ssh-add -qA
fi

# init
eval "$(fnm env)"
eval "$(thefuck --alias)"
eval "$(direnv hook zsh)"

# partials
for file in $HOME/.{env,aliases,functions,fzf}.zsh; do
  if [ -r "$file" ]; then
    source "$file"
  fi
done

# bun completions
[ -s "/Users/ulken/.bun/_bun" ] && source "/Users/ulken/.bun/_bun"

# Bun
export BUN_INSTALL="/Users/ulken/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/ulken/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
