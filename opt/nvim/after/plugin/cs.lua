-- ────────────────────────────────────────────────
-- C#: indentación 4 espacios
-- ────────────────────────────────────────────────
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cs",
  callback = function()
    vim.bo.shiftwidth  = 4
    vim.bo.tabstop     = 4
    vim.bo.softtabstop = 4
    vim.bo.expandtab   = true
    vim.wo.breakindentopt = "shift:4"
  end,
})
