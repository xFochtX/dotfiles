-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Mostrar número de línea absoluto
vim.opt.number = true

-- Desactivar número relativo en las líneas
vim.opt.relativenumber = false

-- Establecer configuraciones para el cursor
vim.opt.guicursor = {
  "n-v-c:block", -- modo normal, visual y comando: bloque (puedes cambiar)
  "i-ci-ve:ver25", -- modo insert: barra vertical (25% ancho)
  "r-cr-o:hor20", -- modo replace y otros: barra horizontal 20%
  "sm:block-blinkwait175-blinkoff150-blinkon175", -- modo showmatch (parpadeo)
}
