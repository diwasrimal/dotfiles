#!/bin/sh

target="${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim
if [ ! -f "$target" ]; then
    curl -fLo "$target" --create-dirs 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    nvim init.vim -c 'PlugInstall | sleep | q | so'
fi
