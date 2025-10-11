#!/bin/bash
set -euo pipefail

OUTDIR="$HOME/dotfiles/packages"
mkdir -p "$OUTDIR"

echo "Listando paquetes oficiales instalados explícitamente..."
pacman -Qe --quiet | awk '{print $1}' | sort >"$OUTDIR/pacman_raw.txt"

echo "Listando paquetes instalados no oficiales (AUR/local)..."
pacman -Qm --quiet | awk '{print $1}' | sort >"$OUTDIR/aur.txt"

echo "Restando paquetes AUR de paquetes oficiales para obtener solo paquetes oficiales puros..."
comm -23 "$OUTDIR/pacman_raw.txt" "$OUTDIR/aur.txt" >"$OUTDIR/pacman.txt"

rm "$OUTDIR/pacman_raw.txt"

echo "Archivos generados en $OUTDIR:"
echo "- Paquetes oficiales reales: $OUTDIR/pacman.txt"
echo "- Paquetes AUR o locales: $OUTDIR/aur.txt"
