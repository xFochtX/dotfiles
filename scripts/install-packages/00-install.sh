#!/bin/bash
set -e

echo "Instalando paquetes de pacman..."
sudo pacman -S --needed --noconfirm $(<"$DOTFILES/scripts/install-packages/packages/pacman.txt") &>/dev/null

echo "Instalando paquetes de BlackArch..."
if [ -f "$DOTFILES/scripts/install-packages/packages/blackarch.txt" ]; then
  while read -r pkg; do
    # Saltar líneas vacías o comentarios
    [[ -z "$pkg" || "$pkg" =~ ^# ]] && continue

    # Verificar si el paquete ya está instalado
    if pacman -Q "$pkg" &>/dev/null; then
      echo "✔️ Paquete BlackArch '$pkg' ya está instalado, saltando."
      continue
    fi

    echo "Instalando BlackArch/$pkg..."
    if ! sudo pacman -S --needed --noconfirm "blackarch/$pkg"; then
      echo "⚠️ Error instalando paquete BlackArch '$pkg', saltando al siguiente."
    fi
  done <"$DOTFILES/scripts/install-packages/packages/blackarch.txt"
else
  echo "ℹ️ No se encontró el archivo blackarch.txt, saltando..."
fi

echo "Instalando paquetes de AUR con paru..."

if ! command -v paru &>/dev/null; then
  echo "Paru no encontrado, instalando paru primero..."
  cd /tmp
  rm -rf paru
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
    echo "✔️ Paquete AUR '$pkg' ya está instalado, saltando."
    continue
  fi
  if ! paru -S --needed --noconfirm "$pkg"; then
    echo "⚠️ Error instalando paquete AUR '$pkg', saltando al siguiente."
  fi
done <"$DOTFILES/scripts/install-packages/packages/aur.txt"
