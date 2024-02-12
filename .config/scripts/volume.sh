#!/bin/bash

# Check if the number of arguments is at least 1
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 [--mute]"
    exit 1
fi

# Parse command-line arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --mute)
            # Your mute logic here
            wpctl mute toggle
            if wpctl status | grep -q "Mute: yes"; then
                notify-send "Muted"
            else
                notify-send "Unmuted"
            fi
            ;;
	      --mute-only)
            # Mute the volume without toggling
	    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle; notify-send "Volume $(pamixer --get-volume-human)" -h int:value:$(pamixer --get-volume) -h string:synchronous:volume -t 1000 -e
	    ;;
        --increase-volume)
            # Increase volume by 5%
            wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+; notify-send "Volume $(pamixer --get-volume-human)" -h int:value:$(pamixer --get-volume) -h string:synchronous:volume -t 1000 -e
	    ;;
        --decrease-volume)
            # Decrease volume by 5%
            wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-; notify-send "Volume $(pamixer --get-volume-human)" -h int:value:$(pamixer --get-volume) -h string:synchronous:volume -t 1000 -e
            ;;
        *)
            # Handle unknown arguments
            echo "Unknown argument: $1"
            exit 1
            ;;
    esac
    shift
done

