#!/bin/bash

# Intentar detectar el terminal predeterminado

# 1. Revisa la variable de entorno $TERMINAL
if [[ -n "$TERMINAL" ]]; then
  TERMINAL_CMD="$TERMINAL"
else
  # 2. Busca los terminales más comunes instalados en orden de preferencia
  for term in alacritty kitty foot wezterm kitty xterm st urxvt termite gnome-terminal konsole; do
    if command -v $term >/dev/null 2>&1; then
      TERMINAL_CMD=$term
      break
    fi
  done
fi

# 3. Si no encontró ninguno, avisa y sale
if [[ -z "$TERMINAL_CMD" ]]; then
  echo "No se encontró terminal para ejecutar nmtui."
  exit 1
fi

# Ejecuta nmtui en el terminal detectado
$TERMINAL_CMD -e nmtui

