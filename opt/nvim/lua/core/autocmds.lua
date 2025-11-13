-- =====================================================================
-- 🧩 AUTOCMDS CONFIG
-- Archivo: autocmds.lua
-- Carga automática en el evento VeryLazy (LazyVim)
-- Aquí defines reglas y ajustes que se aplican según eventos o tipos de archivo.
-- =====================================================================

-- 🔧 Indentación y formato global -------------------------------------
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    -- Indentación estándar: 2 espacios en todos los lenguajes
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
    vim.bo.softtabstop = 2
    vim.bo.expandtab = true

    -- Quitar continuación automática de comentarios al presionar Enter o "o"
    vim.opt.formatoptions:remove({ "r", "o" })
  end,
})

-- 🧠 Excepciones por tipo de archivo ----------------------------------
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "make", "go" },
  callback = function()
    -- Makefiles y Go usan tabulaciones reales
    vim.bo.expandtab = false
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.softtabstop = 2
  end,
})

-- 🎨 Personalizar color del separador entre ventanas -------------------
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#eeeeee", bg = "NONE" })
  end,
})
