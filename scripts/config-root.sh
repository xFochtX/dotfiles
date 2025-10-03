#!/bin/bash
set -e

echo "Creando enlaces simbólicos para root en carpeta dotfiles..."
sudo ln -sf "$DOTFILES/.zshrc" /root/.zshrc
sudo ln -sf "$DOTFILES/.p10k.zsh" /root/.p10k.zsh
sudo rm -rf /root/.config/
sudo mkdir /root/.config
sudo ln -sf "$DOTFILES/opt/nvim" /root/.config/nvim

#echo "Creando enlaces simbólicos para root en subcarpetas de dotfiles..."
#PARENT_DIR="${DOTFILES%/dotfiles}"
#sudo ln -sf "$PARENT_DIR/powerlevel10k" /root/powerlevel10k

echo "Cambiando shell de root a zsh si es necesario..."
if [ -x /usr/bin/zsh ] && [ "$(getent passwd root | cut -d: -f7)" != "/usr/bin/zsh" ]; then
    sudo usermod --shell /usr/bin/zsh root
fi

echo "Configuración para root completada."
