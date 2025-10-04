#!/bin/bash
set -e

echo "Habilitando y arrancando timers del usuario..."

# Timer personalizado para limpiar historial de Chrome
systemctl --user enable --now clear-chrome-history.timer

echo "Timers del usuario habilitados correctamente."
