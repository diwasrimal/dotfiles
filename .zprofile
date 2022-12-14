#
# ~/.zsh_profile

export PATH="$PATH:$HOME/.local/bin"
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"

# Use colors for less, man, etc.
export LESS_TERMCAP_mb=$'\e[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\e[1;33m'     # begin blink
export LESS_TERMCAP_so=$'\e[01;44;37m' # begin reverse video
export LESS_TERMCAP_us=$'\e[01;37m'    # begin underline
export LESS_TERMCAP_me=$'\e[0m'        # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'        # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'        # reset underline
export GROFF_NO_SGR=1                  # for konsole and gnome-terminal

# Auto startx on tty1
if [[ "$(tty)" == "/dev/tty1" ]]; then
  pgrep dwm || startx
fi
