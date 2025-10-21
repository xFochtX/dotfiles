-- ~/.config/nvim/lua/config/highlight.lua

local M = {}

function M.set_illuminate_highlights()
  local color = "#3a3a3a"
  local opts = { underline = true, bg = color }

  vim.api.nvim_set_hl(0, "IlluminatedWordText", opts)
  vim.api.nvim_set_hl(0, "IlluminatedWordRead", opts)
  vim.api.nvim_set_hl(0, "IlluminatedWordWrite", opts)
end

function M.setup()
  M.set_illuminate_highlights()

  vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
      M.set_illuminate_highlights()
    end,
  })
end

return M
