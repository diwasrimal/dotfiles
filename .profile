export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

export PATH=$PATH:~/.local/bin:~/.cargo/bin
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

# Use colors for less, man, etc.
export LESS_TERMCAP_mb=$'\e[1;35m'     # begin bold
export LESS_TERMCAP_md=$'\e[1;35m'     # begin blink
export LESS_TERMCAP_so=$'\e[01;44;30m' # begin reverse video
export LESS_TERMCAP_us=$'\e[0;34m'    # begin underline
export LESS_TERMCAP_me=$'\e[0m'        # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'        # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'        # reset underline
export GROFF_NO_SGR=1                  # for konsole and gnome-terminal
