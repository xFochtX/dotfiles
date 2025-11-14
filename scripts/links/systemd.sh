#!/bin/bash
set -e

# Usa la variable DOTFILES si está exportada, si no, usa el directorio actual del script
DOTFILES="${DOTFILES:-$(cd "$(dirname "$0")/../../" && pwd)}"

# Crear carpeta para unidades systemd del usuario si no existe
mkdir -p ~/.config/systemd/user

# Recorre todos los archivos .service y .timer en tu dotfiles
for unit_file in "$DOTFILES/.config/systemd/user/"*.service "$DOTFILES/.config/systemd/user/"*.timer; do
  # Saltar si no hay archivos coincidentes
  [ -e "$unit_file" ] || continue

  unit_name=$(basename "$unit_file")
  target="$HOME/.config/systemd/user/$unit_name"

  echo "→ Enlazando $unit_name"
  ln -sf "$unit_file" "$target"
done

echo "Todos los enlaces de systemd creados correctamente."
