#!/usr/bin/env bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$DIR/config.sh"

while true; do

    ram=$(free -h | awk '/^Mem:/ {print $3}')

    echo "RAM:$ram"

    sleep "$RAM_INTERVAL"

done
