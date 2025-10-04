#!/bin/bash

# Ruta local donde están las fuentes
LOCAL_FONTS="$HOME/dotfiles/assets/fonts"

# Ruta global para enlace simbólico
GLOBAL_FONTS="/usr/local/share/fonts"

# Verificar que la carpeta local exista
if [ ! -d "$LOCAL_FONTS" ]; then
  echo "❌ La carpeta local de fuentes no existe: $LOCAL_FONTS"
  exit 1
fi

echo "Creando enlace simbólico global de fuentes..."

# Eliminar enlace simbólico existente o carpeta si existe
if [ -L "$GLOBAL_FONTS" ] || [ -d "$GLOBAL_FONTS" ]; then
  sudo rm -rf "$GLOBAL_FONTS"
fi

# Crear enlace simbólico
sudo ln -s "$LOCAL_FONTS" "$GLOBAL_FONTS"

echo "Actualizando caché de fuentes..."
sudo fc-cache -fv

echo "Fuentes actualizadas globalmente con enlace simbólico."
