export CLICOLOR=1
export PATH="$PATH:$HOME/.local/bin:$HOME/.cargo/bin"
export EDITOR="nvim"
export GOPATH="$HOME/Developer/tools/go"

# Use colors for less, man, etc.
export LESS_TERMCAP_mb=$'\e[36m'     # begin bold
export LESS_TERMCAP_md=$'\e[36m'     # begin blink
export LESS_TERMCAP_so=$'\e[47;30m'  # begin reverse video
export LESS_TERMCAP_us=$'\e[4m'      # begin underline
export LESS_TERMCAP_me=$(tput sgr0; )
export LESS_TERMCAP_se=$'\e[0m'      # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'      # reset underline

eval "$(/opt/homebrew/bin/brew shellenv)"
. "$HOME/.cargo/env"

