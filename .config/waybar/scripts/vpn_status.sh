#!/bin/bash

state_file="/tmp/waybar_vpn_state"
[ -f "$state_file" ] || echo "vpn" > "$state_file"
state=$(cat "$state_file")

# Target mode
ipv_file=~/dotfiles/opt/target
[ -f "$ipv_file" ] || touch "$ipv_file"

if [ "$state" = "ip" ]; then
    ip_address=$(awk '{print $1}' "$ipv_file")
    machine_name=$(awk '{print $2}' "$ipv_file")

    if [ -n "$ip_address" ] && [ -n "$machine_name" ]; then
        output="󰓾 $machine_name"
        tooltip="󰌢  $ip_address"
        echo "{\"text\": \"$output\", \"tooltip\": \"$tooltip\", \"class\": \"ip-view\", \"alt\": \"local-ip\"}"
    else
        echo "{\"text\": \"󱐝  No target\", \"tooltip\": \"Archivo vacío o inválido\", \"class\": \"ip-empty\", \"alt\": \"no-ip\"}"
    fi
else
    # VPN mode
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
fi

