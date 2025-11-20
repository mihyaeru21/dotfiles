--- @type vim.lsp.Config
return {
  -- プロジェクトに sorbet/config がある場合（設定されている場合）のみ起動する
  root_dir = function(bufnr, on_dir)
    local root_dir = require('lspconfig').util.root_pattern('Gemfile', '.git')(bufnr)
    if root_dir == nil then
      return
    end
    local sorbet_config = root_dir .. '/sorbet/config'
    local config_exists = vim.fn.filereadable(sorbet_config) == 1
    if config_exists then
      on_dir(root_dir)
    end
  end,
}
