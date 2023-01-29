#!/bin/bash

dir="${XDG_CONFIG_HOME:-$HOME/.config}/alacritty"

themes=$(find "$dir/themes" -maxdepth 1 -type f)
selected=$(printf "%s\n" "${themes[@]}" | sort | fzf --preview "basename {} .yml" --preview-window down:1)

target="$dir/alacritty.yml"
rm "$target"
ln -s "$selected" "$target"
