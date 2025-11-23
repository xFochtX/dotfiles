return {
  {
    "andymass/vim-matchup",
    config = function()
      -- Habilita el matching incluso dentro de strings
      vim.g.matchup_delim_noskips = 1
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
