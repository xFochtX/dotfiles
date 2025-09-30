#!/bin/bash

# Definir la ruta de configuración de Powerlevel10k
NVIM_CONFIG_DIR="$HOME/dotfiles/opt/powerlevel10k"

# Verificar si el directorio de configuración de Powerlevel10k existe
if [ ! -d "$NVIM_CONFIG_DIR" ]; then
  mkdir "$NVIM_CONFIG_DIR"
  echo "Clonando Powerlevel10k..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$NVIM_CONFIG_DIR"
else
  echo "Powerlevel10k ya está instalado, actualizando..."
  cd "$NVIM_CONFIG_DIR" && git pull
fi
