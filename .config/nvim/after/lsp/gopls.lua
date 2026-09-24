--- @type vim.lsp.Config
return {
  settings = {
    gopls = {
      -- staticcheck = true, -- TODO: あとで有効化したい
      semanticTokens = true,
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
}
