-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Establecer configuraciones para el cursor
vim.opt.guicursor = {
  "n-v-c:block", -- Normal, visual y command
  "i-ci-ve:ver25", -- Insert, command-insert, visual-ex
  "r-cr-o:hor20", -- Replace y otros
  "t:ver25-blinkwait175-blinkoff150-blinkon175", -- Terminal
  "sm:block-blinkwait175-blinkoff150-blinkon175", -- showmatch
}
