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

# Our connected monitors.
IFS=" " read -r primaryMonitor secondaryMonitor <<< $(monitors)

# Terminate already running bar instances
killall -q polybar 2>/dev/null

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

dir="$XDG_CONFIG_HOME/bspwm/rices/${RICE:-rose-pine}"

MONITOR="$primaryMonitor" polybar -c "$dir/polybar/config.ini" main-bar &

if [[ "$secondaryMonitor" != "" ]]; then
  MONITOR="$secondaryMonitor" polybar -c "$dir/polybar/config.ini" secondary-bar &
fi

