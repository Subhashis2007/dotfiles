#!/bin/bash

# Update AUR packages
aur_updates=$(yay -Qua 2> /dev/null | wc -l)

# Update Arch packages
arch_updates=$(checkupdates 2> /dev/null | wc -l)

# Combine the update counts
updates=$((aur_updates + arch_updates))

if [ "$updates" -gt 0 ]; then
    echo " $updates"
else
    echo "0"
fi
