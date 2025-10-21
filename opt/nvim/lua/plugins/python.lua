return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {}, -- LSP para Python
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    config = function()
      local lint = require("lint")

      -- 🧠 Ajusta los argumentos que usa flake8
      lint.linters.flake8 = {
        cmd = "flake8",
        stdin = false,
        args = {
          "--ignore=E203,E266,E501,W503,F403",
          "--max-line-length=100",
        },
      }

      -- Asocia flake8 con archivos Python
      lint.linters_by_ft = {
        python = { "flake8" },
      }

      -- Auto-lint al guardar
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
  {
    "mhartington/formatter.nvim",
    config = function()
      require("formatter").setup({
        filetype = {
          python = {
            function()
              return {
                exe = "black",
                args = { "-" },
                stdin = true,
              }
            end,
          },
        },
      })
    end,
  },
}
