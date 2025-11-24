-- ──────────────────────────────────────────────────────────────────────────────
-- obsidian.nvim
-- ------------------------------------------------------------------------------
-- Plugin que integra Obsidian (gestor de notas en Markdown) directamente en
-- Neovim. Permite abrir, crear y navegar notas, usar plantillas, checkboxes,
-- enlaces internos y aprovechar buscadores/pickers para organizar tu contenido.
--
-- FUNCIONALIDAD:
--   • Soporte para múltiples "workspaces" de notas.
--   • Integración con pickers como Telescope, fzf-lua, mini.pick o snacks.pick.
--   • Completado automático compatible con nvim-cmp.
--   • Callbacks personalizables al entrar a un buffer de nota.
--   • Plantillas configurables con formato de fecha y hora, subdirectorios y tags.
--   • Keymaps dentro de notas para seguir enlaces, alternar checkboxes y acciones inteligentes.
--
-- CONFIGURACIÓN:
--   version         → "*" para usar la última release estable.
--   lazy            → false, carga inmediata del plugin.
--   enabled         → Función que permite desactivar el plugin según condiciones (ej. vim.g.disable_obsidian).
--   dependencies    → Requiere 'plenary.nvim'.
--   opts.workspaces → Definición de espacios de trabajo con nombre y ruta.
--   opts.completition → Activación de completado con nvim-cmp.
--   opts.picker     → Configura el picker preferido.
--   opts.callbacks  → Funciones que se ejecutan al entrar a un buffer de nota.
--   opts.templates  → Configuración de subdirectorios, formato de fecha/hora y tags para plantillas.
--

return {
  "obsidian-nvim/obsidian.nvim",

  version = "*",
  lazy = false,

  enabled = function()
    return not vim.g.disable_obsidian
  end,

  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  opts = {
    workspaces = {
      {
        name = "Notes",
        path = os.getenv("HOME") .. "/.config/obsidian",
      },
    },

    completition = {
      cmp = true,
    },

    picker = {
      name = "snacks.pick",
    },

    callbacks = {
      enter_note = function(client, note)
        vim.keymap.set("n", "gf", function()
          return require("obsidian").util.gf_passthrough()
        end, { buffer = note.bufnr, expr = true, desc = "Obsidian follow link" })

        vim.keymap.set("n", "<leader>ch", function()
          return require("obsidian").util.toggle_checkbox()
        end, { buffer = note.bufnr, desc = "Toggle checkbox" })

        vim.keymap.set("n", "<cr>", function()
          return require("obsidian").util.smart_action()
        end, { buffer = note.bufnr, expr = true, desc = "Obsidian smart action" })
      end,
    },

    templates = {
      subdir = "templates",
      date_format = "%Y-%m-%d-%a",
      gtime_format = "%H:%M",
      tags = "",
    },
  },
}

