#!/bin/bash

# Definir la ruta de configuración de Neovim
NVIM_CONFIG_DIR="$HOME/dotfiles/opt/nvim"

# Verificar si el directorio de configuración de NvChad existe
if [ ! -d "$NVIM_CONFIG_DIR" ]; then
  mkdir "$NVIM_CONFIG_DIR"
  echo "Clonando NvChad..."
  git clone --depth=1 https://github.com/NvChad/starter "$NVIM_CONFIG_DIR"
else
  echo "NvChad ya está instalado, actualizando..."
  cd "$NVIM_CONFIG_DIR" && git pull
fi
