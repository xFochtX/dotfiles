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
    config = function()
      require("scrollbar").setup({
        handle = {
          color = "#666666",
          hide_if_all_visible = false,
        },
        marks = {
          Search = { color = "#FFA500" },
          Error = { color = "#FF0000" },
          Warn = { color = "#FFFF00" },
          Info = { color = "#00FFFF" },
          Hint = { color = "#FFFFFF" },
        },
      })
    end,
  },
}
