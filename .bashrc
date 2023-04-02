# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
	. /usr/share/bash-completion/bash_completion

# Prompt
. ~/.bash_prompt

# Root user prompt
# PS1='\[\033[1;34m\][\[\033[1;31m\]\u\[\]@\[\033[1;37m\]\h\[\033[1;34m\]] \[\033[1;35m\]\W \[\033[m\]➜ '

# Options for cd
shopt -s cdspell
complete -d cd

# Load custom aliases and functions
. ~/.config/shell/aliases
. ~/.config/shell/functions

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
bind -m vi-insert "\C-k":insert-last-argument

[[ $(tty) != /dev/tty* ]] && remind-me
