#!/bin/sh

xset r rate 200 75 &
picom -b  --config ~/.config/chadwm/picom/picom.conf &
nitrogen --restore &
volumeicon &
run "numlockx on"
run "bash ~/.config/chadwm/scripts/settheme"
run "bash ~/.config/chadwm/scripts/startup"
run "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
dash ~/.config/chadwm/scripts/bar.sh &
nm-applet &
while type chadwm >/dev/null; do chadwm && continue || break; done
