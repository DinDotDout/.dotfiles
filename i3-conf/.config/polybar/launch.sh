#!/bin/sh
#!/usr/bin/env bash

# Add this script to your wm startup file.

# Terminate already running bar instances
killall -q polybar
# MONITOR=$(polybar -m|tail -1|sed -e 's/:.*$//g'
MONITOR=$"MONITOR"
# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep .15; done

# Launch the bar
polybar -q left &
polybar -q center &
polybar -q right &
polybar -q day &
sleep 0.3
polybar -q hour &
# polybar -q secondary &
