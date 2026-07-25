#!/usr/bin/env bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$DIR/config.sh"

print_wifi() {

    local state
    local ssid

    state=$(nmcli -t -f WIFI g)

    if [[ "$state" != "enabled" ]]; then
        echo "NET:$ICON_WIFI_DISABLED Off"
        return
    fi

    ssid=$(nmcli -t -f ACTIVE,SSID dev wifi | awk -F: '$1=="yes"{print $2}')

    if [[ -z "$ssid" ]]; then
        echo "NET:$ICON_WIFI_DISCONNECTED Disconnected"
    else
        echo "NET:$ICON_WIFI_CONNECTED $ssid"
    fi
}

# Initial output
print_wifi

# Listen for NetworkManager changes
nmcli monitor | while read -r _; do
    print_wifi
done
