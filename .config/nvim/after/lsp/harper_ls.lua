--- @type vim.lsp.Config
return {
  -- harpar は現時点でだいたいの言語ではコメント内しかスペルチェックしてくれないらしい
  -- あと厳しすぎるのでプログラミング言語ではオフにしておく
  filetypes = { 'markdown', 'gitcommit' },
  settings = {
    ['harper-ls'] = {
      -- mac だとパスが違うので明示的に指定する
      userDictPath = '~/.config/harper-ls/dictionary.txt',
    },
  },
}
