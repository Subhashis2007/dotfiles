
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
    yay -S --noconfirm --disable-download-timeout 
    wayland libdrm pixman libxkbcommon python2 libxml2 \
    llvm libpng gegl mtdev xorg-xwayland  qt5-wayland \
    qt6-wayland network-manager-applet \
    gtk2 gtk3 gtk4 alsamixer pulseaudio pulseaudio-alsa \
    pavucontrol alsa-utils alsa-plugins \
    hyprland waybar xdg-desktop-portal-wlr \
    wlroots xdg-desktop-portal polkit-kde-agent \
    wofi swaylock swaybg kitty pcmanfm-qt \
    lxappearance
fi

read -n1 -rep 'Would you like to install the user packages? (y,n)' INST
if [[ $INST == "Y" || $INST == "y" ]]; then
    yay -S --noconfirm --disable-download-timeout brave-bin ntfs-3g \
    gvfs mtpfs gvfs-mtp \
    emacs android-tools pulseaudio-equalizer-ladspa wlogout \
    expac xdman kitty bpytop yt-dlp gstreamer gst-plugins-good gst-plugins-bad \
    file-roller fastfetch-bin shell-color-scripts grim rhythmbox vlc \
    gnome-disk-utility gparted exfatprogs slurp 
 fi  

read -n1 -rep 'Would you like to install the fonts and theming packages? (y,n)' INST
if [[ $INST == "Y" || $INST == "y" ]]; then
    yay -S --noconfirm --disable-download-timeout noto-fonts \
    ttf-font-awesome ttf-jetbrains-mono \
    ttf-ubuntu-font-family \
    lxappearance kvantummanager qt5ct qt6ct \
    breeze-icons catppuccin-gtk-theme-macchiato kvantum-theme-catppuccin-git
fi

read -n1 -rep 'Would you like to copy config files? (y,n)' CFG
if [[ $CFG == "Y" || $CFG == "y" ]]; then
    echo -e "Copying config files...\n"
   
   cp -r .config/Hypr ~/.config
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
