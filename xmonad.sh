#!/bin/bash

add_line_with_sudo() {
     sudo sed -i "30a$1" /etc/pacman.conf
}

#### Check for paru ####
ISYAY=/sbin/paru
if [ -f "$ISYAY" ]; then 
    echo -e "paru was located, moving on.\n"
    paru -Suy
else 
    echo -e "paru was not located, please install paru. Exiting script.\n"
    exit 
fi

read -p "Do you want to add recommended tweaks in pacman.conf? (y/n): " choice
if [[ $choice == [Yy] ]]; then
    # Add ParallelDownloads = 10 to pacman.conf
    add_line_with_sudo "ParallelDownloads = 10"

    # Add color to pacman.conf
    add_line_with_sudo "Color"

    # Add ILoveCandy to pacman.conf
    add_line_with_sudo "ILoveCandy"

    echo "Pacman tweaks successful."
else
    echo "Operation cancelled."
fi

read -n1 -rep 'Would you like to install the base packages? (y,n)' INST
if [[ $INST == "Y" || $INST == "y" ]]; then
    paru -S --noconfirm --disable-download-timeout xorg picom xmonad xmonad-contrib \
    lightdm lightdm-slick-greeter polybar conky dmenu network-manager-applet\
    rofi gtk2 gtk3 gtk4  alsamixer pulseaudio pulseaudio-alsa \
    pavucontrol alsa-utils alsa-plugins
fi

read -n1 -rep 'Would you like to install the user packages? (y,n)' INST
if [[ $INST == "Y" || $INST == "y" ]]; then
    paru -S --noconfirm --disable-download-timeout brave-bin nemo ntfs-3g \
    gvfs mtpfs gvfs-mtp \
    emacs android-tools pulseaudio-equalizer-ladspa wlogout \
    expac xdman kitty bpytop yt-dlp gstreamer gst-plugins-good gst-plugins-bad \
    nitrogen nemo-fileroller fastfetch-bin shell-color-scripts flameshot rhythmbox vlc \
    gnome-disk-utility gparted exfatprogs 
 fi  

read -n1 -rep 'Would you like to install the fonts and theming packages? (y,n)' INST
if [[ $INST == "Y" || $INST == "y" ]]; then
    paru -S --noconfirm --disable-download-timeout noto-fonts \
    ttf-font-awesome ttf-jetbrains-mono \
    ttf-ubuntu-font-family \
    lxappearance kvantummanager qt5ct qt6ct \
    breeze-icons catppuccin-gtk-theme-macchiato kvantum-theme-catppuccin-git
fi

read -n1 -rep 'Would you like to copy config files? (y,n)' CFG
if [[ $CFG == "Y" || $CFG == "y" ]]; then
    echo -e "Copying config files...\n"
   
   cp -r .config ~/
   cp -f .zshrc ~/
  
    
  fi


read -n1 -rep 'Would you like enable lightdm now? (y,n)' HYP
if [[ $HYP == "Y" || $HYP == "y" ]]; then
    sudo systemctl enable lightdm
     sudo cp -f ~/.config/xmonad/lightdm/slick-greeter.conf /etc/lightdm/
     sudo cp -f ~/.config/xmonad/lightdm/archlinux2.jpg /usr/share/pixmaps/
fi


read -n1 -rep 'Would you like switch to zsh now? (y,n)' HYP
if [[ $HYP == "Y" || $HYP == "y" ]]; then
    sudo chsh -s /bin/zsh
fi

echo -e "The script has been successfully completed.\n"
echo -e "You can reboot now\n"
read -n1 -rep 'Would you like reboot now? (y,n)' HYP
if [[ $HYP == "Y" || $HYP == "y" ]]; then
    reboot
else
    exit
fi
