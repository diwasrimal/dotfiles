[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH=$PATH:$HOME/.local/bin
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export XDG_DESKTOP_DIR="$HOME/desk"
export XDG_MUSIC_DIR="$HOME/mus"
export XDG_DOWNLOAD_DIR="$HOME/dl"
export XDG_DOCUMENTS_DIR="$HOME/docs"
export XDG_PICTURES_DIR="$HOME/pics"
export XDG_VIDEOS_DIR="$HOME/vids"
export XDG_TEMPLATES_DIR="$HOME/tmpl"
export XDG_PUBLICSHARE_DIR="$HOME/pub"

# Auto startx on tty1
if [[ "$(tty)" == "/dev/tty1" ]]; then
  pgrep dwm || startx
fi
