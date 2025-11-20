--- @type vim.lsp.Config
return {
  settings = {
    Lua = {
      diagnostics = {
        unusedLocalExclude = { '_*' }
      }
    },
  },
}
