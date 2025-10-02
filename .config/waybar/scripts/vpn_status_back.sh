#!/bin/bash

VPN_IFACES=("tun0" "wg0")
CONNECTED=0

for IFACE in "${VPN_IFACES[@]}"; do
    IP=$(ip -4 addr show "$IFACE" 2>/dev/null | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
    if [ -n "$IP" ]; then
        echo "{\"text\": \"󰆧 $IP\", \"tooltip\": \"$IFACE: $IP\", \"class\": \"vpn-on\", \"alt\": \"connected\"}"
        CONNECTED=1
        break
    fi
done

if [ $CONNECTED -eq 0 ]; then
    echo "{\"text\": \"󱐝  Disconnected\", \"tooltip\": \"VPN desconectada\", \"class\": \"vpn-off\", \"alt\": \"disconnected\"}"
fi
