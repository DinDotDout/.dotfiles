#!/bin/bash
# Could always kill -9 but prefer to use the hyprctl dispatch killactive
force_kill=("org.telegram.desktop" "discord")
current_app_class=$(hyprctl activewindow | grep class | sed 's/class://g' | xargs)
pid=$(hyprctl activewindow | grep pid | sed 's/pid://g' | xargs)
for element in "${force_kill[@]}"; do
    if [[ "${element}" == "${current_app_class}" ]]; then
        echo 'is in'
        if [ -n "$pid" ]; then
            kill -9 $pid
        fi
        exit 0
    fi
done
hyprctl dispatch killactive
