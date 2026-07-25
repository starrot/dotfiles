#!/bin/sh

source "$HOME/.config/themes/output/dmenu.sh"

dmenu() {
    command dmenu \
        -fn "$FONT" \
        -nb "$BG" \
        -nf "$FG" \
        -sb "$SEL_BG" \
        -sf "$SEL_FG" \
        "$@"
}
