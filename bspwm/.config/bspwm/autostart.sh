#/bin/bash

function run {
  if ! pgrep $1 ;
  then 
    $@&
  fi
}

run sxhkd -c "$HOME/.config/bspwm/sxhkd/sxhkdrc"
run picom
run nitrogen --restore
