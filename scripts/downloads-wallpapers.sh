#!/bin/bash

# Carpeta donde guardar las imágenes
DEST_DIR="$HOME/dotfiles/assets/wallpapers"
mkdir -p "$DEST_DIR"

# Lista de enlaces de Wallhaven
links=(
    "https://wallhaven.cc/w/ly9qzq"
    "https://wallhaven.cc/w/d69eom"
    "https://wallhaven.cc/w/7jgyre"
    "https://wallhaven.cc/w/rq75r7"
    "https://wallhaven.cc/w/mdryp1"
    "https://wallhaven.cc/w/73ml69"
    "https://wallhaven.cc/w/eolgqk"
    "https://wallhaven.cc/w/9d62lx"
    "https://wallhaven.cc/w/w8j677"
    "https://wallhaven.cc/w/5w6p35"
    "https://wallhaven.cc/w/6k2ogx"
)

# Descargar cada imagen
for link in "${links[@]}"; do
    id="${link##*/}"                # Extrae el ID del final del link (ej: ly9qzq)
    prefix="${id:0:2}"              # Primeras 2 letras para armar la ruta

    # URL base (intenta con .jpg primero)
    img_url_jpg="https://w.wallhaven.cc/full/$prefix/wallhaven-$id.jpg"
    img_url_png="https://w.wallhaven.cc/full/$prefix/wallhaven-$id.png"

    echo "🔽 Descargando $id..."

    # Intentar .jpg primero
    curl -s --fail "$img_url_jpg" -o "$DEST_DIR/wallhaven-$id.jpg"
    if [ $? -ne 0 ]; then
        # Si falló, intentar .png
        curl -s --fail "$img_url_png" -o "$DEST_DIR/wallhaven-$id.png"
        if [ $? -ne 0 ]; then
            echo "❌ No se pudo descargar $id"
        else
            echo "✅ Descargado como PNG: wallhaven-$id.png"
        fi
    else
        echo "✅ Descargado como JPG: wallhaven-$id.jpg"
    fi
done
