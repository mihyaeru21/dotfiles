--- @type vim.lsp.Config
return {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
        unusedLocalExclude = { '_*' },
      },
      format = {
        enable = false, -- stylua に任せる
      },
    },
  },
}
