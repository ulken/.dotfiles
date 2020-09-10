DOTFILES_REPOSITORY=".dotfiles"

function .fs {
  "$(which git)" --git-dir="$HOME/$DOTFILES_REPOSITORY" --work-tree="$HOME" $@
}

# fzf
if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
fi

# fnm
eval "$(fnm env --multi)"
