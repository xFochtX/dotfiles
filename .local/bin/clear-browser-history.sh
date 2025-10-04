#!/bin/bash

LOG="$HOME/.cache/clear_chrome_history.log"
HISTORY_DB="$HOME/.config/google-chrome/Default/History"

if [ -f "$HISTORY_DB" ]; then
  # Borrar todas las URLs del historial
  sqlite3 "$HISTORY_DB" "DELETE FROM urls;"
  echo "$(date): Historial de Chrome limpiado al apagar." >>"$LOG"
else
  echo "$(date): Archivo de historial no encontrado al apagar." >>"$LOG"
fi
