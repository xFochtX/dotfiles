#!/bin/bash

# Definir la ruta de configuración de whatweb
CONFIG_DIR="$HOME/dotfiles/opt/whatweb"

# Verificar si el directorio de configuración de whatweb existe
if [ ! -d "$CONFIG_DIR" ]; then
  mkdir "$CONFIG_DIR"
  echo "Clonando whatweb..."
  git clone --depth=1 https://github.com/urbanadventurer/WhatWeb "$CONFIG_DIR"
else
  echo "Whatweb ya está instalado, actualizando..."
  cd "$CONFIG_DIR" && git pull
fi

cd $CONFIG_DIR
