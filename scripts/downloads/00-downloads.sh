#!/usr/bin/env bash
# Script maestro para ejecutar backgrounds.sh y secLists.sh

set -euo pipefail

# Detecta la ruta absoluta del directorio donde está este script
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Ejecutar los scripts desde su ubicación absoluta
bash "$BASE_DIR/backgrounds.sh"
#bash "$BASE_DIR/secLists.sh"
bash "$BASE_DIR/mp3.sh"
