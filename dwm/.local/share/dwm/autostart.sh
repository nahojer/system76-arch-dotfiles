#!/bin/sh

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

restart picom

run nitrogen --restore
