#!/bin/bash

# Rutas base
BASE_DIR="$HOME/dotfiles/opt/wordlists"
DIR_HEADERS="$BASE_DIR/headers"

# Validar / crear directorio base (wordlists)
if [ ! -d "$BASE_DIR" ]; then
  mkdir -p "$BASE_DIR"
  echo "Directorio base 'wordlists' creado en $BASE_DIR"
else
  echo "Directorio base 'wordlists' ya existe"
fi

# Validar / crear subdirectorio (headers)
if [ ! -d "$DIR_HEADERS" ]; then
  mkdir -p "$DIR_HEADERS"
  echo "Subdirectorio 'headers' creado en $DIR_HEADERS"
else
  echo "Subdirectorio 'headers' ya existe, actualizando archivos..."
fi

# Descargar archivos

echo "Descargando Headers.txt..."
curl -L "https://raw.githubusercontent.com/h0tak88r/Wordlists/master/Headers.txt" -o "$DIR_HEADERS/h0tak88r"

echo "Descargando headers.txt (headerpwn)..."
curl -L "https://raw.githubusercontent.com/devanshbatham/headerpwn/main/headers.txt" -o "$DIR_HEADERS/devanshbatham"

echo "Listo. Archivos disponibles en: $DIR_HEADERS"
