#!/bin/bash

function handle_sigint {
  echo "Received SIGINT. Exiting gracefully..."
  exit 0
}

# Register the SIGINT handler
trap handle_sigint SIGINT

dir="${XDG_CONFIG_HOME:-$HOME/.config}/alacritty"

themes=$(find "$dir/themes" -maxdepth 1 -type f)
selected=$(printf "%s\n" "${themes[@]}" | sort | fzf --preview "basename {} .yml" --preview-window down:1)

[[ "$selected" == "" ]] && exit 0

target="$dir/alacritty.yml"
[[ -f "$target" ]] && rm "$target"
ln -s "$selected" "$target"
