#!/bin/bash

state_file="/tmp/waybar_vpn_state"

[ -f "$state_file" ] || echo "vpn" > "$state_file"

current=$(cat "$state_file")

if [ "$current" = "vpn" ]; then
    echo "ip" > "$state_file"
else
    echo "vpn" > "$state_file"
fi

