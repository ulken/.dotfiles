# replace built-ins with improved clis
alias cat='bat --paging=always'
alias df='duf --only local'
alias du='dust --reverse'
alias find='fd --hidden'
alias ping='prettyping --nolegend'
alias ps='procs --tree'
alias grep='rg --smart-case'
alias sed='sd --global'
alias rm='trash -Fv' # enable "put back" and verbose output

# list directory contents
alias ls='eza'
alias l="ls -a"
alias la="ls -aF"
alias ll="ls -al"

# directory navigation
alias cd="z"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias -- -="cd -" # go back

# edit
alias edit="$EDITOR"
alias .ze="edit ~/.zshrc"
alias .ae="edit ~/.aliases.zsh"
alias .fe="edit ~/.functions.zsh"

# reload zsh config
alias .zr="exec zsh"

# clear screen (not just scroll down)
alias cls="echo -e '\\0033\\0143'"

# gron
alias norg="gron --ungron"
alias ungron="gron --ungron"

# klog
alias pc="klog create"                                               # punch clock
alias pr="klog today --diff --now | head -2 | tail -n 1 | choose -1" # punch time remaining
alias pe="klog edit"                                                 # punch edit
