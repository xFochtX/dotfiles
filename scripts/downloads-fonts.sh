#!/bin/bash

# Ruta donde se guardarán las fuentes descargadas
DOTFILES_FONTS="$HOME/dotfiles/assets/fonts"

# URL de la fuente (JetBrainsMono Nerd Font en este caso)
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Hack.zip"
FONT_ZIP="$DOTFILES_FONTS/Hack-Nerd-Font.zip"

# Crear carpeta si no existe
mkdir -p "$DOTFILES_FONTS"

# Descargar la fuente si no existe
if [ ! -f "$FONT_ZIP" ]; then
    echo "🌐 Descargando fuente Hack Nerd Font..."
    curl -L -o "$FONT_ZIP" "$FONT_URL"
else
    echo "✅ Fuente ya descargada."
fi

# Descomprimir (sobrescribe si ya existe)
echo "📦 Descomprimiendo..."
unzip -o "$FONT_ZIP" -d "$DOTFILES_FONTS"

# Borrar archivos inservibles
rm -f "$DOTFILES_FONTS/Hack-Nerd-Font.zip" "$DOTFILES_FONTS/LICENSE.md" "$DOTFILES_FONTS/README.md"

