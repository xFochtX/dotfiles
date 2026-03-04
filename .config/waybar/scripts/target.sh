#!/bin/bash

target_file=~/dotfiles/opt/target
[ -f "$target_file" ] || touch "$target_file"

# Extraer IP y name del archivo con formato ip:$IP / name:$NAME
ip_target=$(grep '^ip:' "$target_file" | cut -d':' -f2-)
name_target=$(grep '^name:' "$target_file" | cut -d':' -f2-)

if [ -n "$ip_target" ] && [ -n "$name_target" ]; then
  output="󰓾 $ip_target"
  tooltip="󰌢  $name_target"
  echo "{\"text\": \"$output\", \"tooltip\": \"$tooltip\", \"class\": \"ip-view\", \"alt\": \"local-ip\"}"
else
  echo "{\"text\": \"󱐝  No target\", \"tooltip\": \"Without a target\", \"class\": \"ip-empty\", \"alt\": \"no-ip\"}"
fi
