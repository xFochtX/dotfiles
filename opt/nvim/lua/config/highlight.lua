-- ~/.config/nvim/lua/config/highlight.lua

local M = {}

-- 🟡 Iluminación de palabras (plugin nvim-illuminate)
function M.set_illuminate_highlights()
  local color = "#3a3a3a"
  local opts = { underline = true, bg = color }

  vim.api.nvim_set_hl(0, "IlluminatedWordText", opts)
  vim.api.nvim_set_hl(0, "IlluminatedWordRead", opts)
  vim.api.nvim_set_hl(0, "IlluminatedWordWrite", opts)
end

-- 🎨 Color de selección en modo Visual
function M.set_visual_highlights()
  -- Cambia el bg según tu esquema o gusto personal
  vim.api.nvim_set_hl(0, "Visual", { bg = "#3b4252", fg = "NONE" })
  vim.api.nvim_set_hl(0, "VisualNOS", { bg = "#434c5e", fg = "NONE" })
end

-- 🎨 Forzar color uniforme en comentarios
function M.set_comment_highlight()
  vim.api.nvim_set_hl(0, "Comment", { fg = "#707880", italic = true })
end

function M.setup()
  -- Aplicar inmediatamente al iniciar Neovim
  M.set_illuminate_highlights()
  M.set_visual_highlights()
  M.set_comment_highlight()

  -- Volver a aplicar cuando cambie el esquema de color
  vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
      M.set_illuminate_highlights()
      M.set_visual_highlights()
      M.set_comment_highlight()
    end,
  })
end

return M
