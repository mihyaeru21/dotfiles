require('config.lazy')
require('config.general')
require('config.mapping')
require('config.osc52')

if vim.g.neovide then
  require('config.neovide')
end

local path = vim.fn.expand('~/dotfiles/local/nvim.lua')
if vim.uv.fs_stat(path) then
  dofile(path)
end
