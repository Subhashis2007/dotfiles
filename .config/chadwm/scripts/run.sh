#!/bin/sh

xrdb merge ~/.Xresources 
xset r rate 200 50 &
picom &
/usr/bin/emacs --daemon &
nitrogen --restore &
xscreensaver -no-splash &
run "bash ~/.config/chadwm/scripts/settheme"
run "bash ~/.config/chadwm/scripts/startup"
run "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
dash ~/.config/chadwm/scripts/bar.sh &
while type chadwm >/dev/null; do chadwm && continue || break; done
