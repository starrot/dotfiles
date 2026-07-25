#!/usr/bin/env bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$DIR/config.sh"

# Kill child processes on exit
cleanup() {
    kill 0
}

trap cleanup EXIT INT TERM

# Merge all module outputs
{
    "$DIR/modules/bspwm.sh" &
    "$DIR/modules/title.sh" &
    "$DIR/modules/ram.sh" &
    "$DIR/modules/volume.sh" &
    "$DIR/modules/wifi.sh" &
    "$DIR/modules/clock.sh" &

    wait
} |
"$DIR/parser.sh" |
lemonbar \
    -p \
    -a 30 \
    -g x${BAR_HEIGHT} \
    -B "$BAR_BG" \
    -F "$BAR_FG" \
    -f "$FONT" \
    -f "$FONT_BOLD" |
bash
