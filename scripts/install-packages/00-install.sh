#!/bin/bash
set -e

echo "Instalando paquetes de pacman..."
sudo pacman -S --needed - --noconfirm <"$DOTFILES/scripts/install-packages/packages/pacman.txt" &>/dev/null

echo "Instalando paquetes de AUR con paru..."

if ! command -v paru &>/dev/null; then
  echo "Paru no encontrado, instalando paru primero..."
  cd /tmp
  git clone https://aur.archlinux.org/paru.git
  cd paru
  makepkg -si --noconfirm
  cd -
fi

while read -r pkg; do
  # Saltar líneas vacías o comentarios
  [[ -z "$pkg" || "$pkg" =~ ^# ]] && continue

  # Verificar si el paquete ya está instalado
  if paru -Q "$pkg" &>/dev/null; then
    echo "✔️ Paquete '$pkg' ya está instalado, saltando."
    continue
  fi
  if ! paru -S --needed --noconfirm "$pkg"; then
    echo "⚠️ Error instalando paquete '$pkg', saltando al siguiente."
  fi
done <"$DOTFILES/scripts/install-packages/packages/aur.txt"
