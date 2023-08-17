#!/bin/bash

add_line_with_sudo() {
     sudo sed -i "30a$1" /etc/pacman.conf
}

#### Check for yay ####
ISYAY=/sbin/yay
if [ -f "$ISYAY" ]; then 
    echo -e "yay was located, moving on.\n"
    yay -Suy
else 
    echo -e "yay was not located, please install yay. Exiting script.\n"
    exit 
fi


read -n1 -rep 'Would you like to install the base packages? (y,n)' INST
if [[ $INST == "Y" || $INST == "y" ]]; then
    yay -S --noconfirm --disable-download-timeout xorg picom xmonad xmonad-contrib \
    sddm polybar conky dmenu \
    rofi gtk2 gtk3 gtk4 
fi

read -n1 -rep 'Would you like to install the user packages? (y,n)' INST
if [[ $INST == "Y" || $INST == "y" ]]; then
    yay -S --noconfirm --disable-download-timeout brave-bin pcmanfm ntfs-3g \
    gvfs mtpfs \
    alsamixer pulseaudio pulseaudio-alsa pavucontrol \
    emacs android-tools pulseaudio-equalizer-ladspa wlogout \
    expac xdman kitty bpytop yt-dlp gstreamer gst-plugins-good gst-plugins-bad
 fi  

read -n1 -rep 'Would you like to install the fonts and theming packages? (y,n)' INST
if [[ $INST == "Y" || $INST == "y" ]]; then
    yay -S --noconfirm --disable-download-timeout noto-fonts \
    ttf-font-awesome ttf-jetbrains-mono \
    ttf-ubuntu-font-family \
    lxappearance kvantummanager qt5ct qt6ct
fi

read -n1 -rep 'Would you like to copy config files? (y,n)' CFG
if [[ $CFG == "Y" || $CFG == "y" ]]; then
    echo -e "Copying config files...\n"
   
   mkdir ~/.config/
   cp -r .config ~/.config/
   cp .bashrc ~/
  
    
  fi

# Prompt for confirmation
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

read -n1 -rep 'Would you like enable sddm now? (y,n)' HYP
if [[ $HYP == "Y" || $HYP == "y" ]]; then
    sudo systemctl enable sddm

fi

echo -e "The script has been successfully completed.\n"
echo -e "You can reboot now\n"
read -n1 -rep 'Would you like reboot now? (y,n)' HYP
if [[ $HYP == "Y" || $HYP == "y" ]]; then
    reboot
else
    exit
fi
