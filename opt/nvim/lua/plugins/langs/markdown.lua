-- ──────────────────────────────────────────────────────────────────────────────
-- render-markdown.nvim
-- ------------------------------------------------------------------------------
-- Plugin que mejora la visualización de archivos Markdown en Neovim. Permite
-- mostrar encabezados, listas y bullets con estilo visual y signos personalizados,
-- facilitando la lectura y edición de notas o documentación.
--
-- FUNCIONALIDAD:
--   • Mejora visual de encabezados con iconos y estilos configurables.
--   • Soporte para listas y bullets personalizadas con padding y resaltado.
--   • Compatible con treesitter para un análisis más preciso de Markdown.
--   • Integración opcional con mini.nvim para funcionalidad extendida.
--
-- CONFIGURACIÓN:
--   opts.heading.enabled    → Activa o desactiva la visualización de encabezados.
--   opts.heading.sign       → Muestra un signo al lado del encabezado.
--   opts.heading.style      → Tipo de estilo para los encabezados ("full", etc.).
--   opts.heading.icons      → Iconos utilizados para cada nivel de encabezado.
--   opts.heading.left_pad   → Espacio a la izquierda del encabezado.
--   opts.bullet.enabled     → Activa o desactiva los bullets personalizados.
--   opts.bullet.icons       → Iconos usados para los bullets de lista.
--   opts.bullet.right_pad   → Espacio a la derecha del bullet.
--   opts.bullet.highlight   → Grupo de resaltado para los bullets.
--

return {
  "MeanderingProgrammer/render-markdown.nvim",

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-mini/mini.nvim",
  },

  opts = {
    heading = {
      enabled = true,
      sign = true,
      style = "full",
      icons = { "① ", "② ", "③ ", "④ ", "⑤ ", "⑥ " },
      left_pad = 1,
    },
    bullet = {
      enabled = true,
      icons = { "●", "○", "◆", "◇" },
      right_pad = 1,
      highlight = "render-markdownBullet",
    },
  },
}
