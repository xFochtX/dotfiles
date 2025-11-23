-- Desactivar formateo automático para Python
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Desactivar formateo automático para Python",
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.name == "pyright" or client.name == "ruff" then
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end
  end,
})
