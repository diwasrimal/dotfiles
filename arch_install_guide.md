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
Also install `python-dbus-next`

Install my config dependecies:
- `sudo pacman -S upower`

### Install an AUR helper (yay)
- `git clone https://aur.archlinux.org/yay-git.git`
- `cd yay-git`
- `makepkg -si`

### Install fonts from the AUR
- `yay -S nerd-fonts-hack nerd-fonts-jetbrains-mono`


## Settings for brightness control
### xbacklight 
`xbacklight` comes with `xorg-xbacklight`. If `xbacklight` doesn't work, downloading `acpilight` would be the solution.
Then you can use `xbacklight` after `sudo chown /sys/class/backlight/intel_backlight/*`


### xrandr
This configuration works somehow.
- ` xrandr | grep -w connected | cut -f '1' -d ' '` gets the current output display
- Brightness can be set using ` xrandr --output output_name --brightness 0.5`

- This alias is useful: `alias b='echo -e "enter brightness:"; read val; xrandr --output LVDS-1 --brightness "${val}"'`

### brightnessctl
This command line tool auto configures the device 
- `sudo pacman -S brightnessctl`
- See `brightnessctl -h` and `man brightnessctl`

### Troubleshooting
If you get the "No outputs have backlight property" error, it is because
`xrandr/xbacklight` does not choose the right directory in
`/sys/class/backlight`. You can specify the directory by setting the Backlight
option of the device section in `/etc/X11/xorg.conf.d/20-video.conf`. For
instance, if the name of the directory is `intel_backlight` and using the **Intel**
driver, the device section may be configured as follows:

```
/etc/X11/xorg.conf.d/20-intel.conf
Section "Device"
    Identifier  "Intel Graphics"
    Driver      "intel"
    Option      "Backlight"  "intel_backlight"
EndSection
```
## Audio 
### Install ALSA utils
This will get us `amixer` and `alsamixer`
- `sudo pacman -S alsa-utils`

## Customizations
#### Copy from archcraft openbox
- `git clone https://github.com/archcraft-os/archcraft-openbox.git ~/archcarft`
- `mv ~/archcraft/files ~/; rm -rf ~/archcraft/*; mv ~/files ~/archcraft/`

#### Make directories inside $HOME
- `sudo pacman -S xdg-user-dirs`
- `xdg-user-dirs-update`

#### Install necessities
- `sudo pacman -S dunst rofi maim`

## Screenshots
#### Copy rofi config
- `cp -r ~/archcraft/rofi ~/.config/`
