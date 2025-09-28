filter_existing_aur_pkgs() {
  local input_file="$1"
  local output_file="$2"
  > "$output_file"
  while read -r pkg; do
    if curl -s "https://aur.archlinux.org/rpc/?v=5&type=info&arg=$pkg" | grep -q '"resultcount":1'; then
      echo "$pkg" >> "$output_file"
    else
      echo "⚠️ Paquete '$pkg' no encontrado en AUR, se omitirá."
    fi
  done < "$input_file"
}
