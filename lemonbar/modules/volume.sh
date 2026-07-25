#!/usr/bin/env bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$DIR/config.sh"

print_volume() {

    local volume
    local icon

    if [[ "$(pamixer --get-mute)" == "true" ]]; then
        echo "VOL:$ICON_VOL_MUTE Mute"
        return
    fi

    volume=$(pamixer --get-volume)

    if (( volume <= 33 )); then
        icon="$ICON_VOL_LOW"
    elif (( volume <= 66 )); then
        icon="$ICON_VOL_MEDIUM"
    else
        icon="$ICON_VOL_HIGH"
    fi

    echo "VOL:$icon ${volume}%"
}

# Initial output
print_volume

# Listen for PulseAudio/PipeWire events
pactl subscribe | while read -r event; do

    case "$event" in
        *"on sink"*|*"on server"*)
            print_volume
            ;;
    esac

done
