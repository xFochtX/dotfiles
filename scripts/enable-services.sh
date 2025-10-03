#!/bin/bash
set -e

echo "Habilitando y arrancando servicios del usuario..."

## ─── Servicios de usuario ─────────────────────────────────────────────────────
# Audio / PipeWire
systemctl --user enable --now pipewire.service pipewire-pulse.service wireplumber.service

# Servicios personalizados del usuario
echo "Activando servicios personalizados del usuario..."

# Servicio para limpiar historial de Chrome al cerrar el navegador
systemctl --user enable --now clear-chrome-history.service

## ─── Servicios del sistema (requieren sudo) ───────────────────────────────────
echo "Habilitando servicios del sistema..."

# NetworkManager
sudo systemctl enable --now NetworkManager.service

# SDDM (Display Manager)
sudo systemctl enable sddm.service

echo "Todos los servicios fueron activados correctamente."
