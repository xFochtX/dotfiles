-- Override para docstrings Python - fuerza después de que todo carga
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    -- Docstrings Python: gris en vez de naranja
    vim.api.nvim_set_hl(0, "@string.documentation.python", {
      fg = "#5A6370",
      italic = true,
      force = true,
    })
    vim.api.nvim_set_hl(0, "pythonDocString", {
      fg = "#5A6370",
      italic = true,
      force = true,
    })
    -- self: púrpura en vez de naranja
    vim.api.nvim_set_hl(0, "@variable.builtin.python", {
      fg = "#C586C0",
      force = true,
    })
    -- Parámetros de funciones: cyan
    vim.api.nvim_set_hl(0, "@variable.parameter.python", {
      fg = "#CE9178",
      force = true,
    })
    -- Brackets ( ) [ ] { }: gris
    vim.api.nvim_set_hl(0, "@punctuation.bracket.python", {
      fg = "#A0A0A0",
      force = true,
    })
    -- Variables: verde oscuro
    vim.api.nvim_set_hl(0, "@variable.python", {
      fg = "#6A9955",
      force = true,
    })
  end,
})

-- Ejecutar inmediatamente también por si el colorscheme ya cargó
vim.schedule(function()
  vim.api.nvim_set_hl(0, "@string.documentation.python", {
    fg = "#5A6370",
    italic = true,
    force = true,
  })
  vim.api.nvim_set_hl(0, "pythonDocString", {
    fg = "#5A6370",
    italic = true,
    force = true,
  })
  -- self: púrpura en vez de naranja
  vim.api.nvim_set_hl(0, "@variable.builtin.python", {
    fg = "#C586C0",
    force = true,
  })
  -- Parámetros de funciones: cyan
  vim.api.nvim_set_hl(0, "@variable.parameter.python", {
    fg = "#CE9178",
    force = true,
  })
  -- Brackets ( ) [ ] { }: gris
  vim.api.nvim_set_hl(0, "@punctuation.bracket.python", {
    fg = "#A0A0A0",
    force = true,
  })
  -- Variables: verde oscuro
  vim.api.nvim_set_hl(0, "@variable.python", {
    fg = "#6A9955",
    force = true,
  })
end)
