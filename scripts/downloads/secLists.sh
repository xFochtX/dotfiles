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
if [ -d "$DEST" ]; then
  # Si es un repositorio git, hacer pull (fast-forward only)
  if [ -d "$DEST/.git" ]; then
    echo "Directorio $DEST ya es un repo git. Haciendo git pull --ff-only..."
    git -C "$DEST" fetch --depth=1 origin
    # intentar actualizar a la rama remota por defecto
    remote_head=$(git -C "$DEST" remote show origin | awk '/HEAD branch/ {print $NF}')
    remote_head=${remote_head:-master}
    git -C "$DEST" checkout "$remote_head" || true
    git -C "$DEST" pull --ff-only || {
      echo "No se pudo hacer fast-forward. Salida."
      exit 1
    }
    echo "Actualizado."
    exit 0
  else
    echo "Directorio $DEST existe y no es un repo git. No se clona para evitar sobrescribir. Sal y revisa manualmente."
    exit 1
  fi
fi

# Si no existe, clonar con depth 1
echo "Clonando $REPO en $DEST (--depth 1)..."
mkdir -p "$(dirname "$DEST")"
git clone --depth 1 "$REPO" "$DEST"
echo "Clonado completado."
exit 0
