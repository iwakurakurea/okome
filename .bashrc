#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

model='deepseek-r1'

news=$(newsboat -x print-unread)

export EDITOR='nvim'

alias e=${EDITOR}

alias ai='ollama run ${model}'

alias cls='clear'
alias ll='ls -l'
alias la='ls -al'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
# alias icat='kitten icat'
eza --icons=always
# icat --align=right Pictures/splash.jpg
printf "newsboat : %s" "$news"
eval $(/home/clair/.cargo/bin/zoxide init bash --cmd 'cd')
eval $(/home/clair/.cargo/bin/starship init bash)
#. /home/clair/.cargo/env 
# or something
