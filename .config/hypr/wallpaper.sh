#!/bin/bash

# Carpeta con wallpapers
WALLPAPER_DIR="$HOME/dotfiles/assets/wallpapers"
WALLPAPERS=($(ls "$WALLPAPER_DIR"))

# Monitores
MON1="eDP-1"
MON2="HDMI-A-1"

while true; do
  # Elegir dos wallpapers aleatorios
  WP1="${WALLPAPERS[RANDOM % ${#WALLPAPERS[@]}]}"
  WP2="${WALLPAPERS[RANDOM % ${#WALLPAPERS[@]}]}"

  # Cambiar wallpapers usando hyprctl
  hyprctl hyprpaper unload all
  hyprctl hyprpaper preload "$WALLPAPER_DIR/$WP1"
  hyprctl hyprpaper preload "$WALLPAPER_DIR/$WP2"
  hyprctl hyprpaper wallpaper "$MON1,$WALLPAPER_DIR/$WP1"
  hyprctl hyprpaper wallpaper "$MON2,$WALLPAPER_DIR/$WP2"

  # Esperar 5 minutos
  sleep 300
done
