-- ~/.config/nvim/lua/plugins/ui/colorscheme.lua
-- Define el esquema de colores principal para Lazy.nvim y LazyVim

local ui_path = vim.fn.stdpath("config") .. "/lua/plugins/ui"

return {
  -- Tema principal desde la carpeta local
  {
    dir = ui_path .. "/gentleman-kanagawa-blur",
    --dir = ui_path .. "/my-colorscheme",
    name = "gentleman-kanagawa-blur",
    --name = "robot-dreams",
    priority = 1000, -- se carga antes que otros plugins
  },

  -- Configura LazyVim para usar este esquema
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gentleman-kanagawa-blur",
      --colorscheme = "robot-dreams",
    },
  },
}
