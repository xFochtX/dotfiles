#!/bin/bash

# Archivo temporal para guardar el timestamp cuando la batería llegó al 100%
STATE_FILE="/tmp/battery_full_timestamp"

# Comando para reproducir sonido
PLAY_SOUND="paplay /usr/share/sounds/freedesktop/stereo/bell.oga"

# Obtener porcentaje de batería
PERCENT=$(upower -i $(upower -e | grep BAT) | grep percentage | awk '{print $2}' | tr -d '%')
echo $PERCENT
# Obtener estado de la batería (charging, discharging, fully-charged)
STATE=$(upower -i $(upower -e | grep BAT) | grep state | awk '{print $2}')
echo $STATE
