#!/usr/bin/env bash
# clone_seclists.sh — Clona SecLists con --depth 1 en /usr/share/SecLists
set -euo pipefail
REPO="https://github.com/danielmiessler/SecLists.git"
DEST="/usr/share/SecLists"

# Requiere root porque escribe en /usr/share
if [ "$(id -u)" -ne 0 ]; then
  echo "Ejecuta con sudo o como root: sudo $0"
  exit 1
fi

# Si existe el directorio
if [ -d "$DEST/.git" ]; then
  echo "Directorio $DEST ya es un repo git. Actualizando al último commit del remoto..."
  git -C "$DEST" fetch --depth=1 origin
  git -C "$DEST" reset --hard origin/master
  echo "Repositorio actualizado."
else
  echo "Directorio $DEST no existe. Clonando repositorio..."
  mkdir -p "$(dirname "$DEST")"
  git clone --depth 1 "$REPO" "$DEST"
  echo "Clonado completado."
fi
