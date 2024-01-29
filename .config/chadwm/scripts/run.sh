#!/bin/sh

xset r rate 200 75 &
picom -b  --config ~/.config/chadwm/picom/picom.conf &
dash ~/.config/chadwm/scripts/bar.sh &
nitrogen --restore &
nm-applet &
pa-applet &
run "numlockx on"
run "bash ~/.config/chadwm/scripts/settheme"
run "bash ~/.config/chadwm/scripts/startup"
run "/usr/bin/lxpolkit"
while type chadwm >/dev/null; do chadwm && continue || break; done
