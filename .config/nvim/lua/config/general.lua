vim.opt.encoding = 'utf-8'

vim.opt.backspace = 'indent,eol,start'
vim.opt.whichwrap = 'b,s,h,l,<,>,[,]'
vim.opt.textwidth = 0
vim.opt.tags:append('.git/tags') -- tagsを.git/tagsからも読む

vim.opt.autoindent    = true
vim.opt.smartindent   = true

vim.opt.hlsearch      = true
vim.opt.incsearch     = true

vim.opt.expandtab     = true
vim.opt.shiftwidth    = 4
vim.opt.tabstop       = 4
vim.opt.softtabstop   = 0

vim.opt.ignorecase    = true -- 検索語に大文字が無い場合は大文字小文字を無視
vim.opt.smartcase     = true -- 大文字が入ると大文字小文字を区別
vim.opt.shiftround    = true -- >とかを使った時にきれいな位置に合わせる

vim.opt.wildmenu      = true -- タブ補完の候補をステータスバーに表示
vim.opt.wildmode      = 'full'
vim.opt.history       = 1000
vim.opt.hidden        = true

vim.opt.showcmd       = true
vim.opt.showmode      = true
vim.opt.showmatch     = true
vim.opt.number        = true
vim.opt.scrolloff     = 0
vim.opt.cursorline    = true     -- これをsyntaxと一緒に有効にするとカーソル移動が激重になる場合がある
vim.opt.cmdheight     = 2
vim.opt.ambiwidth     = 'single' -- 一部の記号が小さくなるが罫線が半角になることで全体的に表示崩れが減る
vim.opt.laststatus    = 3
vim.opt.statusline    = '[%n]%m%r%f %= %w%y[%{&fenc}:%{&ff}][%l/%L,%c]'
vim.opt.inccommand    = 'split'
vim.opt.termguicolors = true
vim.opt.mouse         = '' -- dap で便利なので解禁...と思ったけどやっぱ邪魔なのでオフにする
vim.opt.list          = true
vim.opt.listchars     = {
  tab = '>-',
  trail = '_',
  extends = '>',
  precedes = '<',
  nbsp = '␣',
}

-- yank した部分を一時的にハイライトする
-- https://jdhao.github.io/2020/05/22/highlight_yank_region_nvim/
vim.api.nvim_create_augroup('highlight_yank', { clear = true })
vim.api.nvim_create_autocmd({ 'TextYankPost' }, {
  pattern = '*',
  group = 'highlight_yank',
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 500 }
  end,
})
