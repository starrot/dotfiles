#!/usr/bin/env bash

pkill -x lemonbar

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$DIR/bar.sh" &
