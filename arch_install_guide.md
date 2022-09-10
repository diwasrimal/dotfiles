# Do a base Install through archinstall 
- Install `neovim` and `networkmanager` through there

# Add a new user
- uncomment the wheel line from `etc/sudoers`
- `useradd -m -g wheel <user>`
- `passwd <user>`

# Update system
- `sudo pacman -Syu`

# Install xorg and some tools
- `sudo pacman -S xorg xorg-xinit nitrogen picom firefox alacritty`

## Optionally install a video driver 
- `sudo pacman -S xf86-video-fbdev`

## Make a configuration file to start the Xorg server
- `cp /etc/X11/xinit/xinitrc ~/.xinitrc`

# Install a Window manager ([Qtile](https://wiki.archlinux.org/title/Qtile) )
- `sudo pacman -S qtile`
- To run Qtile as an X11 window manager, run `qtile start` with xinit.



# Install an AUR helper (yay)
- `git clone https://aur.archlinux.org/yay-git.git`
- `cd yay-git`
- `makepkg -si`

# Install fonts from the AUR
- `yay -S nerd-fonts-hack nerd-fonts-jetbrains-mono`

