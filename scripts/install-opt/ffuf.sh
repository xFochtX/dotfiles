#!/bin/bash

# Definir la ruta de configuración de ffuf
CONFIG_DIR="$HOME/dotfiles/opt/ffuf"

# Verificar si el directorio de configuración de ffuf existe
if [ ! -d "$CONFIG_DIR" ]; then
  mkdir "$CONFIG_DIR"
  echo "Clonando ffuf..."
  git clone --depth=1 https://github.com/ffuf/ffuf.git "$CONFIG_DIR"
else
  echo "Ffuf ya está instalado, actualizando..."
  cd "$CONFIG_DIR" && git pull
fi

cd $CONFIG_DIR

go build -ldflags "-s -w" .
upx ffuf
