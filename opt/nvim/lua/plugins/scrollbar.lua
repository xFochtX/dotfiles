return {
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup({
        handle = {
          color = "#666666",
          hide_if_all_visible = true,
        },
        marks = {
          Search = { color = "#FF0000" },
          Error = { color = "#FF0000" },
          Warn = { color = "#FFA500" },
          Info = { color = "#00FFFF" },
          Hint = { color = "#FFFFFF" },
        },
      })
    end,
  },
}
