# My Hyprland Dotfiles
Hyprland is a wlroots based tiling wayland compositor. It provides dynamic tiling, tabbed windows, clean window animations, rounded corners, transparency and more. 

Note: My dotfiles are intended to be more functional and aesthetics wasn't the primary goal, but yeah it has some aesthetics.

## Table of Contents
- What are [dotfiles](#Dotfiles)?
- [My Different Tiling Window Manager Configs ](#My-Different-Tiling-Window-Manager-Configs)
- [Installation](#Installation)

## Dotfiles

![Imgur](https://i.imgur.com/Hod6xSg.png)

Dotfiles serve as configuration files used to tailor the appearance and functionality of your Linux or other Unix-based system. A file is categorized as a dotfile due to its name starting with a period, denoted by a leading dot. This leading dot signifies that the file or directory is hidden from plain view. This repository houses my personal collection of dotfiles, offering a convenient way for me to access them on new machines or fresh installations. Additionally, these configurations may be of assistance to others seeking inspiration for their own dotfile customizations.

## My Different Tiling Window Manager Configs 

- [Xmonad](https://github.com/subhashis2007/dotfiles/tree/Xmonad) 
- [Hyprland](https://github.com/subhashis2007/dotfiles/tree/Hyprland)

## Screenshots

![Imgur](https://i.imgur.com/y8f3spb.png) ![Imgur](https://i.imgur.com/SIHOWKH.png)


## Installation
Before proceeding towards installation you need to have installed some basic packages such as `git make fakeroot pkg-config` which you can install using pacman

Installation should be performed in 5 parts in order to avoid confusion and for better understanding of the packages

### 1.Hyprland installation
Remember installing any tiling windows manager is a fairly easy task provided you know the packages you need
### 2.Installing Paru
Paru is an [AUR](https://aur.archlinux.org/) helper and we need to install it because we'll be needing to install many packages from AUR 

```
git clone https://aur.archlinux.org/paru-bin paru && cd paru && makepkg -si
```
### 3.Base Packages
Base packages are those packages which form the skeleton or a bare system without any customisation

```
paru -Sy wayland libdrm pixman libxkbcommon python2 libxml2 \
llvm libpng gegl mtdev xorg-xwayland qt5-wayland qt6-wayland hyprland xorg-xhost \
xdg-desktop-portal-hyprland polkit-gnome kitty network-manager-applet \
alsa-utils alsa-plugins grim slurp variety hyprland xorg-xhost rofi wl-clipboard pavucontrol dunst network-manager-applet \

```
### 4.User Packages
User packages are those which we need to customize our setup to some extent and install apps for our workflow

```
paru -Sy thunar thunar-volman thunar-archive-plugin file-roller \
gimp emacs brave-bin 
```

### 5.Setting up dotfiles
This section creates the exact configuration of hyprland as mine, as it will place my dotfiles in ur machine.

Make sure you are in your  `$HOME` directory before executing this following code block

```
git clone --bare https://github.com/Subhashis2007/dotfiles.git $HOME/.dotfiles

function config {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}
mkdir -p .dotfiles.bak
config checkout
if [ $? = 0 ]; then
  echo "Checked out dotfiles.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no

```

Your current config files should be backed up at .dotfiles.bak

## Notes
- If you want to see the config file with a more detailed view, check [hyprland.org](https://github.com/Subhashis2007/dotfiles/blob/Hyprland/.config/hypr/hyprland.org).You may utilise the org file to tangle a hyprland.conf if you so wish, you can check [here](https://orgmode.org/manual/Extracting-Source-Code.html) more about org mode tangling.


