xset r rate 200 25 &
nitrogen --restore &
nvim --headless &
# redshift -O3500 &

# Map right Alt key as super
xmodmap ~/.Xmodmap

# MPD daemon start (if no other user instance exists)
[ ! -s ~/.config/mpd/pid ] && mpd

# Dwm 
picom &
exec dwmblocks &
exec dwm

# Qtile
# qtile start

# Awesome
# exec awesome

# KDE
# export DESKTOP_SESSION=plasma &
# exec startplasma-x11
