return {
  "snacks.nvim",
  opts = function(_, opts)
    opts.scope = opts.scope or {}
    opts.scope.treesitter = opts.scope.treesitter or {}
    local blocks = opts.scope.treesitter.blocks
    if type(blocks) == "table" then
      blocks.enabled = true
      -- Agregar nodos de Python que no están en la lista por defecto
      for _, node in ipairs({ "try_statement", "except_clause", "with_statement", "match_statement" }) do
        if not vim.tbl_contains(blocks, node) then
          table.insert(blocks, node)
        end
      end
    else
      opts.scope.treesitter.blocks = {
        enabled = true,
        "function_declaration",
        "function_definition",
        "method_declaration",
        "method_definition",
        "class_declaration",
        "class_definition",
        "do_statement",
        "while_statement",
        "repeat_statement",
        "if_statement",
        "for_statement",
        "try_statement",
        "except_clause",
        "with_statement",
        "match_statement",
      }
    end
  end,
}
