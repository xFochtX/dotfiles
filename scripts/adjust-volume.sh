#!/bin/bash
set -e

echo "🔊 Ajustando volumen a 153%..."
pactl set-sink-volume @DEFAULT_SINK@ 153%
