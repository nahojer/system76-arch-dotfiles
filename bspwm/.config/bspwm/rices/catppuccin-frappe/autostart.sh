#!/bin/bash

# Terminate already running bar instances
killall -q polybar 2>/dev/null

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Start polybar on each primary and secondary monitor.
dir="$XDG_CONFIG_HOME/bspwm/rices/catppuccin-frappe"
MONITOR="$(primarymonitor)" polybar -c "$dir/polybar/config.ini" main-bar &
[[ "$(secondarymonitor)" != "" ]] && MONITOR="$(secondarymonitor)" polybar -c "$dir/polybar/config.ini" secondary-bar &
