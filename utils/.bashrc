# pbidwell custom
set -o vi

alias vim="nvim"
alias tmuxconfig="vim ~/.tmux.conf"
alias dc="docker-compose"
alias d="docker"
alias notes="pushd ~/.notes && vim && popd"
alias todo="vim ~/.notes/todo.txt"
alias gs="git status"
alias gd="git diff"
alias f="find . -iname "
alias ls="exa"
alias mdless="~/.gem/ruby/2.6.0/gems/mdless-1.0.32/bin/mdless"
alias hgrep="history | grep"
alias nvimconfig="nvim ~/.config/nvim/lua/user/init.lua"


alias j11='sdk use java 11.0.17-tem'
alias j17='sdk use java 17.0.6-oracle'


work() { tmx2 new-session -A -s ${1:-work}; }

code() {
    [[ -z "$1" ]] && ls ~/dev/ && return
    pushd ~/dev/$1 && nvim && popd
}
