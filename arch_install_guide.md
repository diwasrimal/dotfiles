### Do a base Install through archinstall 
- Install `neovim` and `networkmanager` through there

### Add a new user
- uncomment the wheel line from `etc/sudoers`
- `useradd -m -g wheel <user>`
- `passwd <user>`

### Update system
- `sudo pacman -Syu`

### Install xorg and some tools
- `sudo pacman -S xorg xorg-xinit nitrogen picom firefox alacritty`

### Optionally install a video driver 
- `sudo pacman -S xf86-video-fbdev`

#### Make a configuration file to start the Xorg server
- `cp /etc/X11/xinit/xinitrc ~/.xinitrc`

### Install a Window manager ([Qtile](https://wiki.archlinux.org/title/Qtile) )
- `sudo pacman -S qtile`
- To run Qtile as an X11 window manager, run `qtile start` with xinit.



### Install an AUR helper (yay)
- `git clone https://aur.archlinux.org/yay-git.git`
- `cd yay-git`
- `makepkg -si`

### Install fonts from the AUR
- `yay -S nerd-fonts-hack nerd-fonts-jetbrains-mono`


## Settings for brightness control
### xbacklight 
`xbacklight` didn't work properly, installing another package called `acpilight` make `xbacklight` command work. Also `/sys/class/backlight/intel_backlight` was causing issues. It had only root access
- `sudo pacman -S acpilight`
- `chown lufy:lufy /sys/class/backlight/intel_backlight/*`

### xrandr
This configuration works somehow.
- ` xrandr | grep -w connected | cut -f '1' -d ' '` gets the current output display
- Brightness can be set using ` xrandr --output output_name --brightness 0.5`

- This alias is useful: `alias b='echo -e "enter brightness:"; read val; xrandr --output LVDS-1 --brightness "${val}"'`

### brightnessctl
This command line tool auto configures the device 
- `sudo pacman -S brightnessctl`
- See `brightnessctl -h` and `man brightnessctl`
