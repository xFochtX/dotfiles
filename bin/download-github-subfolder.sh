#!/bin/bash

# download_github_subfolder.sh
# Uso: ./download_github_subfolder.sh [-d destino] <url>

set -e

# Valores por defecto
dest_dir="."

# Parsear opciones
while [[ "$1" == -* ]]; do
  case "$1" in
    -d|--dir)
      shift
      if [[ -z "$1" ]]; then
        echo "Error: la opción -d requiere un argumento."
        exit 1
      fi
      dest_dir="$1"
      ;;
    *)
      echo "Opción desconocida: $1"
      exit 1
      ;;
  esac
  shift
done

url="$1"

if [[ -z "$url" ]]; then
  echo "Uso: $0 [-d destino] <url_github_subfolder>"
  exit 1
fi

# Verificar que dest_dir exista
mkdir -p "$dest_dir" || { echo "No se pudo crear el directorio destino"; exit 1; }

# Extraer user, repo, branch, subfolder de la URL
if [[ ! "$url" =~ ^https://github\.com/([^/]+)/([^/]+)/tree/([^/]+)/(.*)$ ]]; then
  echo "URL inválida. Debe tener formato https://github.com/user/repo/tree/branch/subfolder"
  exit 1
fi

user="${BASH_REMATCH[1]}"
repo="${BASH_REMATCH[2]}"
branch="${BASH_REMATCH[3]}"
subfolder="${BASH_REMATCH[4]}"

zip_url="https://github.com/$user/$repo/archive/refs/heads/$branch.zip"
zip_file="$repo-$branch.zip"
tmp_dir="${repo}-${branch}-tmp"

echo "Descargando $zip_url ..."
curl -L -o "$zip_file" "$zip_url" || { echo "Error descargando el zip"; exit 1; }

mkdir "$tmp_dir"
unzip -q "$zip_file" -d "$tmp_dir" || { echo "Error descomprimiendo el zip"; rm -rf "$tmp_dir"; exit 1; }

extracted_root="$tmp_dir/$repo-$branch"

if [[ ! -d "$extracted_root/$subfolder" ]]; then
  echo "No se encontró la subcarpeta '$subfolder' dentro del zip."
  rm -rf "$tmp_dir" "$zip_file"
  exit 1
fi

echo "Moviendo '$subfolder' a '$dest_dir'..."
mv "$extracted_root/$subfolder" "$dest_dir" || { echo "Error al mover carpeta"; exit 1; }

rm -rf "$tmp_dir" "$zip_file"

echo "Listo: carpeta '$subfolder' descargada."

