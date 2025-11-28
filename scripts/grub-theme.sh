#!/usr/bin/env bash

set -e

THEME_NAME="CyberEXS"
THEME_DIR="/boot/grub/themes/$THEME_NAME"
EFI_DIR="/boot/efi"
REPO="https://github.com/HenriqueLopes42/themeGrub.CyberEXS.git"

echo "==> Verificando que el sistema es UEFI..."
if [ ! -d /sys/firmware/efi ]; then
  echo "ERROR: Tu sistema NO es UEFI. Este script está hecho solo para UEFI."
  exit 1
fi

echo "==> Verificando herramientas necesarias..."
sudo pacman -S --needed --noconfirm grub git

echo "==> Clonando el tema CyberEXS..."
tmpdir=$(mktemp -d)
git clone "$REPO" "$tmpdir"

echo "==> Creando directorio de temas en GRUB..."
sudo mkdir -p "$THEME_DIR"

echo "==> Copiando tema..."
sudo cp -r "$tmpdir"/* "$THEME_DIR"

echo "==> Aplicando el tema en /etc/default/grub..."
if grep -q "^GRUB_THEME=" /etc/default/grub; then
  sudo sed -i "s|^GRUB_THEME=.*|GRUB_THEME=\"$THEME_DIR/theme.txt\"|" /etc/default/grub
else
  echo "GRUB_THEME=\"$THEME_DIR/theme.txt\"" | sudo tee -a /etc/default/grub
fi

echo "==> Regenerando configuración de GRUB..."
sudo grub-mkconfig -o /boot/grub/grub.cfg

echo "==> Limpiando..."
rm -rf "$tmpdir"

echo ""
echo "✔ Tema CyberEXS instalado exitosamente."
echo "Reinicia tu sistema para ver el nuevo GRUB."
