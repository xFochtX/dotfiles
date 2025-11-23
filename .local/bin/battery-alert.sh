#!/bin/bash

PLAY_SOUND="paplay /usr/share/sounds/freedesktop/stereo/bell.oga"
BATTERY_PATH=$(upower -e | grep BAT | head -n1) # Si hay varias baterías, toma la primera

get_battery_info() {
  # Obtener porcentaje y estado directamente con awk, sin pipes innecesarios
  PERCENT=$(upower -i $BATTERY_PATH | awk '/percentage/ {gsub("%",""); print $2}')
  STATE=$(upower -i $BATTERY_PATH | awk '/state/ {print $2}')
}

get_battery_info

while true; do
  # Batería baja (<10%) y no está cargando -> alarma
  if [[ $PERCENT -le 10 && $STATE != "charging" ]]; then
    $PLAY_SOUND
    sleep 5

  # Batería al 100% y cargando -> alarma continua
  elif [[ $PERCENT -eq 100 && $STATE == "fully-charged" ]]; then
    $PLAY_SOUND
    sleep 10

  # Cualquier otro caso
  else
    sleep 15 # Espera para no saturar CPU
  fi

  # Actualizar información de la batería
  get_battery_info
done
