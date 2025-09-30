#!/bin/bash

# Definir la ruta de configuración de sudo-plugin
NVIM_CONFIG_DIR="$HOME/dotfiles/opt/sudo-plugin"

# Verificar si el directorio de configuración de sudo-plugin existe
if [ ! -d "$NVIM_CONFIG_DIR" ]; then
  mkdir "$NVIM_CONFIG_DIR"
  echo "Clonando sudo-plugin..."
  git clone --depth=1 https://github.com/none9632/zsh-sudo "$NVIM_CONFIG_DIR"
else
  echo "Sudo-plugin ya está instalado, actualizando..."
  cd "$NVIM_CONFIG_DIR" && git pull
fi
