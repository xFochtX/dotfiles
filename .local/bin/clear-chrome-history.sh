#!/bin/bash

# Espera a que Chrome cierre
while pgrep -x "chrome" > /dev/null; do
    sleep 2
done

HISTORY_DB="$HOME/.config/google-chrome/Default/History"

if [ -f "$HISTORY_DB" ]; then
    # Vacía la tabla urls para borrar el historial
    sqlite3 "$HISTORY_DB" "DELETE FROM urls;"
    echo "$(date): Historial de Chrome limpiado." >> "$HOME/.cache/clear_chrome_history.log"
else
    echo "$(date): Archivo de historial no encontrado." >> "$HOME/.cache/clear_chrome_history.log"
fi

