-- ~/.config/nvim/lua/plugins/highlight.lua

return {
  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure({
        delay = 200,
        filetypes_denylist = { "NvimTree", "TelescopePrompt" },
      })

      -- Aplica el highlight personalizado
      require("config.highlight").setup()
    end,
  },
}
