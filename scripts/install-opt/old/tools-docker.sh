#!/bin/bash

# Definir el directorio actual donde está el Dockerfile y los scripts
DIR="$(cd "$(dirname "$(realpath "$0")")" && pwd)"

# Ejecutar la construcción del Dockerfile con el script build-dockerfile.sh
echo "Ejecutando la construcción de Docker..."
"$DIR/docker-containers/build-dockerfile.sh"
