#!/bin/bash
source ./list-packages-aur.sh
set -e

DOTFILES_DIR="$HOME/dotfiles/packages"

# Lista explícitos (oficiales + AUR)
pacman -Qe --quiet | awk '{print $1}' | sort > "$DOTFILES_DIR/pacman-all.txt"

echo -e "\n📦 Actualizando lista de paquetes AUR..."
if command -v paru &> /dev/null || command -v yay &> /dev/null; then
    pacman -Qm | awk '{print $1}' | sort > "$DOTFILES_DIR/aur-all.txt"
    filter_existing_aur_pkgs "$DOTFILES_DIR/aur-all.txt" "$DOTFILES_DIR/aur.txt"
    echo "✅ Paquetes de AUR actualizados."
else
    echo "⚠️  Paru o yay no está instalado. Saltando AUR."
fi

echo -e "\n📦 Actualizando lista de aplicaciones Flatpak..."
if command -v flatpak &> /dev/null; then
    flatpak list --app --columns=application | sort > "$DOTFILES_DIR/flatpak.txt"
    echo "✅ Aplicaciones Flatpak actualizadas."
else
    echo "⚠️  Flatpak no está instalado. Saltando Flatpak."
fi

echo -e "\n📦 Actualizando lista de paquetes pacman..."
comm -23 "$DOTFILES_DIR/pacman-all.txt" "$DOTFILES_DIR/aur-all.txt" > "$DOTFILES_DIR/pacman.txt"
rm "$DOTFILES_DIR/pacman-all.txt" "$DOTFILES_DIR/aur-all.txt"
echo "✅ Paquetes de pacman actualizados."

echo -e "\n📄 Todas las listas de paquetes han sido actualizadas."
