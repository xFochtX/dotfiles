#!/bin/bash

# Actualizar sistema
sudo pacman -Syu

# Esperar a que termine cualquier lock
while fuser /var/lib/pacman/db.lck >/dev/null 2>&1; do
  sleep 0.5
done

# Limpiar cache de checkupdates (CLAVE)
rm -rf /tmp/checkup-db-$(id -u)/

# Forzar actualización de Waybar
pkill -RTMIN+8 waybar
