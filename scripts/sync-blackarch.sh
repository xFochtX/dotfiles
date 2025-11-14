#!/usr/bin/env bash
# scripts/sync-blackarch.sh
# Añade/sincroniza repositorio BlackArch
# Primera vez: instala todo y actualiza
# Veces siguientes: solo sincroniza bases de datos

set -euo pipefail

STRAP_URL="https://blackarch.org/strap.sh"
TMP_DIR="$(mktemp -d)"
STRAP="$TMP_DIR/strap.sh"

cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

# Función para detectar si BlackArch ya está agregado
is_blackarch_added() {
  # Busca [blackarch] en pacman.conf o en archivos incluidos
  if grep -q "^\[blackarch\]" /etc/pacman.conf 2>/dev/null; then
    return 0
  fi
  includes=$(grep -E "^\s*Include\s*=" /etc/pacman.conf | sed 's/Include\s*=\s*//g' | tr -d '"')
  for inc in $includes; do
    if grep -q "^\[blackarch\]" "$inc" 2>/dev/null; then
      return 0
    fi
  done
  return 1
}

echo "-> Comprobando herramientas..."
command -v curl >/dev/null || {
  echo "curl no encontrado. Instalando curl..."
  sudo pacman -S --needed curl --noconfirm
}

if is_blackarch_added; then
  echo "-> Repositorio BlackArch ya está configurado. Sincronizando solo bases de datos..."
  sudo pacman -Sy --noconfirm
else
  echo "-> Repositorio BlackArch no detectado. Descargando y ejecutando strap.sh..."
  curl -fsSL "$STRAP_URL" -o "$STRAP"
  chmod +x "$STRAP"
  sudo bash "$STRAP"

  echo "-> Actualizando sistema completo luego de agregar BlackArch..."
  sudo pacman -Syu --noconfirm
fi

echo "-> Repositorio BlackArch sincronizado correctamente."
