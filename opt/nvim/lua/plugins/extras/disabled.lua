-- ──────────────────────────────────────────────────────────────────────────────
-- Disabled Neovim Plugins
-- ------------------------------------------------------------------------------
-- Este archivo contiene la configuración para deshabilitar ciertos plugins
-- de Neovim que no se desean cargar, manteniendo la configuración limpia y
-- evitando conflictos o consumo innecesario de recursos.
--
-- FUNCIONALIDAD:
--   • Permite desactivar plugins individuales mediante la opción `enabled = false`.
--   • Mantiene referencias de los plugins en caso de que quieras habilitarlos
--     en el futuro.
--   • Incluye documentación básica de cada plugin (opcional).
--
-- CONFIGURACIÓN:
--   enabled → false para desactivar el plugin.
--   Mantener el bloque del plugin permite reactivarlo fácilmente más adelante.
--

return {
  {
    "akinsho/bufferline.nvim",
    enabled = false, -- Bufferline: barra de buffers con integración de tabpages
  },
  {
    "yetone/avante.nvim",
    enabled = false, -- Mejora la experiencia de edición en Neovim
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    enabled = false, -- Chat de Copilot deshabilitado
  },
  {
    "sudo-tee/opencode.nvim",
    enabled = false, -- Plugin deshabilitado
  },
  {
    "olimorris/codecompanion.nvim",
    enabled = false, -- Plugin deshabilitado
  },
  {
    "tris203/precognition.nvim",
    enabled = false, -- Plugin deshabilitado
  },
  {
    "greggh/claude-code.nvim",
    enabled = false, -- Integración con Claude Code AI deshabilitada
  },
}
