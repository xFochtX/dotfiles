-- ──────────────────────────────────────────────────────────────────────────────
-- screenkey.nvim
-- ------------------------------------------------------------------------------
-- Plugin que muestra en pantalla las teclas que el usuario presiona en tiempo
-- real. Es útil para grabaciones, presentaciones, transmisiones o tutoriales,
-- permitiendo que otros vean qué combinaciones se están usando mientras trabajas.
--
-- FUNCIONALIDAD:
--   • Muestra teclas pulsadas en una ventana flotante.
--   • Captura combinaciones, teclas modificadoras y secuencias rápidas.
--   • Permite configurarse para presentaciones, screencasts o debugging de atajos.
--   • Su interfaz es ligera y está integrada completamente en Neovim.
--
-- CONFIGURACIÓN:
--   lazy      → false indica que el plugin carga inmediatamente.
--   version   → "*" usa la versión más reciente etiquetada.
--                Opción: branch = "dev" para usar el último commit disponible.
--

return {
  "NStefan002/screenkey.nvim",
  lazy = false,
  version = "*", -- or branch = "dev", to use the latest commit
}
