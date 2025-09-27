#!/bin/bash
set -e

echo "🚀 Habilitando y arrancando servicios del usuario..."

# PipeWire (audio/video)
systemctl --user enable --now pipewire pipewire-pulse wireplumber

# NetworkManager
sudo systemctl enable --now NetworkManager.service

# SDDM
sudo systemctl enable --now sddm.service

echo "✅ Servicios activados."
