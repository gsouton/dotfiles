-- Leader keys (must be set before plugins load)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if your terminal uses a Nerd Font
vim.g.have_nerd_font = false

-- UI
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.signcolumn = 'yes'
vim.o.scrolloff = 10
vim.o.colorcolumn = '80'
vim.o.termguicolors = true
vim.o.showmode = false
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Behavior
vim.o.mouse = 'a'
vim.o.breakindent = true
vim.o.wrap = false
vim.o.confirm = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.inccommand = 'split'

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Files / undo
vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true
vim.o.undodir = os.getenv('HOME') .. '/.vim/undodir'

-- Sync clipboard with OS (deferred for startup speed)
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Over SSH, fall back to OSC 52 escape sequences for clipboard.
-- The terminal emulator (MobaXterm/iTerm/kitty/wezterm/etc.) intercepts the
-- sequences and writes to the *local* OS clipboard. No xclip/pbcopy on the
-- remote needed. Local sessions keep using the native tools detected above.
if vim.env.SSH_TTY then
  vim.g.clipboard = {
    name = 'OSC 52',
    copy = {
      ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
      ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
    },
    paste = {
      ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
      ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
    },
  }
end
