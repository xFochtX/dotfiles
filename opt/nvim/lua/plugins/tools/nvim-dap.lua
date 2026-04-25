-- ──────────────────────────────────────────────────────────────────────────────
-- nvim-dap (Debug Adapter Protocol)
-- ──────────────────────────────────────────────────────────────────────────────
--
-- Proporciona soporte de depuración en Neovim mediante el protocolo DAP.
--
-- Permite:
--   • Control de ejecución: continuar, pausar, detener, ejecutar hasta cursor
--   • Breakpoints: simples, condicionales, con logs
--   • Inspección de variables en línea (virtual text)
--   • Paneles de debug (scopes, stacks, watches, breakpoints, REPL, console)
--   • Consola interactiva (REPL) para ejecutar código durante el debug
--   • Visualización de DataFrames de pandas mediante visidata
--
-- Keys principales:
--   • <leader>db     → Toggle breakpoint
--   • <leader>dB     → Breakpoint condicional
--   • <leader>dc     → Continue (ejecutar hasta siguiente breakpoint)
--   • <leader>dO     → Step Over (siguiente línea, sin entrar en funciones)
--   • <leader>di     → Step Into (entrar en funciones)
--   • <leader>do     → Step Out (salir de la función actual)
--   • <leader>dp     → Pause
--   • <leader>dt     → Terminate
--   • <leader>dl     → Run Last
--   • <leader>dC     → Run to Cursor
--   • <leader>dw     → Hover widgets
--   • <leader>dh     → Hover info de variable
--   • <leader>dj/dk  → Down/Up en el stack
--   • <leader>dr     → Toggle REPL
--   • <leader>dg     → Go to line
--   • <leader>ds     → Session
--   • <leader>da     → Run with args
--   • <leader>dv     → Eval selection (modo visual)
--   • <leader>d<Down> → Toggle panel inferior
--   • <leader>d<Right> → Toggle panel derecho
--
-- Paneles:
--   Panel inferior (bottom): Console, REPL, Scopes
--   Panel derecho (right): Stacks, Watches, Breakpoints
--
-- Visidata:
--   Requiere: pip install visidata
--   <leader>df (modo visual) → Exporta DataFrame a CSV y abre visidata
--
-- Virtual Text:
--   Muestra valores de variables en línea
--   DataFrames se muestran simplificados: "df = DataFrame"
--
-- Dependencias:
--   • nvim-dap-ui         → Interfaz visual de paneles
--   • nvim-dap-virtual-text → Valores en línea
--   • visidata.nvim      → Visualización de DataFrames
--
-- ──────────────────────────────────────────────────────────────────────────────

