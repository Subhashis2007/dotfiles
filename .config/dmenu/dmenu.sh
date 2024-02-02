#!/bin/sh

. ~/.config/dmenu/themes/catppuccin

dmenu_run -nb "$BACKGROUND" -nf "$FOREGROUND" -sb "$SELECTED_BACKGROUND" -sf "$SELECTED_FOREGROUND" -fn "JetBrainsMono NF Medium:style=Medium,Regular" -p "Run:" -i -nb "$BORDER"


