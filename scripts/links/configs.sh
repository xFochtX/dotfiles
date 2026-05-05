#!/bin/bash
set -e

# Usa la variable DOTFILES si está exportada, si no, calcula la ruta
DOTFILES="${DOTFILES:-$(cd "$(dirname "$0")/../../" && pwd)}"

echo "Creando enlaces simbólicos de configs y dotfiles..."

# ----------------------------
# Dotfiles principales
# ----------------------------
ln -sf "$DOTFILES/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/.p10k.zsh" "$HOME/.p10k.zsh"
ln -sf "$DOTFILES/.latexmkrc" "$HOME/.latexmkrc"

# ----------------------------
# Configuraciones de aplicaciones
# ----------------------------
# Neovim
rm -rf "$HOME/.config/nvim"
ln -sf "$DOTFILES/opt/nvim" "$HOME/.config/nvim"

# Kitty
rm -rf "$HOME/.config/kitty"
ln -sf "$DOTFILES/.config/kitty" "$HOME/.config/kitty"

# Hyprshot
mkdir -p "$HOME/Pictures/Screenshots"

# Hyprland
rm -rf "$HOME/.config/hypr"
ln -sf "$DOTFILES/.config/hypr" "$HOME/.config/hypr"

# Waybar
rm -rf "$HOME/.config/waybar"
ln -sf "$DOTFILES/.config/waybar" "$HOME/.config/waybar"

# Obsidian
rm -rf "$HOME/.config/obsidian"
ln -sf "$DOTFILES/.config/obsidian" "$HOME/.config/obsidian"

# Broot
rm -rf "$HOME/.config/broot"
ln -sf "$DOTFILES/.config/broot" "$HOME/.config/broot"

# Yazi
rm -rf "$HOME/.config/yazi"
ln -sf "$DOTFILES/.config/yazi" "$HOME/.config/yazi"

echo "Todos los enlaces de configs creados correctamente."
