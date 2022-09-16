#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# Prompt
# PS1='[\u@\h \W]\$ '
# PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h:\[\033[1;35m\]\w\[\033[1;31m\]\$\[\033[0m\] '
PS1='\033[1;33m\][\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h: \[\033[1;35m\]\W\033[1;33m\]]$\[\033[0m\] '

alias s='startx'

# ls
alias ls='ls --color=auto'
alias l='ls -lh'
alias ll='ls -lah'
alias la='ls -A'
alias lm='ls -m'
alias lr='ls -R'
alias lg='ls -l --group-directories-first'

# git
alias gcl='git clone --depth 1'
alias gi='git init'
alias ga='git add'
alias gaa='git add -u; git add -A'
alias gc='git commit -m'
alias gp='git push origin main'

# copy pase
alias "c=xclip -selection clipboard"
alias "v=xclip -o -selection clipboard"
