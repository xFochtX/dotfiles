#!/bin/bash

# Obtener ruta del script actual
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Ejecutar los scripts desde su ubicación absoluta
#"$SCRIPT_DIR/nvchad.sh"
"$SCRIPT_DIR/lazyvim.sh"
"$SCRIPT_DIR/powerlevel10.sh"
"$SCRIPT_DIR/sudo-plugin.sh"

