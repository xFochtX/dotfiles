#!/bin/bash

# Obtener el nombre del navegador desde el primer argumento
BROWSER="$1"

# Definir las rutas por defecto de los historiales de los navegadores
CHROME_HISTORY="$HOME/.config/google-chrome/Default/History"
CHROMIUM_HISTORY="$HOME/.config/chromium/Default/History"
FIREFOX_HISTORY="$HOME/.mozilla/firefox/*.default-release/places.sqlite"

LOG="$HOME/.cache/clear_browser_history.log"

# Comprobar el navegador y borrar el historial correspondiente
case "$BROWSER" in
chrome)
  if [ -f "$CHROME_HISTORY" ]; then
    # Borrar el historial de Chrome
    sqlite3 "$CHROME_HISTORY" "DELETE FROM urls;"
    echo "$(date): Historial de Chrome limpiado." >>"$LOG"
  else
    echo "$(date): Archivo de historial de Chrome no encontrado." >>"$LOG"
  fi
  ;;
chromium)
  if [ -f "$CHROMIUM_HISTORY" ]; then
    # Borrar el historial de Chromium
    sqlite3 "$CHROMIUM_HISTORY" "DELETE FROM urls;"
    echo "$(date): Historial de Chromium limpiado." >>"$LOG"
  else
    echo "$(date): Archivo de historial de Chromium no encontrado." >>"$LOG"
  fi
  ;;
firefox)
  # Para Firefox, puede que haya múltiples perfiles, por lo que usamos el patrón de archivos
  FIREFOX_PROFILES=$(find "$HOME/.mozilla/firefox/" -name "*.default-release" -type d)
  for PROFILE in $FIREFOX_PROFILES; do
    FIREFOX_HISTORY="$PROFILE/places.sqlite"
    if [ -f "$FIREFOX_HISTORY" ]; then
      # Borrar el historial de Firefox
      sqlite3 "$FIREFOX_HISTORY" "DELETE FROM moz_places;"
      echo "$(date): Historial de Firefox limpiado en el perfil $PROFILE." >>"$LOG"
    else
      echo "$(date): Archivo de historial de Firefox no encontrado en $PROFILE." >>"$LOG"
    fi
  done
  ;;
*)
  echo "$(date): Navegador no soportado o no reconocido." >>"$LOG"
  exit 1
  ;;
esac
