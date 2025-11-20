--- @type vim.lsp.Config
return {
  on_attach = function(client, _bufnr)
    -- format は biome とかでやるのでオフにしておく
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
}
