-- ──────────────────────────────────────────────────────────────────────────────
-- which-key.nvim
-- ------------------------------------------------------------------------------
-- Plugin que muestra un panel flotante con las posibles combinaciones de teclas
-- a medida que comienzas a escribir un atajo. Esto ayuda a descubrir y recordar
-- mapeos sin necesidad de memorizar todo.
--
-- FUNCIONALIDAD:
--   • Muestra sugerencias de combinaciones según el prefijo que el usuario teclea.
--   • Agrupa y organiza atajos bajo nombres de categorías.
--   • Permite definir qué teclas disparan la apertura del panel.
--
-- CONFIGURACIÓN:
--   timeout     → Activa el tiempo de espera para detectar secuencias de teclas.
--   timeoutlen  → Tiempo (en ms) que espera Neovim antes de interpretar la secuencia.
--   <leader>?   → Abre el panel de which-key para el contexto local.
--   <leader>o   → Define un grupo de atajos bajo la categoría "Obsidian".
--

return {
  {
    "folke/which-key.nvim",

    event = "VeryLazy",

    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,

    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
      },
      {
        "<leader>o",
        group = "Obsidian",
      },
    },
  },
}
