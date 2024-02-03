#!/bin/sh

picom -b  --config ~/.config/chadwm/picom/picom.conf &
dash ~/.config/chadwm/scripts/bar.sh &
xset r rate 200 75 &
nitrogen --restore &
nm-applet &
run "numlockx on"
run "/usr/bin/lxpolkit"
while type chadwm >/dev/null; do chadwm && continue || break; done
