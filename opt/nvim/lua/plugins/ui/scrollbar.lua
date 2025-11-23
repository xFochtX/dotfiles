return {
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup({
        handle = {
          color = "#666666",
          hide_if_all_visible = false,
        },
        marks = {
          Search = { color = "#FFA500" },
          Error = { color = "#FF0000" },
          Warn = { color = "#FFFF00" },
          Info = { color = "#00FFFF" },
          Hint = { color = "#FFFFFF" },
        },
      })
    end,
  },
}
