local hints = {
  includeInlayParameterNameHints = "all", -- "none" | "literals" | "all"
  includeInlayParameterNameHintsWhenArgumentMatchesName = false,
  includeInlayFunctionParameterTypeHints = true,
  includeInlayVariableTypeHints = true,
  includeInlayVariableTypeHintsWhenTypeMatchesName = false,
  includeInlayPropertyDeclarationTypeHints = true,
  includeInlayFunctionLikeReturnTypeHints = true,
  includeInlayEnumMemberValueHints = true,
}

--- @type vim.lsp.Config
return {
  settings = {
    typescript = { inlayHints = hints },
    javascript = { inlayHints = hints },
  },
  on_attach = function(client, _bufnr)
    -- format は biome とかでやるのでオフにしておく
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
}
