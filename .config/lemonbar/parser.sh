#!/usr/bin/env bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$DIR/config.sh"

workspace=""
title="Desktop"
ram="--"
volume="--"
wifi="Offline"
clock="--"

draw_bar() {
    printf "%%{l}%s%%{c}%s%%{r}%s%s%s%s%s%s%s\n" \
        "$workspace" \
        "$title" \
        "$ICON_RAM $ram" \
        "$MODULE_SEPARATOR" \
        "$volume" \
        "$MODULE_SEPARATOR" \
        "$wifi" \
        "$MODULE_SEPARATOR" \
        "$clock"
}

while IFS= read -r line; do

    case "$line" in
        WSP:*)
            workspace="${line#WSP:}"
            ;;
        TTL:*)
            title="${line#TTL:}"
            ;;
        RAM:*)
            ram="${line#RAM:}"
            ;;
        VOL:*)
            volume="${line#VOL:}"
            ;;
        NET:*)
            wifi="${line#NET:}"
            ;;
        CLK:*)
            clock="${line#CLK:}"
            ;;
        *)
            continue
            ;;
    esac

    draw_bar

done
