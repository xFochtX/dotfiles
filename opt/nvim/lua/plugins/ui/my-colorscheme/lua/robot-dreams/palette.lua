-- ──────────────────────────────────────────────────────────────────────────────
-- palette.lua
-- ------------------------------------------------------------------------------
-- Exposición de la paleta de colores para el colorscheme "robot-dreams".
-- Carga una variante de colors desde variant.lua y la expone como "colors"
-- para ser usada en groups.lua y en la configuración de Neovim.
--
-- USO:
--   local palette = require("robot-dreams.palette")
--   local colors = palette.colors
--

local get_variant = require("robot-dreams.variant")

-- Seleccionamos la variante por defecto ("blur")
local colors = get_variant("blur")

return {
  colors = colors
}
