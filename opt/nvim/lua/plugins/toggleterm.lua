-- ~/.config/nvim/lua/plugins/toggleterm.lua
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 12,
      shade_terminals = true,
      direction = "horizontal", -- también puedes usar "float" o "vertical"
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
    })
  end,
}
