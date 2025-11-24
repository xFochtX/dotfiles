-- ──────────────────────────────────────────────────────────────────────────────
-- vim-matchup
-- ------------------------------------------------------------------------------
-- Plugin que mejora el resaltado y manejo de pares de delimitadores en Vim/Neovim,
-- como paréntesis, llaves, corchetes y otros símbolos. Funciona incluso dentro de
-- strings y otros contextos complejos.
--
-- FUNCIONALIDAD:
--   • Resalta pares de delimitadores coincidentes.
--   • Muestra información de pares fuera de la pantalla mediante popup.
--   • Compatible con Treesitter para detección precisa de estructuras.
--   • Mejora el flujo de trabajo en edición de código con múltiples niveles de anidación.
--
-- CONFIGURACIÓN:
--   vim.g.matchup_delim_noskips           → 1 para habilitar matching dentro de strings.
--   vim.g.matchup_matchparen_offscreen    → Configuración de método "popup" para pares fuera de pantalla.
--   dependencies                          → Requiere nvim-treesitter para un análisis más preciso.
--

return {
  {
    "andymass/vim-matchup",

    config = function()
      -- Habilita el matching incluso dentro de strings
      vim.g.matchup_delim_noskips = 1
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,

    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
