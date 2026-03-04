#!/bin/bash

################################################################################
# Descripción:
#   Muestra la IP de la VPN en formato JSON para Waybar.
#   Permite alternar entre la IP pública y la IP privada de la VPN.
#
# Comportamiento:
#   1. Archivo de estado:
#       /tmp/waybar-toggle-vpn-state
#      - Contiene el estado actual: "private" o "public".
#      - Si no existe, se inicializa automáticamente con "public".
#
#   2. Alternancia:
#      - Si el estado es "public", se muestra la IP pública de la VPN.
#      - Si el estado es "private", se muestra la IP privada (de interfaces tun0, wg0, proton0).
################################################################################

state_file="/tmp/waybar-toggle-vpn-state"

# Inicializar el archivo de estado si no existe (inicia como "public")
[ -f "$state_file" ] || echo "public" >"$state_file"
state=$(cat "$state_file")

if [ "$state" = "private" ]; then
  # Modo privado: mostrar IP privada de la VPN
  VPN_IFACES_PRIVATES=("tun0" "wg0" "proton0")
  CONNECTED=0

  for IFACE in "${VPN_IFACES_PRIVATES[@]}"; do
    IP=$(ip -4 addr show "$IFACE" 2>/dev/null | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
    if [ -n "$IP" ]; then
      echo "{\"text\": \"󰆧 $IP\", \"tooltip\": \"Private VPN IP - $IFACE\", \"class\": \"vpn-on\", \"alt\": \"connected\"}"
      CONNECTED=1
      break
    fi
  done

  if [ $CONNECTED -eq 0 ]; then
    VPN_LIST=$(
      IFS=,
      echo "${VPN_IFACES_PRIVATES[*]}"
    )
    echo "{\"text\": \"󱐝  VPN Disconnected\", \"tooltip\": \"No $VPN_LIST\", \"class\": \"vpn-off\", \"alt\": \"disconnected\"}"
  fi

else
  # Modo público: mostrar IP pública desde la primera página disponible
  PUBLIC_IP_SOURCES=("ifconfig.me" "ipinfo.io/ip")
  PUBLIC_IP=""
  SOURCE_USED=""

  for URL in "${PUBLIC_IP_SOURCES[@]}"; do
    IP=$(curl "$URL")
    # Validar que la respuesta sea una IP IPv4 simple
    if [[ $IP =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
      PUBLIC_IP="$IP"
      SOURCE_USED="$URL"
      break
    fi
  done

  if [ -n "$PUBLIC_IP" ]; then
    echo "{\"text\": \"󰆧 $PUBLIC_IP\", \"tooltip\": \"Public IP - $SOURCE_USED\", \"class\": \"vpn-on\", \"alt\": \"connected\"}"
  else
    echo "{\"text\": \"󱐝  Public IP Unavailable\", \"tooltip\": \"Could not fetch public IP\", \"class\": \"vpn-off\", \"alt\": \"disconnected\"}"
  fi
fi
