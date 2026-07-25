#!/usr/bin/env bash


# ─── Fonts ─────────────────────────────

FONT="Cozette:size=11"
FONT_BOLD="Cozette:size=12"

#FONT="fixed:size=13"
#FONT_BOLD="fixed:size=13"

# ─── Bar  ─────────────────────────────

BAR_HEIGHT=20
BAR_WIDTH="100%"
BAR_OFFSET_X=0
BAR_OFFSET_Y=0

TOP=true

PADDING=6


# ─── Theme  ─────────────────────────

source "$HOME/.config/themes/output/lemonbar.sh"

BAR_BG="$FG_FAINT"
BAR_FG="$BG"

ACTIVE="$BG"
ACTIVE_ALT="$ACCENT_ALT"

INACTIVE="$FG_DIM"
EMPTY="$FG_DISABLED"

URGENT="$RED"
WARNING="$YELLOW"

SEPARATOR="$FG_FAINT"

# ─── Seperators  ─────────────────────────────

# Parser separator (between modules)
MODULE_SEPARATOR=" | "

# Date/Time separator
DATETIME_SEPARATOR=" · "

# ─── Module Update Intervals (seconds)────────

RAM_INTERVAL=2
VOLUME_INTERVAL=2
WIFI_INTERVAL=5
CLOCK_INTERVAL=1


# ─── Clock  ─────────────────────────────

CLOCK_FORMAT="%a %d %b  %H:%M"


# ────────────────────────────────
TITLE_MAX_LENGTH=70


# ─── Date & Time ─────────────────────────────
DATE_FORMAT="%d %B"
TIME_FORMAT="%H:%M:%S"


