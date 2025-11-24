-- ──────────────────────────────────────────────────────────────────────────────
-- nvim-rip-substitute
-- ------------------------------------------------------------------------------
-- Plugin que permite realizar sustituciones en archivos usando ripgrep desde
-- Neovim. Facilita reemplazos rápidos en el buffer actual o en múltiples archivos,
-- con soporte para previsualización y confirmación de cambios.
--
-- FUNCIONALIDAD:
--   • Sustituciones rápidas usando la potencia de ripgrep.
--   • Compatible con buffers individuales o rangos visuales.
--   • Previsualización de resultados antes de confirmar cambios.
--   • Integración con keymaps para disparar la función desde Neovim.
--
-- CONFIGURACIÓN:
--   cmd   → Comando para invocar el plugin manualmente (:RipSubstitute).
--   keys  → Atajos para ejecutar sustituciones:
--             <leader>fs → Ejecuta la función de sustitución en modo normal o visual.
--   mode  → Define en qué modos están activos los keymaps ("n" y "x").
--   desc  → Descripción de la acción asociada al keymap.
--

return {
  "chrisgrieser/nvim-rip-substitute",

  cmd = "RipSubstitute",

  keys = {
    {
      "<leader>fs",
      function()
        require("rip-substitute").sub()
      end,
      mode = { "n", "x" },
      desc = " rip substitute",
    },
  },
}

