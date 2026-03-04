#!/bin/bash

################################################################################
# Descripción:
#   Este script alterna entre dos estados relacionados con la visualización de
#   la IP de la VPN: "private" y "public".
#   Permite determinar si se desea mostrar la IP privada de la VPN o la IP
#   pública en un widget de Waybar u otro script.
#
# Comportamiento:
#   1. Archivo de estado:
#       /tmp/waybar-toggle-vpn-state
#      - Contiene el estado actual: "private" o "public".
#      - Si no existe, se inicializa automáticamente con "public".
#
#   2. Alternancia de estados:
#      - Si el estado actual es "public", al ejecutar el script se cambia a "private".
#      - Si el estado actual es "private", al ejecutar el script se cambia a "public".
#      - El nuevo estado se guarda en el archivo de estado para que otros
#        scripts o widgets puedan leerlo.
################################################################################

state_file="/tmp/waybar-toggle-vpn-state"

[ -f "$state_file" ] || echo "public" >"$state_file"

current=$(cat "$state_file")

if [ "$current" = "public" ]; then
  echo "private" >"$state_file"
else
  echo "public" >"$state_file"
fi
