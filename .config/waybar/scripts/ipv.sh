#!/bin/bash

ipv_file=~/dotfiles/opt/ipv

# Crear archivo si no existe
[ -f "$ipv_file" ] || touch "$ipv_file"

ip_address=$(awk '{print $1}' "$ipv_file")
machine_name=$(awk '{print $2}' "$ipv_file")

if [ -n "$ip_address" ] && [ -n "$machine_name" ]; then
    output="󰓾 $ip_address - $machine_name"
else
    output="󱃓 No target 󰤎 "
fi

# Salida en formato JSON para Waybar
echo "{\"text\": \"$output\"}"

