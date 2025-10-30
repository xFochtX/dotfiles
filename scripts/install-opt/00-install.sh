#!/bin/bash

# Obtener ruta del script actual
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Ejecutar los scripts desde su ubicación absoluta
"$SCRIPT_DIR/lazyvim.sh"
"$SCRIPT_DIR/powerlevel10.sh"
"$SCRIPT_DIR/sudo-plugin.sh"
"$SCRIPT_DIR/pip2.sh"
