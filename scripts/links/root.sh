#!/bin/bash
set -e

# Usa la variable DOTFILES si está exportada, si no, calcula la ruta
DOTFILES="${DOTFILES:-$(cd "$(dirname "$0")/../../" && pwd)}"

echo "Creando enlaces simbólicos para root en la carpeta dotfiles..."

# ----------------------------
# Dotfiles principales para root
# ----------------------------
sudo ln -sf "$DOTFILES/.zshrc" /root/.zshrc
sudo ln -sf "$DOTFILES/.p10k.zsh" /root/.p10k.zsh
sudo ln -sf "$DOTFILES/.latexmkrc" /root/.latexmkrc

# ----------------------------
# Configuraciones de aplicaciones para root
# ----------------------------
# Limpiar y crear carpeta .config
sudo rm -rf /root/.config
sudo mkdir -p /root/.config

# Neovim
sudo ln -sf "$DOTFILES/opt/nvim" /root/.config/nvim

# Obsidian
sudo ln -sf "$DOTFILES/.config/obsidian" /root/.config/obsidian

# Broot
sudo ln -sf "$DOTFILES/.config/broot" /root/.config/broot

# Yazi
sudo ln -sf "$DOTFILES/.config/yazi" /root/.config/yazi

# Servicio SDDM Random Theme
echo "Instalando servicio sddm-random-theme..."
sudo install -Dm644 "$DOTFILES/.config/systemd/system/sddm-random-theme.service" /etc/systemd/system/sddm-random-theme.service

# Theme sddm
sudo ln -sf "$DOTFILES/etc/sddm.conf" /etc/sddm.conf

# ----------------------------
# Binarios personalizados
# ----------------------------
for file in "$DOTFILES/bin"/*; do
  sudo ln -sf "$file" /usr/local/bin/$(basename "$file")
done

# ----------------------------
# Cambiar shell de root a zsh si es necesario
# ----------------------------
echo "Comprobando y cambiando shell de root a zsh si es necesario..."
if [ -x /usr/bin/zsh ] && [ "$(getent passwd root | cut -d: -f7)" != "/usr/bin/zsh" ]; then
  sudo usermod --shell /usr/bin/zsh root
fi

echo "Configuración para root completada."
