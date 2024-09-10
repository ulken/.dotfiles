```sh
git init --bare $HOME/.dotfiles
alias .fs='$(which git) --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
.fs config --local status.showUntrackedFiles no
```

_– [How to store dotfiles](https://www.atlassian.com/git/tutorials/dotfiles)_
