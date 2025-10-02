#!/bin/bash

INTERFACE="wlp3s0"

LINK_STATE=$(cat /sys/class/net/"$INTERFACE"/operstate 2>/dev/null)
IP=$(ip -4 addr show "$INTERFACE" 2>/dev/null | grep -oP '(?<=inet\s)\d+(\.\d+){3}')

# Usamos nmcli para obtener SSID (más confiable que iw)
SSID=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d':' -f2)

SIGNAL=$(grep "$INTERFACE" /proc/net/wireless | awk '{print int($3 * 100 / 70)}')

# Caso 1: Interfaz no disponible
if ! ip link show "$INTERFACE" &>/dev/null; then
    echo '{"text":"󱚼  Disconnected", "tooltip":"Wi-Fi desconectado", "class":"wifi-disconnected"}'
    exit
fi

# Caso 2: Enlace activo pero sin IP
if [[ "$LINK_STATE" == "up" && -z "$IP" ]]; then
    echo "{\"text\":\"$INTERFACE (No IP) \", \"tooltip\":\"$INTERFACE conectado, sin IP asignada\", \"class\":\"wifi-linked\"}"
    exit
fi

# Caso 3: Conectado con IP
if [[ -n "$IP" ]]; then
    TOOLTIP="$INTERFACE - $SSID ($SIGNAL%)"
    echo "{\"text\":\"  $IP\", \"tooltip\":\"$TOOLTIP\", \"class\":\"wifi-connected\"}"
    exit
fi

# ⚠️ Fallback
echo '{"text":"󱚼 Sin conexión", "tooltip":"Estado desconocido", "class":"wifi-unknown"}'

