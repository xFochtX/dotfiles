#!/bin/bash

# Carpeta donde guardar las imágenes
DEST_DIR="/usr/share/backgrounds"
sudo mkdir -p "$DEST_DIR"
sudo chmod 755 "$DEST_DIR"

# Lista de URLs directas de imágenes
links=(
  "https://w.wallhaven.cc/full/ly/wallhaven-ly9qzq.jpg"
  "https://w.wallhaven.cc/full/d6/wallhaven-d69eom.jpg"
  "https://w.wallhaven.cc/full/7j/wallhaven-7jgyre.jpg"
  "https://w.wallhaven.cc/full/rq/wallhaven-rq75r7.jpg"
  "https://w.wallhaven.cc/full/eo/wallhaven-eolgqk.jpg"
  "https://w.wallhaven.cc/full/9d/wallhaven-9d62lx.jpg"
  "https://w.wallhaven.cc/full/w8/wallhaven-w8j677.jpg"
  "https://w.wallhaven.cc/full/5w/wallhaven-5w6p35.jpg"
  "https://w.wallhaven.cc/full/6k/wallhaven-6k2ogx.jpg"
)

# Descargar cada imagen directamente
for url in "${links[@]}"; do
  filename=$(basename "$url") # Extrae el nombre del archivo de la URL

  sudo curl -A "Mozilla/5.0" -s --fail "$url" -o "$DEST_DIR/$filename"
  if [ $? -ne 0 ]; then
    echo "❌ No se pudo descargar $filename"
  else
    echo "✅ Descargado: $filename"
  fi
done
