#!/usr/bin/env bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$DIR/config.sh"

bspc subscribe report | while read -r line; do

    bar=""

    IFS=':' read -ra desktops <<< "$line"

    for desktop in "${desktops[@]}"; do

        state="${desktop:0:1}"
        name="${desktop:1}"

        ####################################
        # Workspace label
        ####################################

        label="$name"
	case "$name" in
	    VIII|IX|X)
	        case "$state" in
	            O|F|o|U|u)
	                ;;      # Active, occupied or urgent → show
	            *)
	                continue # Empty → hide
	                ;;
	        esac
	        ;;
	esac

        ####################################
        # Style
        ####################################

        case "$state" in

            O|F)
                color="$COLOR_ACTIVE"
                font=2
                text="[ $label ]"
                ;;

            o)
                color="$COLOR_OCCUPIED"
                font=1
                text="[$label]"
                ;;

            f)
                color="$COLOR_EMPTY"
                font=1
                text="[$label]"
                ;;

            U|u)
                color="$COLOR_URGENT"
                font=2
                text="[ $label ]"
                ;;

            *)
                continue
                ;;

        esac

        ####################################
        # Clickable workspace
        ####################################

        bar+="%{A1:bspc desktop -f $name:}"
        bar+="%{T$font}%{F$color}$text%{F-}%{T1}"
        bar+="%{A} "

    done

    echo "WSP:$bar"

done