return {
  {
    "mfussenegger/nvim-dap",
    recommended = true,
    desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",

    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "Willem-J-an/visidata.nvim",
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },
    },

    keys = {
      { "<leader>d", "", desc = "+debug", mode = { "n", "v" } },

      -- ─── Paneles ────────────────────────────────────────────────────────────
      {
        "<leader>d<Down>",
        function()
          require("dapui").toggle({ layout = 1 })
        end,
        desc = "Toggle Bottom Panel",
      },
      {
        "<leader>d<Right>",
        function()
          require("dapui").toggle({ layout = 2 })
        end,
        desc = "Toggle Right Panel",
      },
      {
        "<leader>dv",
        function()
        require("dapui").toggle({ layout = 3 })
        end,
        desc = "Toggle Scopes (Variables)",
      },
      {
        "<leader>dr",
        function()
        require("dap").repl.toggle()
        end,
        desc = "Toggle REPL",
      },

      -- ─── Breakpoints ────────────────────────────────────────────────────
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

      -- ─── Ejecución ──────────────────────────────────────────────────────
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
        "<leader>dl",
        function()
          require("dap").run_last()
        end,
        desc = "Run Last",
      },
      {
        "<leader>dp",
        function()
          require("dap").pause()
        end,
        desc = "Pause",
      },
      {
        "<leader>dt",
        function()
          require("dap").terminate()
        end,
        desc = "Terminate",
      },

      -- ─── Step (ejecución paso a paso) ────────────────────────────────
      {
        "<leader>di",
        function()
          require("dap").step_into()
        end,
        desc = "Step Into",
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

      -- ─── Stack ──────────────────────────────────────────────────────────
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

      -- ─── Session ─────────────────────────────────────────────────────
      {
        "<leader>ds",
        function()
          require("dap").session()
        end,
        desc = "Session",
      },

      -- ─── Widgets ───────────────────────────────────────────────────
      {
        "<leader>dw",
        function()
          require("dap.ui.widgets").hover()
        end,
        desc = "Widgets",
      },
      {
        "<leader>dh",
        function()
          require("dap.ui.widgets").hover()
        end,
        desc = "Hover Variable Info",
      },

      -- ─── Eval ───────────────────────────────────────────────────────
      {
        "<leader>dv",
        function()
          require("dapui").eval()
        end,
        mode = { "v" },
        desc = "Eval Selection",
      },

      -- ─── Visidata ───────────────────────────────────────────────────
      {
        "<leader>df",
        function()
          local dap = require("dap")

          local start_pos = vim.fn.getpos("'<")
          local end_pos = vim.fn.getpos("'>")
          local lines = vim.fn.getline(start_pos[2], end_pos[2])
          local var = lines[1]:sub(start_pos[3], end_pos[3])

          if not var or var == "" then
            print("No variable selected")
            return
          end

          local tmpfile = "/tmp/nvim_dap_df.csv"

          local cmd = string.format("%s.to_csv('%s', index=False)", var, tmpfile)

          dap.repl.open()
          dap.repl.execute(cmd)

          vim.defer_fn(function()
            vim.cmd("botright split | terminal vd " .. tmpfile)
          end, 400)
        end,
        mode = { "v" },
        desc = "Visualize pandas df (visidata)",
      },
    },

    config = function()
      local dap = require("dap")

      -- ─── dap-ui ───────────────────────────────────────────────────────
      local dapui = require("dapui")

      dapui.setup({
        icons = { expanded = "▾", collapsed = "▸" },
        layouts = {
          {
            elements = {
              { id = "console", size = 0.3 },
              { id = "repl", size = 0.3 },
              { id = "scopes", size = 0.4 },
            },
            size = 15,
            position = "bottom",
          },
          {
            elements = {
              { id = "stacks", size = 0.33 },
              { id = "watches", size = 0.33 },
              { id = "breakpoints", size = 0.33 },
            },
            size = 40,
            position = "right",
          },
        },
        controls = {
          enabled = true,
          element_keys = {
            open = { "o", "<CR>" },
            expand = { "<CR>", "e" },
            expand_all = { "ea" },
            collapse = { "c", "h" },
            collapse_all = { "ca" },
            replay = { "r" },
            toggle = { "<Space>" },
          },
        },
        floating = {
          max_height = nil,
          max_width = nil,
          border = "single",
          mappings = { close = { "q", "<Esc>" } },
        },
        windows = { indent = 1 },
      })

      -- ─── nvim-dap-virtual-text ────────────────────────────────────────
      require("nvim-dap-virtual-text").setup({
        enabled = true,
        enable_commands = true,
        enable_set_rendered = true,
        highlight_changed = true,
        highlight_new = true,
        prefix = " 🐍 ",
        separator = " │ ",
        maximum_precision = 100,
        maximum_comment_length = 1000,
        verbose = 4,
        display_callback = function(variable, buf, stackframe, node, options)
          local name = variable.name
          local value = variable.value or ""
          local vtype = variable.type or ""

          -- Detectar DataFrame o Series directo
          -- El value ya tiene el formato: "... [1 rows x 3 columns]"
          if vtype:match("DataFrame") or vtype:match("Series") then
            local shape_match = value:match("%[(%d+)%s+rows?%s+x%s+(%d+)%s+columns?%]")
            if shape_match then
              local rows, cols = value:match("%[(%d+)%s+rows?%s+x%s+(%d+)%s+columns?%]")
              local display_value = "DataFrame [" .. rows .. " rows x " .. cols .. " columns]"
              if options.virt_text_pos == "inline" then
                return " = " .. display_value
              else
                return name .. " = " .. display_value
              end
            end
            if options.virt_text_pos == "inline" then
              return " = DataFrame"
            else
              return name .. " = DataFrame"
            end
          end

          -- Detectar dict/list con DataFrames anidados
          -- Formato: {'key1': DataFrame [X rows x Y columns], 'key2': ..., 'key3': DataFrame [X rows x Y columns]}
          if value:match("%[") and value:match("(%d+)%s+rows?%s+x%s+(%d+)%s+columns?") then
            local formatted = ""

            -- Iterar por cada elemento del dict: buscar pattern 'key': valor,
            -- Primero, encontrar todas las keys (soportar espacios y guiones)
            local keys = {}
            for k in value:gmatch("['\"]([^'\"]+)['\"]%s*:") do
              table.insert(keys, k)
            end

            -- Encontrar todos los shapes
            local shapes = {}
            for rows, cols in value:gmatch("(%d+)%s+rows?%s+x%s+(%d+)%s+columns?") do
              table.insert(shapes, {rows = rows, cols = cols})
            end

-- Para cada key, construir el output
            local parts = {}
            for i, key in ipairs(keys) do
              if i <= #shapes then
                table.insert(parts, "'" .. key .. "': DataFrame [" .. shapes[i].rows .. " rows x " .. shapes[i].cols .. " columns]")
              else
                -- Buscar el valor de esta key (entre ':' y ',' o '}')
                local key_pos = value:find("['\"]" .. key .. "['\"]", 1, true)
                if key_pos then
                  local after_key = value:sub(key_pos + #key + 2) -- skip 'key':
                  local val = after_key:match("([^,}]+)") or ""
                  val = val:gsub("%s+", " "):gsub("^%s+", ""):gsub("%s+$", "")
                  -- Limpiar líneas de datos de DataFrames sin shape
                  val = val:gsub("\n%s*%d+%s+", " ")
                  val = val:gsub("\n", " ")
                  if #val > 40 then val = string.sub(val, 1, 37) .. "..." end
if #val > 0 then
                    table.insert(parts, "'" .. key .. "': " .. val)
                  end
                end
              end
            end

            formatted = table.concat(parts, ", ")

            -- Si no se encontró nada, usar fallback simple
            if #formatted == 0 then
              formatted = value:gsub("%s+", " "):sub(1, 500)
            end

            -- Truncar solo si es EXTREMADAMENTE largo (1000 caracteres)
            if #formatted > 1000 then
              formatted = string.sub(formatted, 1, 997) .. "..."
            end

            if options.virt_text_pos == "inline" then
              return " = " .. formatted
            else
              return name .. " = " .. formatted
            end
          end

          -- Default
          local clean_value = value:gsub("%s+", " ")
          if options.virt_text_pos == "inline" then
            return " = " .. clean_value
          else
            return name .. " = " .. clean_value
          end
        end,
        callback = function(client, buf, frame)
          if not frame then return nil end
          return client.bufname(buf)
        end,
      })

      -- ══════════════════════════════════════════════════════════════════════
      -- EVENT HANDLER: cargar info de DataFrames cuando para en breakpoint
      -- ══════════════════════════════════════════════════════════════════════
      local df_info_cache = {}

      dap.listeners.after.scopes_added["dap-virtual-text-df"] = function(session, body)
        if not body or not body.scopes then return end

        for _, scope in ipairs(body.scopes) do
          if scope.variablesReference then
            session:request("scopes", { variablesReference = scope.variablesReference }, function(err, response)
              if err or not response or not response.body.variables then return end

              for _, var in ipairs(response.body.variables) do
                local var_name = var.name
                local var_type = var.type or ""
                local var_value = var.value or ""

                -- Cachear info de DataFrames para uso posterior
                if var_type:match("DataFrame") or var_value:match("DataFrame") then
                  -- Solicitar shape y columns
                  session:request("evaluate", {
                    expression = var_name .. ".shape",
                    context = "repl",
                  }, function(err_shape, resp_shape)
                    if err_shape or not resp_shape or not resp_shape.body then return end
                    local shape = resp_shape.body.result or "?"

                    session:request("evaluate", {
                      expression = "list(" .. var_name .. ".columns)",
                      context = "repl",
                    }, function(err_cols, resp_cols)
                      if err_cols or not resp_cols or not resp_cols.body then return end
                      local cols = resp_cols.body.result or "?"

                      df_info_cache[var_name] = {
                        shape = shape,
                        cols = cols,
                      }
                    end)
                  end)
                end
              end
            end)
          end
        end
      end

      -- Hook para usar el cache en display_callback
      -- Esta función se puede llamar desde el display_callback
      _G.dap_get_df_info = function(var_name)
        return df_info_cache[var_name]
      end

      -- ─── mason-nvim-dap ───────────────────────────────────────────────
      if LazyVim.has("mason-nvim-dap.nvim") then
        require("mason-nvim-dap").setup(LazyVim.opts("mason-nvim-dap.nvim"))
      end

      -- ─── Signos para breakpoints ──────────────────────────────────────
      vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

      for name, sign in pairs(LazyVim.config.icons.dap) do
        sign = type(sign) == "table" and sign or { sign }
        vim.fn.sign_define(
          "Dap" .. name,
          { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
        )
      end
    end,
  },
}
