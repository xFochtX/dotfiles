local M = {}

function M.apply(colors)
  local hl = vim.api.nvim_set_hl

  hl(0, "Normal", { fg = colors.fg, bg = colors.bg })
  hl(0, "Comment", { fg = colors.comment, italic = true })
  hl(0, "Keyword", { fg = colors.keyword, bold = true })
  -- resto...
end

return M
