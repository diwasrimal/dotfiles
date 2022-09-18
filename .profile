[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH=$PATH:$HOME/.local/bin
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"

echo ".profile read"

if [[ "$(tty)" == "/dev/tty1" ]]; then
  pgrep dwm || startx
fi
