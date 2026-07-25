#!/usr/bin/env bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$DIR/config.sh"

print_title() {

    local id
    local title

    id=$(bspc query -N -n focused)

    if [[ -z "$id" ]]; then
        echo "TTL:Desktop"
        return
    fi

    title=$(xprop -id "$id" WM_NAME 2>/dev/null | cut -d '"' -f2)

    if [[ -z "$title" ]]; then
        title="Desktop"
    fi

    # Trim long titles
    if (( ${#title} > TITLE_MAX_LENGTH )); then
        title="${title:0:$((TITLE_MAX_LENGTH-3))}..."
    fi

    echo "TTL:$title"
}

# Initial title
print_title

# Listen for focus changes
bspc subscribe node_focus node_remove node_transfer node_add | while read -r _; do
    print_title
done
