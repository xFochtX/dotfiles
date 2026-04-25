-- ========================================================
-- INIT LAZY.NVIM & CONFIGURACIÓN GENERAL
-- ========================================================

-- ===============================
-- Configuración de Node.js
-- ===============================
-- Usado para LSPs y plugins que dependen de Node (TS, Prettier, etc.)
vim.g.node_host_prog = vim.fn.exepath("node") or "/usr/local/bin/node"
if vim.fn.executable("node") == 1 then
  local node_version = vim.fn.system("node --version"):gsub("\n", "")
  print("Using Node.js version: " .. node_version)
end

-- ===============================
-- Spell-check
-- ===============================
-- Activa revisión ortográfica en inglés y español latino

-- Activar spell-check
vim.opt.spell = true
vim.opt.spelllang = { "en", "es" }  -- Puedes añadir más idiomas si quieres
-- Archivos de diccionario personal
local spell_path = vim.fn.stdpath("config") .. "/spell/custom.add"
vim.opt.spellfile = spell_path
-- Los diccionarios deben estar en ~/.config/nvim/spell o donde tengas 'spell' folder

-- ===============================
-- Clipboard (con soporte WSL)
-- ===============================
vim.opt.clipboard = "unnamedplus"
if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "win32yank",
    copy = { ["+"] = "win32yank.exe -i --crlf", ["*"] = "win32yank.exe -i --crlf" },
    paste = { ["+"] = "win32yank.exe -o --lf", ["*"] = "win32yank.exe -o --lf" },
    cache_enabled = false,
  }
end

-- ===============================
-- Bootstrap lazy.nvim
-- ===============================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath
  })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

-- ===============================
-- Configuración básica de Neovim
-- ===============================
require("core.options")
require("core.autocmds")
require("core.nodejs")
require("core.keymaps")

-- ===============================
-- Configuración de plugins con lazy.nvim
-- ===============================
require("lazy").setup({
  spec = {
    -- LazyVim y sus extras
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    
    -- Extras útiles
    { import = "lazyvim.plugins.extras.editor.harpoon2" },
    { import = "lazyvim.plugins.extras.editor.mini-files" },
    { import = "lazyvim.plugins.extras.editor.snacks_picker" },

    -- Formateo y linting
    --{ import = "lazyvim.plugins.extras.formatting.prettier" },
    --{ import = "lazyvim.plugins.extras.linting.eslint" },

    -- Soporte de lenguajes
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.markdown" },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.angular" },
    { import = "lazyvim.plugins.extras.lang.astro" },
    { import = "lazyvim.plugins.extras.lang.go" },
    { import = "lazyvim.plugins.extras.lang.nix" },
    { import = "lazyvim.plugins.extras.lang.toml" },
    { import = "lazyvim.plugins.extras.lang.python" },
    { import = "lazyvim.plugins.extras.lang.yaml" },

    -- Plugins de codificación
    { import = "lazyvim.plugins.extras.coding.mini-surround" },
    { import = "lazyvim.plugins.extras.editor.mini-diff" },
    { import = "lazyvim.plugins.extras.coding.blink" },

    -- Utilidades
    --{ import = "lazyvim.plugins.extras.util.mini-hipatterns" },

    -- AI
    --{ import = "lazyvim.plugins.extras.ai.copilot" },
    --{ import = "lazyvim.plugins.extras.ai.copilot-chat" },
    
    -- Plugins personalizados en lua/plugins/
    { import = "plugins/ui" },
    { import = "plugins/coding" },
    { import = "plugins/langs" },
    { import = "plugins/tools" },
    { import = "plugins/extras" },
    { import = "plugins/dap"}
  },

  -- ===============================
  -- Opciones por defecto
  -- ===============================
  defaults = {
    lazy = false,    -- Plugins propios se cargan al inicio
    version = false -- Usar última versión en Git
  },

  -- ===============================
  -- Actualizaciones automáticas
  -- ===============================
  checker = { enabled = true },

  -- ===============================
  -- Mejora de rendimiento
  -- ===============================
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin"
      }
    }
  }
})
