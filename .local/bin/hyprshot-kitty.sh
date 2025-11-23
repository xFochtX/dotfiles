#!/bin/bash

# Carpeta de destino
OUTDIR="$HOME/Pictures/Screenshots"

# Nombre del archivo con fecha/hora
FILE="$(date +%Y-%m-%d-%Hh%Mm%Ss).png"
FULLPATH="$OUTDIR/$FILE"

# Captura la región y guarda, además copia al portapapeles
hyprshot -m region -o "$OUTDIR" -f "$FILE"
