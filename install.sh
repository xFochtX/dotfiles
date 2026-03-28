#!/bin/bash
set -e

# Definir ruta absoluta del directorio dotfiles, de forma dinámica
DOTFILES="$(cd "$(dirname "$0")" && pwd)"
export DOTFILES

echo "Sincronizando repositorio BlackArch..."
bash "$DOTFILES/scripts/sync-blackarch.sh"

echo "Instalando paquetes..."
bash "$DOTFILES/scripts/install-packages/00-install.sh"

echo "Reconstruyendo la caché de fuentes..."
fc-cache -fv

echo "Creando enlaces simbólicos de configs..."
bash "$DOTFILES/scripts/links/configs.sh"

echo "Creando enlaces simbólicos de systemd..."
bash "$DOTFILES/scripts/links/systemd.sh"

echo "Ejecutando configuración para root..."
sudo DOTFILES="$DOTFILES" bash scripts/links/root.sh

echo "Ejecutando configuración adicional..."
bash "$DOTFILES/scripts/systemd/services.sh"
bash "$DOTFILES/scripts/systemd/timers.sh"
bash scripts/adjust-volume.sh

sudo usermod --shell /usr/bin/zsh $(whoami)

echo "Instalado programas..."
bash "$DOTFILES/scripts/install-opt/00-install.sh"

echo "Descargando material complementario..."
sudo bash "$DOTFILES/scripts/downloads/00-downloads.sh"

echo "[+] Actualice los mirrors para tener mejor latencia..."
echo "Instalación completa."
