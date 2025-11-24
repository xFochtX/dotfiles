-- ──────────────────────────────────────────────────────────────────────────────
-- nvim-colorizer.lua
-- ------------------------------------------------------------------------------
-- Plugin que resalta colores directamente en el buffer mostrando su valor real
-- (por ejemplo, #RRGGBB, rgb(), etc.). Esto permite visualizar colores inline
-- mientras editas archivos de configuración, CSS, Lua, Markdown y otros.
--
-- FUNCIONALIDAD:
--   • Detección automática de códigos de color en múltiples formatos.
--   • Representación visual mediante color de fondo o texto.
--   • Configuración por tipo de archivo o global.
--
-- CONFIGURACIÓN:
--   filetypes           → Lista de tipos de archivo en los que se aplicará.
--   RGB                 → Habilita soporte para colores del tipo rgb(…).
--   RRGGBB              → Habilita colores hexadecimales estándar (#RRGGBB).
--   RRGGBBAA            → Habilita colores hex con canal alfa (#RRGGBBAA).
--   names               → Habilita nombres CSS como 'red', 'blue', etc.
--   css                 → Activa funciones extendidas para CSS.
--   mode                → Modo de visualización ("background", "foreground", etc.).
--

return {
  "catgoose/nvim-colorizer.lua",

  opts = {
    filetypes = { "*" },
    user_default_options = {
      RGB = true,
      RRGGBB = true,
      names = false,
      css = false,
      RRGGBBAA = true,
      mode = "background",
    },
  },

  config = function(_, opts)
    require("colorizer").setup(
      opts.filetypes,
      opts.user_default_options
    )
  end,
}
