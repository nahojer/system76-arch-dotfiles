#!/bin/bash

function run {
  if ! pgrep $1 ;
  then 
    $@&
  fi
}

function restart {
  killall $1
  $@&
}

restart sxhkd -c "$HOME/.config/bspwm/sxhkd/sxhkdrc"

ricedir="$XDG_CONFIG_HOME/bspwm/rices/${RICE:-rose-pine}"
[[ -f "$ricedir/autostart.sh" ]] && bash "$ricedir/autostart.sh"


[[ -f "$ricedir/picom.conf" ]] && restart picom --config "$ricedir/picom.conf" || restart picom

run nitrogen --restore
