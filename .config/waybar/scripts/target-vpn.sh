#!/bin/bash

state_file="/tmp/waybar-toggle-target-vpn-state"
[ -f "$state_file" ] || echo "target" >"$state_file"
state=$(cat "$state_file")

# Target mode
target_file=~/dotfiles/opt/target
[ -f "$target_file" ] || touch "$target_file"

if [ "$state" = "target" ]; then
  # Extraer IP y name del archivo con formato ip:$IP / name:$NAME
  ip_target=$(grep '^ip:' "$target_file" | cut -d':' -f2-)
  name_target=$(grep '^name:' "$target_file" | cut -d':' -f2-)

  if [ -n "$ip_target" ] && [ -n "$name_target" ]; then
    output="󰓾 $ip_target"
    tooltip="󰌢  $name_target"
    echo "{\"text\": \"$output\", \"tooltip\": \"$tooltip\", \"class\": \"ip-view\", \"alt\": \"local-ip\"}"
  else
    echo "{\"text\": \"󱐝  No target\", \"tooltip\": \"Without a target\", \"class\": \"ip-empty\", \"alt\": \"no-ip\"}"
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
