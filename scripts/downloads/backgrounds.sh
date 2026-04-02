#!/bin/bash

# Carpeta donde guardar las imágenes
DEST_DIR="/usr/share/backgrounds"
sudo mkdir -p "$DEST_DIR"
sudo chmod 755 "$DEST_DIR"

# Detecta la ruta absoluta del directorio donde está este script
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Archivo con la lista de música (formato CSV: "Nombre","URL")
LISTA="$BASE_DIR/list/backgrounds.txt"

# Verificar lista
if [[ ! -f "$LISTA" ]]; then
  echo "❌ No se encontró $LISTA"
  exit 1
fi

# Leer línea por línea
while IFS= read -r url; do
  # Ignorar líneas vacías
  [[ -z "$url" ]] && continue

  filename=$(basename "$url")

  # 🔍 Validación: si ya existe, saltar
  if [[ -f "$DEST_DIR/$filename" ]]; then
    echo "⏭️  Ya existe: $filename — Saltando"
    continue
  fi

  echo "⬇️  Descargando: $filename"

  if sudo curl -A "Mozilla/5.0" -s --fail "$url" -o "$DEST_DIR/$filename"; then
    echo "✅ Descargado: $filename"
  else
    echo "❌ Error al descargar: $filename"
  fi

done <"$LISTA"
