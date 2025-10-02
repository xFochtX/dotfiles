#!/bin/bash

# Archivos temporales para timestamps
FULL_STATE_FILE="/tmp/battery_full_timestamp"
LOW_STATE_FILE="/tmp/battery_low_timestamp"

# Comando para reproducir sonido
PLAY_SOUND="paplay /usr/share/sounds/freedesktop/stereo/bell.oga"

# Umbral para batería baja
LOW_THRESHOLD=15

# Tiempo entre alertas para batería baja (en segundos)
LOW_ALERT_INTERVAL=15

# Obtener porcentaje de batería
PERCENT=$(upower -i $(upower -e | grep BAT) | grep percentage | awk '{print $2}' | tr -d '%')

# Obtener estado de la batería (charging, discharging, fully-charged)
STATE=$(upower -i $(upower -e | grep BAT) | grep state | awk '{print $2}')

# Tiempo actual en segundos
CURRENT_TIME=$(date +%s)

# --- Alerta batería llena (como antes) ---
if [[ "$STATE" == "fully-charged" ]]; then
    if [ ! -f "$FULL_STATE_FILE" ]; then
        echo "$CURRENT_TIME" > "$FULL_STATE_FILE"
        exit 0
    fi

    LAST_TIME=$(cat "$FULL_STATE_FILE")
    TIME_DIFF=$((CURRENT_TIME - LAST_TIME))

    if (( TIME_DIFF >= 30 )); then
        MOD=$(( (TIME_DIFF - 30) % 15 ))
        if [[ "$MOD" -eq 0 ]]; then
            $PLAY_SOUND
        fi
    fi

else
    rm -f "$FULL_STATE_FILE"
fi

# --- Alerta batería baja ---
if (( PERCENT <= LOW_THRESHOLD )) && [[ "$STATE" != "charging" ]]; then
    if [ ! -f "$LOW_STATE_FILE" ]; then
        echo "$CURRENT_TIME" > "$LOW_STATE_FILE"
        $PLAY_SOUND
    else
        LAST_LOW_TIME=$(cat "$LOW_STATE_FILE")
        LOW_TIME_DIFF=$((CURRENT_TIME - LAST_LOW_TIME))
        if (( LOW_TIME_DIFF >= LOW_ALERT_INTERVAL )); then
            echo "$CURRENT_TIME" > "$LOW_STATE_FILE"
            $PLAY_SOUND
        fi
    fi
else
    rm -f "$LOW_STATE_FILE"
fi

