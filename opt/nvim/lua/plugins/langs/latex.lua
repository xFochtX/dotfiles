return {
  -- Plugin principal para trabajar con LaTeX
  {
    "lervag/vimtex",
    ft = "tex",  -- solo carga para archivos .tex
    config = function()
      -- Usa latexmk como compilador
      vim.g.vimtex_compiler_method = "latexmk"

      -- Visualizador PDF: Zathura
      vim.g.vimtex_view_method = "zathura"

      -- No abrir quickfix automáticamente
      vim.g.vimtex_quickfix_mode = 0

      -- ⚡ Parche para no mostrar imágenes inline en Kitty
      vim.g.kitty_enable_graphics = 0
      vim.g.vimtex_syntax_conceal_disable = 1
      vim.opt.conceallevel = 0
      vim.opt.concealcursor = ""
    end,
  },

  -- LSP para autocompletado semántico de LaTeX
  {
    "neovim/nvim-lspconfig",
    ft = "tex",
    opts = {
      servers = {
        texlab = {
          settings = {
            texlab = {
              build = {
                executable = "latexmk",
                args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
                onSave = true,
              },
              forwardSearch = {
                executable = "zathura",
                args = { "--synctex-forward", "%l:1:%f", "%p" },
              },
              chktex = { onEdit = false, onOpenAndSave = true },
            },
          },
        },
      },
    },
  },

  -- Snippets para LaTeX
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    ft = "tex",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load({ include = { "latex" } })
    end,
  },

  -- Integrar snippets con blink.cmp
  {
    "saghen/blink.cmp",
    optional = true,
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      opts.sources.default = opts.sources.default or {}

      -- Asegúrate de incluir el LSP para LaTeX
      if not vim.tbl_contains(opts.sources.default, "lsp") then
        table.insert(opts.sources.default, "lsp")
      end

      -- Configurar el sistema de snippets moderno
      opts.snippets = opts.snippets or {}
      opts.snippets.preset = "luasnip"  -- usa LuaSnip como sistema de snippets

      return opts
    end,
  }
}

