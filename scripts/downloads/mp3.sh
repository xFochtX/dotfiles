#!/bin/bash
set -euo pipefail

# Detecta la ruta absoluta del directorio donde está este script
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Archivo con la lista de música (formato CSV: "Nombre","URL")
LISTA="$BASE_DIR/list/mp3.txt"

# Verificar que el archivo existe
if [[ ! -f "$LISTA" ]]; then
  echo "Error: No se encontró el archivo $LISTA"
  exit 1
fi

# Carpeta de destino opcional (puedes cambiarla)
DESTINO="$HOME/Musica/YouTubeMP3"
mkdir -p "$DESTINO"

# Leer el archivo línea por línea
while IFS=, read -r NOMBRE LINK; do
  # Quitar comillas si existen
  NOMBRE=$(echo "$NOMBRE" | sed 's/^"//;s/"$//')
  LINK=$(echo "$LINK" | sed 's/^"//;s/"$//')

  # 🔍 Verificar si ya existe (cualquier extensión)
  if compgen -G "$DESTINO/$NOMBRE.*" >/dev/null; then
    echo "⏭️  Ya existe: $NOMBRE — Saltando descarga"
    echo "-----------------------------------------"
    continue
  fi

  echo "Descargando: $NOMBRE"
  # Llamar al script youtube-to-mp3 con las opciones
  /usr/local/bin/youtube-to-mp3 -n "$NOMBRE" -l "$LINK" -d "$DESTINO"
  echo "-----------------------------------------"
done <"$LISTA"
