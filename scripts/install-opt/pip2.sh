#!/usr/bin/env bash
# ────────────────────────────────
# install_pip2.sh — Instala pip para Python 2.7 con íconos
# ────────────────────────────────

set -e

PYTHON_ICON="🐍"
CHECK_ICON="✅"
CROSS_ICON="❌"
DOWNLOAD_ICON="⬇️"
WARN_ICON="⚠️"

# Verifica si python2 está instalado
if ! command -v python2 >/dev/null 2>&1; then
  echo -e "$CROSS_ICON Python 2 no está instalado. Instálalo primero."
  exit 1
fi

# Verifica si pip2 ya está instalado
if command -v pip2 >/dev/null 2>&1; then
  echo -e "$CHECK_ICON pip2 ya está instalado, no se hace nada."
  exit 0
fi

# Descarga el instalador de pip para Python 2
TMP_SCRIPT="$(mktemp)"
echo -e "$DOWNLOAD_ICON Descargando get-pip.py..."
curl -sSL https://bootstrap.pypa.io/pip/2.7/get-pip.py -o "$TMP_SCRIPT"

# Ejecuta el instalador
echo -e "$PYTHON_ICON Instalando pip2..."
sudo python2 "$TMP_SCRIPT"

# Limpieza
rm -f "$TMP_SCRIPT"

echo -e "$CHECK_ICON pip2 instalado correctamente."
