#!/bin/bash

# Definir la ruta de configuración de gobuster
CONFIG_DIR="$HOME/dotfiles/opt/gobuster"

# Verificar si el directorio de configuración de gobuster existe
if [ ! -d "$CONFIG_DIR" ]; then
  mkdir "$CONFIG_DIR"
  echo "Clonando gobuster..."
  git clone --depth=1 https://github.com/OJ/gobuster "$CONFIG_DIR"
else
  echo "Gobuster ya está instalado, actualizando..."
  cd "$CONFIG_DIR" && git pull
fi

cd $CONFIG_DIR

go build -ldflags "-s -w" .
upx gobuster
