#!/bin/bash
set -e

echo "Habilitando y arrancando timers del usuario..."

# Timer personalizado para limpiar historial de Chrome
# systemctl --user enable --now clear-chrome-history.timer

## ─── Servicios del sistema (requieren sudo) ───────────────────────────────────
echo "Habilitando servicios del sistema..."

# Reflector
sudo systemctl enable --now reflector.timer

# Mantenimiento SSD
sudo systemctl enable --now fstrim.timer

echo "Timers del usuario habilitados correctamente."
