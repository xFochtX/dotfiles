-- ──────────────────────────────────────────────────────────────────────────────
-- variant.lua
-- ------------------------------------------------------------------------------
-- Definición de paletas de colores para el colorscheme "robot-dreams".
-- Cada variante contiene colores descriptivos pensados para su uso en Neovim:
--   • Colores para modos de edición (NORMAL, INSERT, VISUAL, etc.)
--   • Colores de fondo y superficie
--   • Colores para LSP, diffs, y resaltado de texto
--
-- USO:
--   local get_variant = require("robot-dreams.variant")
--   local colors = get_variant("blur")
--
-- VARIANTES DISPONIBLES:
--   blur → Variante con fondo transparente y colores suaves.
--

local palettes = {
  blur = {
    -- ────────────── Modos de Neovim ──────────────
    normal_bg = "none",       -- Fondo del modo NORMAL
    insert_bg = "#223344",    -- Fondo del modo INSERT
    visual_bg = "#334455",    -- Fondo del modo VISUAL
    replace_bg = "#552222",   -- Fondo del modo REPLACE
    command_bg = "#445522",   -- Fondo del modo COMMAND

    -- ────────────── Superficies y fondo ──────────────
    bg_dark = "none",
    surface0 = "#1C212C",
    surface1 = "#232A36",
    surface2 = "#2A3142",

    -- ────────────── Texto y acentos ──────────────
    fg = "#F3F6F9",
    fg_muted = "#5C6170",
    fg_placeholder = "#8A8FA3",
    fg_disabled = "#606C86",
    accent = "#E0C15A",
    paren_highlight = "#00BFFF",

    -- ────────────── Colores difuminados para diffs ──────────────
    diff_add_bg = "#1E2D1E",
    diff_change_bg = "#2D2A1E",
    diff_delete_bg = "#2D211E",
    diff_text_bg = "#332F1E",

    -- ────────────── Colores generales ──────────────
    red = "#CB7C94",
    green = "#B7CC85",
    yellow = "#FFE066",
    blue = "#7FB4CA",
    purple = "#A3B5D6",
    orange = "#DEBA87",
    cyan = "#7AA89F",
    magenta = "#FF8DD7",

    -- ────────────── Colores especiales ──────────────
    none = "NONE",
  },
}

return function(variant)
  return palettes[variant] or palettes.blur
end
