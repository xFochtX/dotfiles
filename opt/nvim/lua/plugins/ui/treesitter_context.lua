-- ──────────────────────────────────────────────────────────────────────────────
-- nvim-treesitter-context
-- ------------------------------------------------------------------------------
-- Este plugin muestra en la parte superior de la ventana el "contexto" del código
-- actual según Treesitter. Por ejemplo, si estás dentro de una función, clase o
-- bloque y haces scroll hacia abajo, este plugin mantiene visible una o varias
-- líneas superiores indicando en qué estructura estás.
--
-- Ejemplo visual:
--   def my_function(param):
--       class Something:
--           ...
--   ───────────────────────────────────────────────  ← contexto mostrado arriba
--
-- CONFIGURACIÓN:
--   enable      → Activa o desactiva el plugin.
--   max_lines   → Cantidad máxima de líneas de contexto a mostrar.
--   trim_scope  → Cómo reducir el nivel de anidación cuando hay demasiados
--                 (por ejemplo, eliminar niveles externos primero).
--   mode        → Fuente del contexto: "cursor" usa el nodo bajo el cursor.
--
-- Solo dibuja una barra superior visual con el contexto del código,
-- sin modificar el contenido ni cómo se visualizan las líneas largas.
-- ──────────────────────────────────────────────────────────────────────────────

return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup({
        enable = true,
        max_lines = 0,
        trim_scope = "outer",
        mode = "cursor",
      })
    end,
  },
}
