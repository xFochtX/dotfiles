#!/bin/bash

# Definir la ruta de configuración de ffuf
CONFIG_DIR="$HOME/dotfiles/opt/davtest"

# Verificar si el directorio de configuración de davtest existe
if [ ! -d "$CONFIG_DIR" ]; then
  mkdir "$CONFIG_DIR"
  echo "Clonando davtest..."
  git clone --depth=1 https://github.com/cldrn/davtest "$CONFIG_DIR"
else
  echo "Davtest ya está instalado, actualizando..."
  cd "$CONFIG_DIR" && git pull
fi

# Instalar el módulo Perl HTTP::DAV si no está instalado
if ! perl -MHTTP::DAV -e1 2>/dev/null; then
  echo "Instalando módulo Perl HTTP::DAV..."
  sudo /usr/bin/vendor_perl/cpanm HTTP::DAV
else
  echo "Módulo Perl HTTP::DAV ya instalado."
fi
