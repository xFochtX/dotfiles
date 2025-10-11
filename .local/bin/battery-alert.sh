#!/bin/bash

STATE_FILE="/tmp/battery_full_timestamp"
PLAY_SOUND="paplay /usr/share/sounds/freedesktop/stereo/bell.oga"
BATTERY_PATH=$(upower -e | grep BAT)

get_battery_info() {
  PERCENT=$(upower -i $BATTERY_PATH | grep percentage | awk '{print $2}' | tr -d '%')
  STATE=$(upower -i $BATTERY_PATH | grep state | awk '{print $2}')
}

get_battery_info

while true; do
  # Si batería baja y no está cargando -> alarma
  if [[ $PERCENT -lt 10 && $STATE != "charging" ]]; then
    echo "Batería baja. Emitiendo alarma..."
    $PLAY_SOUND
    sleep 5

  # Si batería al 100% y cargando, manejar temporizador
  elif [[ $PERCENT -eq 100 && $STATE == "charging" ]]; then
    if [[ ! -f $STATE_FILE ]]; then
      # Guardar el timestamp actual
      date +%s >$STATE_FILE
    else
      # Leer timestamp guardado
      start_time=$(cat $STATE_FILE)
      current_time=$(date +%s)
      elapsed=$((current_time - start_time))
      if ((elapsed >= 15)); then
        echo "Batería al 100% por más de 15 segundos. Emitiendo alarma..."
        $PLAY_SOUND
        sleep 5
        # Resetear timestamp para que la alarma no se repita sin pausa
        rm -f $STATE_FILE
      fi
    fi

  else
    # En cualquier otro caso borrar el archivo para resetear el temporizador
    [[ -f $STATE_FILE ]] && rm -f $STATE_FILE
    # Esperar un poco para no saturar el CPU
    sleep 5
  fi

  get_battery_info
done
