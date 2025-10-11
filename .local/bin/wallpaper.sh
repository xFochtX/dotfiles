#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/dotfiles/assets/wallpapers"
MON1="eDP-1"
MON2="HDMI-A-1"

# Esperar hasta que la variable HYPRLAND_INSTANCE_SIGNATURE esté presente
for i in {1..10}; do
  if [[ -n "$HYPRLAND_INSTANCE_SIGNATURE" ]]; then
    break
  fi
  sleep 1
done

if [[ -z "$HYPRLAND_INSTANCE_SIGNATURE" ]]; then
  echo "HYPRLAND_INSTANCE_SIGNATURE no disponible. Abortando."
  exit 1
fi

while true; do
  WP1=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)
  WP2=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

  hyprctl hyprpaper reload "$MON1,$WP1"
  hyprctl hyprpaper reload "$MON2,$WP2"

  sleep 300
done
