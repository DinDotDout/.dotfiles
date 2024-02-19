#!/bin/bash
# DIR="$HOME/Pictures/screenshots/"
# NAME="screenshot_$(date +%d%m%Y_%H%M%S).png"

# Snapshot - Selected area - Edit and save
grim -g "$(slurp)" - | swappy -f -
notify-send "Screenshot created" "Mode: Selected area"
