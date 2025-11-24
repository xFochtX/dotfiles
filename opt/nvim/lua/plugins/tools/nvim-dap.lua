-- ──────────────────────────────────────────────────────────────────────────────
-- nvim-dap (Debug Adapter Protocol)
-- ------------------------------------------------------------------------------
-- Plugin que proporciona soporte de depuración en Neovim mediante el protocolo
-- DAP. Permite colocar breakpoints, ejecutar paso a paso, inspeccionar variables,
-- ver stacks, manejar sesiones, usar REPL y conectar adaptadores específicos
-- para cada lenguaje.
--
-- FUNCIONALIDAD:
--   • Control de ejecución: continuar, pausar, detener, ejecutar hasta cursor, etc.
--   • Breakpoints: simples, condicionales, con logs, etc.
--   • Integración con UI adicional mediante 'nvim-dap-ui'.
--   • Texto virtual en línea con información de variables mediante 'nvim-dap-virtual-text'.
--   • Soporte opcional para configuraciones desde '.vscode/launch.json'.
--   • Carga de variables de entorno desde $ENV y archivos .env.
--
-- CONFIGURACIÓN:
--   recommended     → Marca este plugin como recomendado por LazyVim.
--   dependencies    → Añade UI y soporte de texto virtual para depuración.
--   keys            → Gran conjunto de atajos agrupados bajo <leader>d.
--                     Ejemplos:
--                       <leader>db → Toggle breakpoint.
--                       <leader>dc → Continue.
--                       <leader>di → Step Into.
--                       <leader>dO → Step Over.
--                       <leader>dr → Toggle REPL.
--   launch.json     → Si existe .vscode/launch.json, se carga automáticamente.
--   env loader      → Añade variables de entorno del sistema y de un archivo .env.
--

return {
  {
    "mfussenegger/nvim-dap",
    recommended = true,
    desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",

    dependencies = {
      "rcarriga/nvim-dap-ui",
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },
    },

    keys = {
      { "<leader>d", "", desc = "+debug", mode = { "n", "v" } },
      {
        "<leader>dB",
        function()
          require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end,
        desc = "Breakpoint Condition",
      },
      {
        "<leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
      },
      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "Continue",
      },
      {
        "<leader>da",
        function()
          require("dap").continue({ before = get_args })
        end,
        desc = "Run with Args",
      },
      {
        "<leader>dC",
        function()
          require("dap").run_to_cursor()
        end,
        desc = "Run to Cursor",
      },
      {
        "<leader>dg",
        function()
          require("dap").goto_()
        end,
        desc = "Go to Line (No Execute)",
      },
      {
        "<leader>di",
        function()
          require("dap").step_into()
        end,
        desc = "Step Into",
      },
      {
        "<leader>dj",
        function()
          require("dap").down()
        end,
        desc = "Down",
      },
      {
        "<leader>dk",
        function()
          require("dap").up()
        end,
        desc = "Up",
      },
      {
        "<leader>dl",
        function()
          require("dap").run_last()
        end,
        desc = "Run Last",
      },
      {
        "<leader>do",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },
      {
        "<leader>dO",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
      {
        "<leader>dp",
        function()
          require("dap").pause()
        end,
        desc = "Pause",
      },
      {
        "<leader>dr",
        function()
          require("dap").repl.toggle()
        end,
        desc = "Toggle REPL",
      },
      {
        "<leader>ds",
        function()
          require("dap").session()
        end,
        desc = "Session",
      },
      {
        "<leader>dt",
        function()
          require("dap").terminate()
        end,
        desc = "Terminate",
      },
      {
        "<leader>dw",
        function()
          require("dap.ui.widgets").hover()
        end,
        desc = "Widgets",
      },
    },

    config = function()
      local dap = require("dap")

      if LazyVim.has("mason-nvim-dap.nvim") then
        require("mason-nvim-dap").setup(LazyVim.opts("mason-nvim-dap.nvim"))
      end

      vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

      for name, sign in pairs(LazyVim.config.icons.dap) do
        sign = type(sign) == "table" and sign or { sign }
        vim.fn.sign_define(
          "Dap" .. name,
          { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
        )
      end

      local vscode = require("dap.ext.vscode")
      local json = require("plenary.json")
      vscode.json_decode = function(str)
        return vim.json.decode(json.json_strip_comments(str))
      end

      if vim.fn.filereadable(".vscode/launch.json") == 1 then
        vscode.load_launchjs()
      end

      local function load_env_variables()
        local variables = {}
        for k, v in pairs(vim.fn.environ()) do
          variables[k] = v
        end

        local env_file_path = vim.fn.getcwd() .. "/.env"
        local env_file = io.open(env_file_path, "r")
        if env_file then
          for line in env_file:lines() do
            for key, value in string.gmatch(line, "([%w_]+)=([%w_]+)") do
              variables[key] = value
            end
          end
          env_file:close()
        else
          print("Error: .env file not found in " .. env_file_path)
        end
        return variables
      end

      for _, config in pairs(dap.configurations.go or {}) do
        config.env = load_env_variables
      end
    end,
  },
}
