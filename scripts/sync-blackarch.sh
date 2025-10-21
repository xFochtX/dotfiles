#!/usr/bin/env bash
# scripts/sync-blackarch.sh
# Añade/sincroniza repositorio BlackArch solo si no está ya configurado.
# Actualiza pacman al final.

set -euo pipefail

STRAP_URL="https://blackarch.org/strap.sh"
TMP_DIR="$(mktemp -d)"
STRAP="$TMP_DIR/strap.sh"

cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

# Función para detectar si blackarch está ya agregado en pacman.conf o includes
is_blackarch_added() {
  # Busca [blackarch] en pacman.conf o en archivos incluidos
  if grep -q "^\[blackarch\]" /etc/pacman.conf 2>/dev/null; then
    return 0
  fi
  # También buscar en includes (opcional)
  # Leer includes de pacman.conf si existen
  includes=$(grep -E "^\s*Include\s*=" /etc/pacman.conf | sed 's/Include\s*=\s*//g' | tr -d '"')
  for inc in $includes; do
    if grep -q "^\[blackarch\]" "$inc" 2>/dev/null; then
      return 0
    fi
  done
  return 1
}

echo "-> Comprobando herramientas..."
if ! command -v curl >/dev/null 2>&1; then
  echo "curl no encontrado. Instalando curl..."
  sudo pacman -S --noconfirm curl
fi

if is_blackarch_added; then
  echo "-> El repositorio BlackArch ya está configurado. Solo sincronizando bases de datos..."
else
  echo "-> Repositorio BlackArch no detectado. Descargando y ejecutando strap.sh..."
  curl -fsSL "$STRAP_URL" -o "$STRAP"
  chmod +x "$STRAP"
  sudo bash "$STRAP"
fi

echo "-> Forzando sincronización de las bases de datos de pacman..."
sudo pacman -Syyu --noconfirm

echo "-> Repositorio BlackArch sincronizado correctamente."
