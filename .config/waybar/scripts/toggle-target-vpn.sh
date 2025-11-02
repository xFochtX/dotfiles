#!/bin/bash

state_file="/tmp/waybar-toggle-target-vpn-state"

[ -f "$state_file" ] || echo "vpn" >"$state_file"

current=$(cat "$state_file")

if [ "$current" = "vpn" ]; then
  echo "target" >"$state_file"
else
  echo "vpn" >"$state_file"
fi
