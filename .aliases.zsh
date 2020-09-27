# list directory contents
alias ls="ls -G"  # compact view, show colors
alias la="ls -AF" # compact view, show hidden
alias ll="ls -al"
alias l="ls -a"

# directory navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias -- -="cd -" # go back

# edit
alias edit="$EDITOR"
alias .ze="edit ~/.zshrc"
alias .zr="source ~/.zshrc"
alias .ae="edit ~/.aliases.zsh"
alias .ar="source ~/.aliases.zsh"
alias .fe="edit ~/.functions.zsh"
alias .fr="source ~/.functions.zsh"
alias .ve="edit ~/.vimrc"
alias .vr="source ~/.vimrc"

# clear screen (not just scroll down)
alias cls="echo -e '\\0033\\0143'"

# file sizes
alias ds="du -sh" # directory size
