xset r rate 200 25 &
nitrogen --restore &

# MPD daemon start (if no other user instance exists)
[ ! -s ~/.config/mpd/pid ] && mpd

# Dwm 
# redshift -O3500 &
# nvim --headless &
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
