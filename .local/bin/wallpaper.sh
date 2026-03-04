#!/usr/bin/env bash

WALLPAPER_DIR="/usr/share/backgrounds"
MONITORS=("eDP-1" "HDMI-A-1")

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

get_monitor_id() {
  local monitor_name="$1"
  hyprctl monitors -j | jq -r --arg mon "$monitor_name" '.[] | select(.name == $mon) | .id'
}

# Devuelve 0 si el monitor tiene fullscreen activo
monitor_has_fullscreen() {
  local monitor_name="$1"
  local monitor_id

  monitor_id=$(get_monitor_id "$monitor_name")
  [[ -z "$monitor_id" ]] && return 1

  hyprctl clients -j | jq -e --argjson mid "$monitor_id" 'any(.[]; .fullscreen == 2 and .monitor == $mid)' >/dev/null
}

for MON in "${MONITORS[@]}"; do
  if monitor_has_fullscreen "$MON"; then
    echo "$MON tiene fullscreen"
  else
    echo "$MON libre"
  fi
done

while true; do
  for MON in "${MONITORS[@]}"; do
    if monitor_has_fullscreen "$MON"; then
      # Este monitor tiene video fullscreen -> No cambiar fondo de pantalla
      continue
    fi

    WP=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

    hyprctl hyprpaper preload "$WP"
    hyprctl hyprpaper wallpaper "$MON,$WP"
  done

  sleep 300
done
