#!/bin/bash
set -e

# 🗂️ Definir ruta absoluta del directorio dotfiles, de forma dinámica
DOTFILES="$(cd "$(dirname "$0")" && pwd)"
export DOTFILES

echo "Instalando paquetes de pacman..."
sudo pacman -S --needed - --noconfirm <packages/pacman.txt &>/dev/null

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
done <"$DOTFILES/packages/aur.txt"

echo "Instalado paquetes de GitHub"
"$DOTFILES/scripts/install-opt/00-install.sh"

mkdir -p "$DOTFILES/.config/obsidian"

echo "Creando enlaces simbólicos..."

mkdir -p ~/.config/systemd/user
# Recorre todos los archivos .service y .timer
for unit_file in "$DOTFILES/.config/systemd/user/"*.service "$DOTFILES/.config/systemd/user/"*.timer; do
  [ -e "$unit_file" ] || continue
  unit_name=$(basename "$unit_file")
  target="$HOME/.config/systemd/user/$unit_name"

  echo "→ Enlazando $unit_name"
  ln -sf "$unit_file" "$target"
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
bash "$DOTFILES/scripts/systemd/enable-services.sh"
#bash "$DOTFILES/scripts/systemd/enable-timers.sh"
#bash scripts/adjust-volume.sh

#sudo usermod --shell /usr/bin/zsh $(whoami)

echo "Ejecutando configuración para root..."
sudo DOTFILES="$DOTFILES" bash scripts/config-root.sh

echo "Instalación completa."
