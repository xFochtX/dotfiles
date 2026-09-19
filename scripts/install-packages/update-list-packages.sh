#!/bin/bash
set -euo pipefail

OUTDIR="$HOME/dotfiles/scripts/install-packages/packages"
mkdir -p "$OUTDIR"

echo "Obteniendo paquetes instalados y sus repositorios..."
# Forzamos LC_ALL=C para asegurar que la etiqueta '[installed]' esté en inglés
INSTALLED_REPOS=$(LC_ALL=C pacman -Sl | awk '$4 == "[installed]" {print $1, $2}')

echo "Filtrando paquetes de BlackArch..."
echo "$INSTALLED_REPOS" | awk '$1 == "blackarch" {print $2}' | sort >"$OUTDIR/blackarch.txt"

echo "Filtrando paquetes oficiales estándar (core, extra, etc.)..."
echo "$INSTALLED_REPOS" | awk '$1 != "blackarch" {print $2}' | sort >"$OUTDIR/pacman.txt"

echo "Listando paquetes AUR o locales..."
pacman -Qm --quiet | awk '{print $1}' | sort >"$OUTDIR/aur.txt"

# Eliminar paru si aparece en pacman.txt (por si acaso)
sed -i '/^paru$/d' "$OUTDIR/pacman.txt"

echo "Archivos generados en $OUTDIR:"
echo "- Paquetes de BlackArch: $OUTDIR/blackarch.txt"
echo "- Paquetes oficiales estándar: $OUTDIR/pacman.txt"
echo "- Paquetes AUR o locales: $OUTDIR/aur.txt"
