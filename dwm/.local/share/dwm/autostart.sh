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

restart sxhkd -c "$HOME/.local/share/dwm/sxhkd/sxhkdrc"
restart picom

run nitrogen --restore

restart slstatus
