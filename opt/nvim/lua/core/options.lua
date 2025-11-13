-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- ────────────────────────────────────────────────
-- Apariencia del cursor por modo (guicursor)
-- ────────────────────────────────────────────────
vim.opt.guicursor = {
  -- Normal / Visual / Command → bloque sólido
  "n-v-c:ver25-blinkwait300-blinkon200-blinkoff150",

  -- Insert / Command-Insert / Visual-Ex → barra vertical elegante
  "i-ci-ve:ver25-blinkwait150-blinkon120-blinkoff120",

  -- Replace / Command-Replace / Operator → guion horizontal
  "r-cr-o:ver25-blinkwait150-blinkon100-blinkoff100",

  -- Terminal → barra vertical más gruesa y suave
  "t:ver25-blinkwait200-blinkon150-blinkoff150",

  -- ShowMatch (cuando se resaltan paréntesis) → bloque parpadeante
  "sm:block-blinkwait100-blinkon100-blinkoff100",
}
