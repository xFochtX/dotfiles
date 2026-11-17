-- ──────────────────────────────────────────────────────────────────────────────
-- nvim-scrollbar
-- ------------------------------------------------------------------------------
-- Plugin que añade una barra de desplazamiento visual en Neovim, mostrando no
-- solo la posición dentro del archivo, sino también marcas para búsquedas,
-- errores, advertencias y más. Funciona como una barra lateral informativa que
-- ayuda a navegar rápido por el contenido.
--
-- FUNCIONALIDAD:
--   • Muestra una barra de desplazamiento estilizada y configurable.
--   • Indica posiciones relevantes mediante marcas (search, error, warn, etc.).
--   • Permite personalizar colores, visibilidad y comportamiento del handle.
--
-- CONFIGURACIÓN:
--   handle.color            → Color del "handle" (indicador principal).
--   handle.hide_if_all_visible → Oculta el handle si todo el documento es visible.
--   marks.<Tipo>.color      → Color de cada marca (Search, Error, Warn, Info, Hint).
--

return {
  {
    "petertriho/nvim-scrollbar",

    dependencies = {
      {
        "lewis6991/gitsigns.nvim",
        opts = {},
      },
    },

    opts = {
      -- Indicador principal
      scrollbar = {
        thumb = {
          highlight = {
            bg = "#666666",
          },
          hide_if_all_visible = false,
        },

        -- Mantener visible la barra aunque el archivo quepa en pantalla
        hide_if_all_visible = false,

        -- Considerar líneas visuales ajustadas y pliegues
        unit = "screenline",
      },

      -- Fuentes de información para la barra
      providers = {
        cursor = true,
        diagnostic = true,
        search = true,
        gitsigns = true,
      },

      -- Colores personalizados
      marks = {
        Search = {
          highlight = { fg = "#FFA500" },
        },
        Error = {
          highlight = { fg = "#FF0000" },
        },
        Warn = {
          highlight = { fg = "#FFFF00" },
        },
        Info = {
          highlight = { fg = "#00FFFF" },
        },
        Hint = {
          highlight = { fg = "#FFFFFF" },
        },

        -- Marcas de Git
        GitAdd = {
          highlight = { fg = "#00FF00" },
        },
        GitChange = {
          highlight = { fg = "#00BFFF" },
        },
        GitDelete = {
          highlight = { fg = "#FF5555" },
        },
      },
    },
  },
}
