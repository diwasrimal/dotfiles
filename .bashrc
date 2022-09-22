#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# Prompt
# PS1='\[\033[1;34m\][\[\033[1;37m\]\u\[\033[1;31m\]@\[\033[1;37m\]\h\[\033[1;34m\]] \[\033[1;35m\]\w\n\[\033[1;32m\]➜\[\033[1;37m\] '
PS1='\[\033[1;34m\][\[\033[1;37m\]\u\[\033[1;31m\]@\[\033[1;37m\]\h\[\033[1;34m\]] \[\033[1;35m\]\W \[\033[1;32m\]➜\[\033[1;37m\] '

alias s='startx'
alias vi='nvim'
alias smi='sudo make install'

# Pacman 
alias pac='sudo pacman'
alias pacs='pacman -Ss'

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

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# copy pase
alias "c=xclip -selection clipboard"
alias "v=xclip -o -selection clipboard"

# Use colors for less, man, etc.
export LESS_TERMCAP_mb=$'\e[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\e[1;33m'     # begin blink
export LESS_TERMCAP_so=$'\e[01;44;37m' # begin reverse video
export LESS_TERMCAP_us=$'\e[01;37m'    # begin underline
export LESS_TERMCAP_me=$'\e[0m'        # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'        # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'        # reset underline
export GROFF_NO_SGR=1                  # for konsole and gnome-terminal

