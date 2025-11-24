-- ──────────────────────────────────────────────────────────────────────────────
-- fzf-lua
-- ------------------------------------------------------------------------------
-- Plugin que ofrece una interfaz rápida y altamente configurable para búsquedas
-- utilizando FZF, pero implementado completamente en Lua. Permite buscar archivos,
-- buffers, símbolos, líneas, comandos y más, con una experiencia fluida dentro
-- de Neovim.
--
-- FUNCIONALIDAD:
--   • Búsqueda rápida de archivos, contenido, buffers y comandos.
--   • Integración con LSP para buscar símbolos, referencias y definiciones.
--   • Vista previa integrada y configurable.
--   • Implementación en Lua — evita dependencias externas como fzf binario.
--
-- CONFIGURACIÓN:
--   dependencies → Iconos opcionales mediante 'nvim-web-devicons'.
--   opts         → Tabla de opciones para personalizar la interfaz y los pickers.
--                  (Vacío por defecto, usa los valores predeterminados del plugin.)
--

return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
}
