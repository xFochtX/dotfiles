-- ──────────────────────────────────────────────────────────────────────────────
-- blink.cmp
-- ------------------------------------------------------------------------------
-- Plugin que mejora la experiencia de autocompletado en Neovim, ofreciendo
-- texto fantasma ("ghost text") y control más fino sobre la selección de
-- sugerencias.
--
-- FUNCIONALIDAD:
--   • Texto fantasma (ghost text) para previsualizar la sugerencia seleccionada.
--   • Desactiva la preselección automática de la primera recomendación.
--   • Opcional: permite navegar entre las sugerencias con Tab y Shift-Tab.
--   • Integración con sistemas de autocompletado existentes.
--
-- CONFIGURACIÓN:
--   opts.completion.list.selection.preselect → false para que la primera sugerencia no se seleccione automáticamente.
--   opts.completion.ghost_text.enabled       → true para activar el ghost text.
--   keymaps opcionales pueden asignarse a Tab/Shift-Tab para seleccionar la siguiente/anterior sugerencia.
--

---@diagnostic disable: missing-fields
return {
  "saghen/blink.cmp",

  opts = function(_, opts)
    -- Asegurarse que completion y ghost_text existen
    opts.completion = opts.completion or {}
    opts.completion.list = opts.completion.list or {}
    opts.completion.list.selection = opts.completion.list.selection or {}
    opts.completion.list.selection.preselect = false  -- primera recomendación no seleccionada

    opts.completion.ghost_text = opts.completion.ghost_text or {}
    opts.completion.ghost_text.enabled = true         -- activar texto fantasma

    -- Agregar selección con Tab y Shift-Tab (opcional)
    -- opts.keymap = opts.keymap or {}
    -- opts.keymap["<Tab>"] = { "select_next" }
    -- opts.keymap["<S-Tab>"] = { "select_prev" }
  end,
}
