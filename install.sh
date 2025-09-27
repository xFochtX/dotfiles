#!/bin/bash

set -e

echo "📦 Instalando paquetes de pacman..."
sudo pacman -S --needed - < packages/pacman.txt

echo "📦 Instalando paquetes de AUR con paru..."
if ! command -v paru &> /dev/null; then
	cd /tmp
	git clone https://aur.archlinux.org/paru.git
	cd paru
	makepkg -si
	paru -S --needed - < packages/aur.txt
else
	paru -S --needed - < packages/aur.txt
fi

echo "🔗 Creando enlaces simbólicos..."
#ln -sf ~/dotfiles/config/kitty ~/.config/kitty
#ln -sf ~/dotfiles/config/hypr ~/.config/hypr
#ln -sf ~/dotfiles/config/zsh/.zshrc ~/.zshrc

echo "⚙️ Ejecutando configuración adicional..."
bash scripts/enable-services.sh
bash scripts/adjust-volume.sh
#bash scripts/setup-hyprland.sh

sudo usermod --shell /usr/bin/zsh $(whoami)

if [ -x /usr/bin/zsh ] && [ "$(getent passwd root | cut -d: -f7)" != "/usr/bin/zsh" ]; then
    echo "🔄 Cambiando el shell de root a zsh..."
    sudo usermod --shell /usr/bin/zsh root
fi

echo "✅ Instalación completa."
