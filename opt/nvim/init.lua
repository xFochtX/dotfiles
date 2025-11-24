-- ===============================================================
--                    INIT.LUA - CONFIGURACIÓN NEOVIM
-- ===============================================================
-- Este archivo se encarga de inicializar Neovim:
--   1. Configurar Node.js para integración con plugins.
--   2. Inicializar LazyVim y lazy.nvim con todos tus plugins.
--   3. Ajustar opciones básicas de Neovim.
-- ===============================================================

-- ---------------------------------------------------------------
-- 1️⃣ Configurar Node.js
-- ---------------------------------------------------------------
-- Esto es útil para plugins que dependen de Node.js, como
-- nvim-treesitter, LSP para JavaScript/TypeScript, y más.
-- El parámetro 'silent' evita que aparezcan mensajes al iniciar.
require("core.nodejs").setup({ silent = true })


-- ---------------------------------------------------------------
-- 2️⃣ Inicializar LazyVim y lazy.nvim
-- ---------------------------------------------------------------
-- Lazy.nvim se encarga de cargar tus plugins bajo demanda.
-- LazyVim agrega la configuración por defecto y extras opcionales.
require("core.lazy")

-- ---------------------------------------------------------------
-- 3️⃣ Opciones de temporización de teclas
-- ---------------------------------------------------------------
-- timeoutlen: tiempo máximo para esperar combinaciones de teclas (ms)
-- ttimeoutlen: tiempo de espera para teclas especiales (ms)
vim.opt.timeoutlen = 1000   -- 1 segundo
vim.opt.ttimeoutlen = 0     -- sin retardo para teclas especiales


-- ---------------------------------------------------------------
-- 4️⃣ Opciones generales de Neovim
-- ---------------------------------------------------------------
-- Activar soporte UTF-8
vim.o.encoding = "utf-8"

-- Activar colores verdaderos (24-bit)
vim.o.termguicolors = true

