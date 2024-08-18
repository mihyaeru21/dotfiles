local M = {}

M.make_on_attach = function(lspconfig, cmp_nvim_lsp)
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
  lspconfig.util.default_config = vim.tbl_extend('force', lspconfig.util.default_config, {
    capabilities = capabilities,
  })

  local kmopts = { noremap = true, silent = true }
  vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', kmopts)
  vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', kmopts)
  vim.api.nvim_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.format { async = true }<CR>', kmopts)

  return function(_, bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', kmopts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', kmopts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', kmopts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', kmopts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', kmopts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', kmopts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', kmopts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl',
      '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', kmopts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', kmopts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', kmopts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', kmopts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', kmopts)
  end
end

return M
