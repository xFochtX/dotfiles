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

    -- Agregar selección con Tab y Shift-Tab
    --opts.keymap = opts.keymap or {}
    --opts.keymap["<Tab>"] = { "select_next" }
    --opts.keymap["<S-Tab>"] = { "select_prev" }
  end,
}

