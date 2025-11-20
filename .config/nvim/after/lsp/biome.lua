--- @type vim.lsp.Config
return {
  -- プロジェクト内でインストールされているやつを使う
  cmd = { 'npx', 'biome', 'lsp-proxy' },
}
