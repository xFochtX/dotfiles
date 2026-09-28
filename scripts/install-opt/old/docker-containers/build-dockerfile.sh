#!/bin/bash

# Obtener el directorio donde está el script build-dockerfile.sh
DIR="$(cd "$(dirname "$(realpath "$0")")" && pwd)"

# Construir la imagen Docker
echo "Construyendo la imagen Docker 'whatweb-alpine' desde $DIR..."
sudo docker build -t whatweb-alpine "$DIR"
