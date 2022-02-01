-- See (https://github.com/nanotee/nvim-lua-guide) for details
local opt = vim.o
local indent = 4

-- map the leader to key to space
vim.g.mapleader = " " -- map globally that's why vim.g


-- Encoding
--options.encoding = "utf-8"

-- Tab options
opt.tabstop = indent
opt.softtabstop = indent
opt.shiftwidth = indent
opt.smarttab = true
opt.expandtab = true
opt.smartindent = true

-- editor/UI
opt.relativenumber = true
opt.number = true
opt.termguicolors = true
opt.background = "dark"
--options.cmdheight = 2 --Give more space for displaying messages

-- Workflow and specific vim optionstings
-- read doc i.e `:h nohlsearch`
opt.syntax = "on"
opt.hlsearch  = false
opt.incsearch = true
opt.autoread = true
opt.hidden   = true
opt.errorbells = false
opt.wrap = false
opt.scrolloff = 8
opt.showmode = false
opt.colorcolumn = "90"
opt.signcolumn = "yes"
opt.showcmd = false
opt.path = opt.path .. "**"
opt.cot = "menu,menuone,noselect"
opt.swapfile = false
--options nobackup
--options undodir=~/.vim/undodir
opt.undofile  = true
opt.filetype = "on"
opt.clipboard = "unnamedplus"


-- Having longer updatetime (default is 4000 ms = 4s) leads to to noticeable
-- delays and poor user experience.
opt.updatetime = 50

-- File to ignore
-- options.wildignore = options.wildignore .. "*.pyc"
-- options.wildignore = options.wildignore .. "*_build/*"
-- options.wildignore = options.wildignore .. "**/coverage/*"
-- options.wildignore = options.wildignore .. "**/node_modules/*"
-- options.wildignore = options.wildignore .. "**/android/*"
-- options.wildignore = options.wildignore .. "**/ios/*"
-- options.wildignore = options.wildignore .. "**/.git/*"

vim.cmd [[augroup highlight_yank]]
vim.cmd [[autocmd!]]
vim.cmd [[autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 90})]]
vim.cmd [[augroup END]]


vim.cmd [[au Syntax altarica so ~/.config/nvim/syntax/altarica.vim]]
