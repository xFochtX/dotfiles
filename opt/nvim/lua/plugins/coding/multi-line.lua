-- ──────────────────────────────────────────────────────────────────────────────
-- vim-multiple-cursors
-- ------------------------------------------------------------------------------
-- Plugin que permite usar múltiples cursores en Vim/Neovim, facilitando la
-- edición simultánea de varias líneas o palabras. Ideal para reemplazos masivos
-- o modificaciones repetitivas en varias ubicaciones del buffer.
--
-- FUNCIONALIDAD:
--   • Añade cursores adicionales para editar múltiples partes del texto al mismo tiempo.
--   • Compatible con movimientos, búsqueda y sustituciones simultáneas.
--   • Facilita refactorizaciones rápidas o edición en paralelo.
--   • Integración con atajos de teclado para iniciar, añadir y quitar cursores.
--
-- CONFIGURACIÓN:
--   No requiere configuración básica para funcionar.
--   Se puede personalizar mediante keymaps según preferencias del usuario.
--

return {
  {
    "terryma/vim-multiple-cursors",
  },
}
