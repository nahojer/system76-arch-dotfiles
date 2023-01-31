#!/bin/bash

function restart {
  killall $1
  $@&
}

dir="$XDG_CONFIG_HOME/bspwm/rices/${RICE:-rose-pine}"

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

restart polybar -c "$dir/polybar/config.ini"
