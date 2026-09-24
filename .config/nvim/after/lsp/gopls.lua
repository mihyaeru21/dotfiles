--- @type vim.lsp.Config
return {
  settings = {
    gopls = {
      -- staticcheck = true, -- TODO: あとで有効化したい
      semanticTokens = true,
    },
  },
}
