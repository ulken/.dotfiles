# list directory contents
alias ls="exa"
alias la="exa -aF"
alias ll="exa -al"
alias l="exa -a"

# directory navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias -- -="cd -" # go back
alias cd="z"

# file viewer
alias cat="bat"

# edit
alias edit="$EDITOR"
alias .ze="edit ~/.zshrc"
alias .ae="edit ~/.aliases.zsh"
alias .fe="edit ~/.functions.zsh"
alias .ve="edit ~/.vimrc"

# reload zsh config
alias .zr="exec zsh"

# clear screen (not just scroll down)
alias cls="echo -e '\\0033\\0143'"

# file sizes
alias ds="du -sh" # directory size

# git
alias lg="lazygit"

# ping
alias ping="prettyping --nolegend"

# gron
alias norg="gron --ungron"
alias ungron="gron --ungron"
