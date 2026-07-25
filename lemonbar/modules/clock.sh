#!/usr/bin/env bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$DIR/config.sh"

while true; do

    date_str=$(date +"$DATE_FORMAT")
    time_str=$(date +"$TIME_FORMAT")

    echo "CLK:${date_str}${DATETIME_SEPARATOR}${time_str}"

    sleep "$CLOCK_INTERVAL"

done
