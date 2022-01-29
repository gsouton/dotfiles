-- See (https://github.com/nanotee/nvim-lua-guide) for details
local options = vim.o
local indent = 4

-- map the leader to key to space
vim.g.mapleader = " "


-- Encoding
--options.encoding = "utf-8"

-- Tab options
options.tabstop = indent
options.softtabstop = indent
options.shiftwidth = indent
options.smarttab = true
options.expandtab = true
options.smartindent = true

-- .ditor/UI
options.relativenumber = true
options.number = true
options.termguicolors = true
options.background = "dark"
--options.cmdheight = 2 --Give more space for displaying messages

-- Workflow and specific vim optionstings
-- read doc :h `nohlsearch`
options.syntax = "on"
options.hlsearch  = false
options.incsearch = true
options.autoread = true
options.hidden   = true
options.errorbells = false
options.wrap = false
options.scrolloff = 8
options.showmode = false
--options.colorcolumn = "80"
options.signcolumn = "yes"
options.showcmd = false
options.path = options.path .. "**"
options.cot = "menu,menuone,noselect"
options.swapfile = false
--options nobackup
--options undodir=~/.vim/undodir
options.undofile  = true
options.filetype = "on"
options.clipboard = "unnamedplus"


-- Having longer updatetime (default is 4000 ms = 4s) leads to to noticeable
-- delays and poor user experience.
options.updatetime = 100

-- File to ignore

vim.cmd [[augroup highlight_yank]]
vim.cmd [[autocmd!]]
vim.cmd [[autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 90})]]
vim.cmd [[augroup END]]


-- vim.cmd [[augroup filetypedetect]]
-- vim.cmd [[au! BufRead, BufNewFile *.alt setfiletype altarica]]
-- vim.cmd [[augroup END]]
--
-- vim.cmd [[au Syntax altarica so ~/.config/nvim/syntax/altarica.vim]]

