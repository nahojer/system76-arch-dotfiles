#!/bin/bash

bspc config border_width "0"
bspc config top_padding "10"
bspc config bottom_padding "60"
bspc config normal_border_color "#9bced7" 
bspc config active_border_color "#9bced7"
bspc config focused_border_color "#c3a5e6"
bspc config presel_feedback_color "#c3a5e6"
bspc config left_padding "5"
bspc config right_padding "5"
bspc config window_gap "10"

# Terminate already running bar instances
killall -q polybar 2>/dev/null

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Start polybar on each primary and secondary monitor.
dir="$XDG_CONFIG_HOME/bspwm/rices/${RICE:-rose-pine}"
MONITOR="$(primarymonitor)" polybar -c "$dir/polybar/config.ini" main-bar &
[[ "$(secondarymonitor)" != "" ]] && MONITOR="$(secondarymonitor)" polybar -c "$dir/polybar/config.ini" secondary-bar &
