#!/bin/bash

# Esperar a que pacman/libalpm termine (evita conflictos)
while fuser /var/lib/pacman/db.lck >/dev/null 2>&1; do
  sleep 0.5
done

# Contar actualizaciones sin tocar la DB real
updates=$(checkupdates 2>/dev/null | wc -l)

# Salida para Waybar
if [[ "$updates" -gt 0 ]]; then
  printf '{"text":" %d","tooltip":"%d updates available","class":"updates"}\n' "$updates" "$updates"
else
  printf '{"text":"","tooltip":"Up to date","class":"updated"}\n'
fi
