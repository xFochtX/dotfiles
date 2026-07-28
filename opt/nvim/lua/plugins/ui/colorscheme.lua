-- ~/.config/nvim/lua/plugins/ui/colorscheme.lua
-- Define el esquema de colores principal para Lazy.nvim y LazyVim

local ui_path = vim.fn.stdpath("config") .. "/lua/plugins/ui"

return {
  -- Tema unificado synthdreams (variante por defecto: robot-dreams)
  {
    dir = ui_path .. "/synthdreams",
    name = "synthdreams",
    priority = 1000, -- se carga antes que otros plugins
  },

  -- Configura LazyVim para usar este esquema
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "synthdreams",
    },
  },
}
