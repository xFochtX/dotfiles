#!/bin/bash

# Archivo temporal para guardar el timestamp cuando la batería llegó al 100%
STATE_FILE="/tmp/battery_full_timestamp"

# Comando para reproducir sonido
PLAY_SOUND="paplay /usr/share/sounds/freedesktop/stereo/bell.oga"

# Obtener la ruta del dispositivo de batería
BATTERY_PATH=$(upower -e | grep BAT)

# Obtener el porcentaje de batería y el estado
get_battery_info() {
  PERCENT=$(upower -i $BATTERY_PATH | grep percentage | awk '{print $2}' | tr -d '%')
  STATE=$(upower -i $BATTERY_PATH | grep state | awk '{print $2}')
}

# Inicializar la información de la batería
get_battery_info

# Si la batería está por debajo del 15% y no se está cargando, emitir alarma
while [[ $PERCENT -lt 15 && $STATE != "charging" ]]; do
  echo "Batería baja. Emitiendo alarma..."
  $PLAY_SOUND
  sleep 5
  get_battery_info # Actualizar los valores de porcentaje y estado
done

echo "Batería cargando o por encima del 15%. Fin de la alarma."
