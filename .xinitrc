# ~/.xinitrc for dwm 

[ -f ~/.profile ] && . ~/.profile &

# Remap right alt as super (easy to navigate workspaces)
xmodmap - << EOF
remove mod1 = Alt_R
clear mod4
keycode 108 = Super_R
add mod4 = Super_R
EOF

nitrogen --restore &

picom &
sxhkd &

xset r rate 200 30 &

dwmblocks &
exec dwm

# ex:filetype=sh
