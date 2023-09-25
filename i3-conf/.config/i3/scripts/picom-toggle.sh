#!/bin/bash
if pgrep -x "picom" >/dev/null; then
	killall picom
else
	picom -b --config $HOME/.config/i3/picom.conf
fi
