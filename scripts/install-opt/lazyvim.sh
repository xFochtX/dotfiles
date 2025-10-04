#!/bin/bash

NVIM_CONFIG_DIR="$HOME/dotfiles/opt"

# Verifica si el directorio de configuración está vacío o no existe
if [ ! -d "$NVIM_CONFIG_DIR/nvim" ] || [ -z "$(ls -A "$NVIM_CONFIG_DIR/nvim")" ]; then
  mkdir -p "$NVIM_CONFIG_DIR"
  echo "Descargando configuración LazyVim de Gentleman..."

  download-github-subfolder.sh -d "$NVIM_CONFIG_DIR" https://github.com/Gentleman-Programming/Gentleman.Dots/tree/main/GentlemanNvim/nvim

else
  echo "⚠️ La carpeta de configuración ya existe y no está vacía: $NVIM_CONFIG_DIR/nvim"
fi
