-- ────────────────────────────────────────────────
-- Soft wrap / líneas largas visualmente divididas
-- ────────────────────────────────────────────────
vim.opt.wrap = true           -- Activa wrap
vim.opt.linebreak = true      -- Rompe líneas en lugares elegantes (sin partir palabras)
vim.opt.breakindent = true    -- Mantiene indentación en la parte envuelta
vim.opt.breakindentopt = "shift:2" -- (opcional) añade indent visual extra
vim.opt.showbreak = "↪ "     -- Prefijo para líneas envueltas (puedes cambiarlo)
