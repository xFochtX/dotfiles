-- ──────────────────────────────────────────────────────────────────────────────
-- oil.nvim — Edita tu sistema de archivos como si fuera un buffer
-- ------------------------------------------------------------------------------
-- Plugin que reemplaza el explorador de archivos tradicional por una vista tipo
-- "buffer", permitiendo navegar, mover, copiar, renombrar y gestionar archivos
-- usando comandos y gestos nativos de edición. También ofrece una vista flotante,
-- previsualización integrada y control total sobre cómo se muestran archivos.
--
-- FUNCIONALIDAD:
--   • Abre directorios como buffers editables (similar a netrw pero más potente).
--   • Permite navegar hacia el directorio padre, entrar, renombrar, borrar y más.
--   • Vista flotante opcional para navegar sin cambiar la ventana actual.
--   • Previsualización de archivos, ordenación natural y soporte para archivos ocultos.
--   • Keymaps totalmente personalizables dentro del buffer Oil.
--
-- CONFIGURACIÓN:
--   default_file_explorer          → Oil reemplaza a netrw y gestiona directorios.
--   restore_win_options            → Restaura opciones de ventana al salir del buffer.
--   skip_confirm_for_simple_edits  → Salta confirmaciones para cambios simples.
--   prompt_save_on_select_new_entry→ Pide guardar cambios antes de abrir otra entrada.
--   keymaps                        → Mapeos exclusivos del buffer Oil.
--   use_default_keymaps            → Activa o no los keymaps predeterminados.
--   view_options                   → Controla visibilidad, ordenación y reglas de ocultamiento.
--   float / preview / progress     → Configuración detallada de ventanas flotantes.
--   ssh                            → Configuración para ventanas SSH.
--
-- ATAJOS GLOBALES:
--   -            → Abre Oil en el directorio padre.
--   <leader>E    → Abre Oil en modo flotante.
--   <leader>-    → Abre Oil en el directorio del archivo actual.
--

return {
  "stevearc/oil.nvim",

  -- Load Oil when opening a directory or when using the keymap
  lazy = false,

  keys = {
    { "-", "<CMD>Oil<CR>", desc = "Open Oil (parent dir)" },
    { "<leader>E", "<CMD>Oil --float<CR>", desc = "Open Oil (floating)" },
  },

  opts = {
    -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
    default_file_explorer = true,

    -- Restore window options to previous values when leaving an oil buffer
    restore_win_options = true,

    -- Skip the confirmation popup for simple operations
    skip_confirm_for_simple_edits = false,

    -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
    prompt_save_on_select_new_entry = true,

    -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
    keymaps = {
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      ["<C-s>"] = { "actions.select", opts = { vertical = true }, desc = "Open in vertical split" },
      ["<C-v>"] = { "actions.select", opts = { horizontal = true }, desc = "Open in horizontal split" },
      ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open in new tab" },
      ["<C-p>"] = "actions.preview",
      ["<C-c>"] = "actions.close",
      ["<C-r>"] = "actions.refresh",
      ["-"] = "actions.parent",
      ["_"] = "actions.open_cwd",
      ["`"] = "actions.cd",
      ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
      ["gs"] = "actions.change_sort",
      ["gx"] = "actions.open_external",
      ["g."] = "actions.toggle_hidden",
      ["g\\"] = "actions.toggle_trash",
      -- Quick quit
      ["q"] = "actions.close",
    },

    -- Set to false to disable all of the above keymaps
    use_default_keymaps = false,

    view_options = {
      -- Show files and directories that start with "." by default
      show_hidden = true,
      -- This function defines what is considered a "hidden" file
      is_hidden_file = function(name, bufnr)
        return vim.startswith(name, ".")
      end,
      -- This function defines what will never be shown, even when `show_hidden` is set
      is_always_hidden = function(name, bufnr)
        return name == ".." or name == ".git"
      end,
      -- Natural sort order for files and directories
      natural_order = true,
      case_insensitive = false,
      sort = {
        -- sort order can be "asc" or "desc"
        -- see :help oil-columns to see which columns are sortable
        { "type", "asc" },
        { "name", "asc" },
      },
    },

    -- Configuration for the floating window in oil.open_float
    float = {
      -- Padding around the floating window
      padding = 2,
      max_width = 100,
      max_height = 30,
      border = "rounded",
      win_options = {
        winblend = 0,
      },
      -- preview_split: Split direction: "auto", "left", "right", "above", "below".
      preview_split = "auto",
      -- This is the config that will be passed to nvim_open_win.
      -- Change values here to customize the layout
      override = function(conf)
        return conf
      end,
    },

    -- Configuration for the actions floating preview window
    preview = {
      -- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
      -- min_width and max_width can be a single value or a list of mixed integer/float types.
      max_width = 0.9,
      -- min_width = {40, 0.4} means "at least 40 columns, or at least 40% of total"
      min_width = { 40, 0.4 },
      -- optionally define an integer/float for the exact width of the preview window
      width = nil,
      -- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
      max_height = 0.9,
      min_height = { 5, 0.1 },
      -- optionally define an integer/float for the exact height of the preview window
      height = nil,
      border = "rounded",
      win_options = {
        winblend = 0,
      },
      -- Whether the preview window is automatically updated when the cursor is moved
      update_on_cursor_moved = true,
    },

    -- Configuration for the floating progress window
    progress = {
      max_width = 0.9,
      min_width = { 40, 0.4 },
      width = nil,
      max_height = { 10, 0.9 },
      min_height = { 5, 0.1 },
      height = nil,
      border = "rounded",
      minimized_border = "none",
      win_options = {
        winblend = 0,
      },
    },

    -- Configuration for the floating SSH window
    ssh = {
      border = "rounded",
    },
  },

  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function(_, opts)
    require("oil").setup(opts)

    -- Custom autocmds for Oil
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "oil",
      callback = function()
        -- Set local options for oil buffers
        vim.opt_local.colorcolumn = ""
        vim.opt_local.signcolumn = "no"

        -- Auto-save when leaving oil buffer with changes
        vim.api.nvim_create_autocmd("BufLeave", {
          buffer = 0,
          callback = function()
            if vim.bo.modified then
              vim.cmd("silent! write")
            end
          end,
        })
      end,
    })

    -- Global keymap to open Oil in current buffer's directory
    vim.keymap.set("n", "<leader>-", function()
      local oil = require("oil")
      local current_buf = vim.api.nvim_get_current_buf()
      local current_file = vim.api.nvim_buf_get_name(current_buf)

      if current_file and current_file ~= "" then
        local dir = vim.fn.fnamemodify(current_file, ":h")
        oil.open(dir)
      else
        oil.open()
      end
    end, { desc = "Open Oil in current file's directory" })
  end,
}
