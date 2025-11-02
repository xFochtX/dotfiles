# target.zsh

function set-target() {
  ip_address=$1
  machine_name=$2
  echo "$ip_address $machine_name" > "$DOTFILES/opt/target"
}

# Función genérica para actualizar ip o name
function set-target-field() {
  local field=$1   # "ip" o "name"
  local value=$2
  local file="$DOTFILES/opt/target"

  # Crear el archivo si no existe
  [[ -f "$file" ]] || touch "$file"

  # Eliminar línea existente del campo y añadir al final
  grep -v "^$field:" "$file" > "$file.tmp" && mv "$file.tmp" "$file"
  echo "$field:$value" >> "$file"
}

# Funciones públicas
function set-target-ip()   { set-target-field ip "$1"; }
function set-target-name() { set-target-field name "$1"; }

function clear-target() {
  echo '' > "$DOTFILES/opt/target"
}

