#!/bin/bash
# Get the colors from pywal
source ~/.cache/wal/colors.sh
text=$color7
ring=$color7
keyh_log=$color6

# Apply the colors to swaylock
swaylock --text-color=$text \
	--key-hl-color=$keyh_log \
	--ring-color=$ring \
	--ring-clear-color=$ring \
	--ring-caps-lock-color=$ring \
	--ring-ver-color=$ring \
	--ring-wrong-color=$ring \
	--caps-lock-key-hl-color=$ring \
	--caps-lock-bs-hl-color=$ring \
	--line-clear-color=$ring \
	--line-caps-lock-color=$ring \
	--line-ver-color=$ring \
	--line-wrong-color=$ring \
	--text-color=$ring \
	--text-clear-color=$ring \
	--text-ver-color=$ring \
	--text-wrong-color=$ring \
	--text-caps-lock-color=$ring \
	--bs-hl-color=$ring
