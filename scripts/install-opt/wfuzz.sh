#!/bin/bash
set -euo pipefail

CONFIG_DIR="$HOME/dotfiles/opt/wfuzz"
PYTHON_VERSION="3.11.13"
PIP_VERSION="24.0"

mkdir -p "$CONFIG_DIR"

# Verificar si la versión está instalada en pyenv
if ! pyenv versions --bare | grep -q "^${PYTHON_VERSION}\$"; then
  echo "Instalando Python $PYTHON_VERSION con pyenv..."
  pyenv install "$PYTHON_VERSION"
else
  echo "Python $PYTHON_VERSION ya está instalado en pyenv."
fi

# Crear el virtualenv con pyenv
VENV_DIR="$CONFIG_DIR/wfuzz/env"

# Usar pyenv para crear un entorno virtual con la versión indicada
pyenv local "$PYTHON_VERSION" # cambiar localmente la versión para crear virtualenv

# Crear virtualenv con la versión de python pyenv (usamos el binario exacto)
PYENV_PYTHON_PATH="$(pyenv root)/versions/$PYTHON_VERSION/bin/python"
"$PYENV_PYTHON_PATH" -m venv "$VENV_DIR"

# Activar el virtualenv
# shellcheck source=/dev/null
source "$VENV_DIR/bin/activate"

# Instalar la versión específica de pip
pip install --upgrade "pip==$PIP_VERSION" setuptools wheel

# Instalar wfuzz
pip install wfuzz

echo "wfuzz instalado en el virtualenv con Python $PYTHON_VERSION en $VENV_DIR"
