#!/bin/bash

# Archivo con la lista de música (formato CSV: "Nombre","URL")
LISTA="list-mp3.txt"

# Verificar que el archivo existe
if [[ ! -f "$LISTA" ]]; then
  echo "Error: No se encontró el archivo $LISTA"
  exit 1
fi

# Carpeta de destino opcional (puedes cambiarla)
DESTINO="$HOME/Musica/YouTubeMP3"

# Leer el archivo línea por línea
while IFS=, read -r NOMBRE LINK; do
  # Quitar comillas si existen
  NOMBRE=$(echo "$NOMBRE" | sed 's/^"//;s/"$//')
  LINK=$(echo "$LINK" | sed 's/^"//;s/"$//')

  echo "Descargando: $NOMBRE"
  # Llamar al script download-yt-mp3 con las opciones
  /usr/local/bin/downloadi-yt-mp3 -n "$NOMBRE" -l "$LINK" -d "$DESTINO"
  echo "-----------------------------------------"
done <"$LISTA"
