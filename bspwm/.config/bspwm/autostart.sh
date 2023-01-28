#/bin/bash

function run {
  if ! pgrep $1 ;
  then 
    $@&
  fi
}

run sxhkd -c "$HOME/.config/bspwm/sxhkd/sxhkdrc"
run picom --config "$HOME/.config/picom/picom.conf"
run nitrogen --restore
