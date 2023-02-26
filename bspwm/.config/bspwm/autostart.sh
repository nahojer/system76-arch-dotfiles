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
restart picom

ricedir="$XDG_CONFIG_HOME/bspwm/rices/${RICE:-rose-pine}"
[[ -f "$ricedir/autostart.sh" ]] && bash "$ricedir/autostart.sh"

run nitrogen --restore
