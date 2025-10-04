#!/bin/bash

# Ruta donde se guardarán las fuentes descargadas
DOTFILES_FONTS="$HOME/dotfiles/assets/fonts"

# Lista de URLs de las fuentes a descargar
declare -A FONT_URLS=(
    ["Hack-Nerd-Font"]="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Hack.zip"
    ["IosevkaTerm-Nerd-Font"]="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/IosevkaTerm.zip"
)

# Crear carpeta si no existe
mkdir -p "$DOTFILES_FONTS"

# Función para descargar y descomprimir una fuente
download_and_extract_font() {
    local FONT_NAME=$1
    local FONT_URL=$2
    local FONT_ZIP="$DOTFILES_FONTS/$FONT_NAME.zip"
    
    # Descargar la fuente si no existe
    if [ ! -f "$FONT_ZIP" ]; then
        echo "Descargando fuente $FONT_NAME..."
        curl -L -o "$FONT_ZIP" "$FONT_URL"
    else
        echo "Fuente $FONT_NAME ya descargada."
    fi

    # Descomprimir (sobrescribe si ya existe)
    echo "Descomprimiendo $FONT_NAME..."
    unzip -o "$FONT_ZIP" -d "$DOTFILES_FONTS"

    # Borrar archivos inservibles
    rm -f "$DOTFILES_FONTS/$FONT_NAME.zip" "$DOTFILES_FONTS/LICENSE.md" "$DOTFILES_FONTS/README.md"
}

# Iterar sobre la lista de fuentes y procesarlas
for FONT_NAME in "${!FONT_URLS[@]}"; do
    download_and_extract_font "$FONT_NAME" "${FONT_URLS[$FONT_NAME]}"
done


