#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Use bash-completion, if available
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
elif [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
  . /opt/local/etc/profile.d/bash_completion.sh
fi

# Prompt
. ~/.bash_prompt
# PS1='\[\033[1;34m\][\[\033[1;37m\]\u\[\033[1;31m\]@\[\033[1;37m\]\h\[\033[1;34m\]] \[\033[1;35m\]\W \[\033[1;32m\]➜\[\033[1;37m\] '

# Options for cd
shopt -s cdspell
complete -d cd
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias g='. goto-bookmarked-dirs'   # cd into a directory from bookmarked directories
alias gop='. goto-bookmarked-dirs; $EDITOR .'   # go and open a bookmarked directory

alias dunstconf="$EDITOR $HOME/.config/dunst/dunstrc"
alias alaconf="$EDITOR $HOME/.config/alacritty/alacritty.yml"
alias bashconf="$EDITOR $HOME/.bashrc"
alias s='startx'
alias nv='nvim'
alias vn='viewnior'
alias smi='sudo make install'
alias hst="history | cut -c 8- | sort | uniq | fzf | tr -d '\n' | xclip -sel c"
alias dots="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias dotsignore="cd; dots status -s | grep '?' | sed 's/?? //; 1i\\\\' \
                  >> ~/.gitignore; nvim ~/.gitignore; cd - >/dev/null 2>&1"

# Pacman / yay
alias pac='sudo pacman'
alias pacs='pacman -Ss'
alias yays='yay -Ss'

# ls
alias ls='ls --color=auto'
alias l='ls -lh'
alias ll='ls -lah'
alias la='ls -A'
alias lm='ls -m'
alias lr='ls -R'
alias lg='ls -l --group-directories-first'

# Colorize outputs
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ip='ip -color=auto'

# copy pase
alias c='xclip -selection clipboard'
alias v='xclip -o -selection clipboard'

# Programming shorcuts
alias vba=". venv/bin/activate"

# Use colors for less, man, etc.
export LESS_TERMCAP_mb=$'\e[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\e[1;33m'     # begin blink
export LESS_TERMCAP_so=$'\e[01;44;37m' # begin reverse video
export LESS_TERMCAP_us=$'\e[01;37m'    # begin underline
export LESS_TERMCAP_me=$'\e[0m'        # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'        # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'        # reset underline
export GROFF_NO_SGR=1                  # for konsole and gnome-terminal


# Use vi bindings
set -o vi
bind -m vi-command ".":insert-last-argument
bind -m vi-command "\C-l.":clear-screen
bind -m vi-insert "\C-l.":clear-screen
bind -m vi-insert "\C-a.":beginning-of-line
bind -m vi-insert "\C-e.":end-of-line
bind -m vi-insert "\C-w.":backward-kill-word
bind -m vi-insert "\C-p":previous-history
bind -m vi-insert "\C-n":next-history


# Use colors for less, man, etc.
export LESS_TERMCAP_mb=$'\e[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\e[1;34m'     # begin blink
export LESS_TERMCAP_so=$'\e[01;46;30m' # begin reverse video
export LESS_TERMCAP_us=$'\e[01;37m'    # begin underline
export LESS_TERMCAP_me=$'\e[0m'        # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'        # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'        # reset underline
export GROFF_NO_SGR=1                  # for konsole and gnome-terminal

# Show a quote on startup
if ! [ -f /tmp/bash-loaded ] && [ "$TERM" != "linux" ]; then
  showquote
  touch /tmp/bash-loaded
fi
