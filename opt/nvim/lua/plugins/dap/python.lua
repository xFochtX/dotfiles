return {
  "mfussenegger/nvim-dap",

  opts = function()
    local dap = require("dap")

    -- ══════════════════════════════════════════════════════════════════════
    -- EXTERNAL TERMINAL PARA VISIDATA
    -- Visualización de DataFrames requiere terminal externa
    -- ══════════════════════════════════════════════════════════════════════
    dap.defaults.fallback.external_terminal = {
      command = vim.fn.exepath("wezterm") or vim.fn.exepath("kitty") or "x-terminal-emulator",
      args = { "--hold", "--command" },
    }

    -- ──────────────────────────────────────────────────────────────
    -- ADAPTER (debugpy)
    -- conecta Neovim con Python debugger
    -- ──────────────────────────────────────────────────────────────
    dap.adapters.python = {
      type = "executable",
      command = vim.fn.exepath("python"),
      args = { "-m", "debugpy.adapter" },
    }

    -- helper: python del entorno actual
    local function get_python()
      return vim.fn.exepath("python")
    end

    -- helper: raíz del proyecto
    local function get_cwd()
      return vim.fn.getcwd()
    end

    -- helper: convierte archivo -> módulo Python
    local function file_to_module()
      return vim.fn.expand("%:r"):gsub("/", ".")
    end

    -- ──────────────────────────────────────────────────────────────
    -- CONFIGURACIONES DE DEBUG (ESSENTIALS)
    -- ──────────────────────────────────────────────────────────────
    dap.configurations.python = {

      -- ═════════════════════════════════════════════════════════════════════
      -- 1. MODO GENÉRICO (scripts sueltos)
      -- equivalente: python archivo.py
      -- ═════════════════════════════════════════════════════════════════════
      {
        name = "Run file (generic)",
        type = "python",
        request = "launch",

        program = "${file}",

        cwd = get_cwd(),

        pythonPath = get_python,
      },

      -- ═════════════════════════════════════════════════════════════════════════════
      -- 2. MODO INTELIGENTE (proyectos tipo paquete)
      -- equivalente: python -m folder.archivo
      -- IMPORTANTE: agrega PYTHONPATH para que encuentre paquetes del proyecto
      -- ═════════════════════════════════════════════════════════════════════════════
      {
        name = "Run as module (project)",
        type = "python",
        request = "launch",

        module = file_to_module,

        cwd = get_cwd(),

        pythonPath = get_python,

        env = {
          PYTHONPATH = get_cwd(),
        },
      },
    }
  end,
}
