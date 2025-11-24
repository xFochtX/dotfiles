-- ──────────────────────────────────────────────────────────────────────────────
-- vim-illuminate
-- ------------------------------------------------------------------------------
-- Plugin que resalta automáticamente la palabra bajo el cursor y todas sus
-- ocurrencias en el buffer. Es útil para entender el contexto, navegar
-- referencias, y visualizar repeticiones sin necesidad de usar búsquedas manuales.
--
-- FUNCIONALIDAD:
--   • Ilumina la palabra actual bajo el cursor en tiempo real.
--   • Soporte para múltiples proveedores:
--       - LSP          → Usa referencias proporcionadas por el servidor de lenguaje.
--       - Treesitter   → Analiza el árbol sintáctico.
--       - Regex        → Búsqueda tradicional basada en patrones.
--   • Ajuste del retraso antes de iluminar.
--   • Posibilidad de excluir ciertos tipos de archivo.
--
-- CONFIGURACIÓN:
--   event                → Activa el plugin al mantener el cursor quieto.
--   providers            → Lista de fuentes usadas para resaltar referencias.
--   delay                → Tiempo en milisegundos antes de iluminar.
--   filetypes_denylist   → Tipos de archivo donde se deshabilita la iluminación.
--

return {
  "RRethy/vim-illuminate",

  event = { "CursorHold", "CursorHoldI" },

  config = function()
    require("illuminate").configure({
      providers = {
        "lsp",
        "treesitter",
        "regex",
      },
      delay = 120,
      filetypes_denylist = {
        "NvimTree",
        "neo-tree",
        "dashboard",
        "alpha",
        "help",
        "lazy",
        "mason",
      },
    })
  end,
}
