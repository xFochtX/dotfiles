#!/bin/bash
set -e

# 🗂️ Definir ruta absoluta del directorio dotfiles, de forma dinámica
DOTFILES="$(cd "$(dirname "$0")" && pwd)"
export DOTFILES

echo "Instalando paquetes de pacman..."
sudo pacman -S --needed - < packages/pacman.txt --noconfirm &> /dev/null

echo "Instalando paquetes de AUR con paru..."
if ! command -v paru &> /dev/null; then
	cd /tmp
	git clone https://aur.archlinux.org/paru.git
	cd paru
	makepkg -si
	paru -S --needed - < packages/aur.txt --noconfirm &> /dev/null
else
	paru -S --needed - < packages/aur.txt --noconfirm &> /dev/null
fi

echo "Instalado paquetes de GitHub"
"$DOTFILES/scripts/install-opt/00-install.sh"

echo "Creando enlaces simbólicos..."

mkdir -p ~/.config/systemd/user
# Recorre todos los archivos .service de tu dotfiles
for service_file in "$DOTFILES/.config/systemd/user/"*.service; do
  service_name=$(basename "$service_file")
  target="$HOME/.config/systemd/user/$service_name"

  echo "→ Enlazando $service_name"
  ln -sf "$service_file" "$target"
done

rm -rf ~/.config/kitty
ln -sf "$DOTFILES/.config/kitty" ~/.config/kitty
rm -rf ~/.config/hypr
ln -sf "$DOTFILES/.config/hypr" ~/.config/hypr
rm -rf ~/.config/waybar
ln -sf "$DOTFILES/.config/waybar" ~/.config/waybar
rm -rf ~/.config/nvim
ln -sf "$DOTFILES/opt/nvim" ~/.config/nvim
ln -sf "$DOTFILES/.zshrc" ~/.zshrc
ln -sf "$DOTFILES/.p10k.zsh" ~/.p10k.zsh

echo "Ejecutando configuración adicional..."
bash "$DOTFILES/scripts/enable-services.sh"
#bash scripts/adjust-volume.sh

#bash scripts/setup-hyprland.sh

#sudo usermod --shell /usr/bin/zsh $(whoami)

echo "🔧 Ejecutando configuración para root..."
sudo DOTFILES="$DOTFILES" bash scripts/config-root.sh

echo "✅ Instalación completa."
