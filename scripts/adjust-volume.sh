#!/bin/bash
set -e

echo "Ajustando volumen a 100%..."
pactl set-sink-volume @DEFAULT_SINK@ 100%
