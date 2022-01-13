-- LOL STILL USING ARROWS?
vim.api.nvim_set_keymap("n", "<Up>", "<Nop>", {})
vim.api.nvim_set_keymap("n", "<Down>", "<Nop>", {})
vim.api.nvim_set_keymap("n", "<Left>", "<Nop>", {})
vim.api.nvim_set_keymap("n", "<Right>", "<Nop>", {})

vim.api.nvim_set_keymap("i", "<Up>", "<Nop>", {})
vim.api.nvim_set_keymap("i", "<Down>", "<Nop>", {})
vim.api.nvim_set_keymap("i", "<Left>", "<Nop>", {})
vim.api.nvim_set_keymap("i", "<Right>", "<Nop>", {})



-- NerdTree
vim.api.nvim_set_keymap("n", "<Leader>t", ":NERDTreeFocus<CR>", {})

-- Disable colorcolumn
--vim.api.nvim_set_keymap("n", "<Leader>0", ":set colorcolumn=0<CR>", {})


--Rose-pine
---- Toggle variants
vim.api.nvim_set_keymap('n', '<c-m>', [[<cmd>lua require('rose-pine').toggle()<cr>]], { noremap = true, silent = true })

-- Set variant
--vim.api.nvim_set_keymap('n', '<c-0>', [[<cmd>lua require('rose-pine').set('main')<cr>]], { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<c-9>', [[<cmd>lua require('rose-pine').set('moon')<cr>]], { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<c-8>', [[<cmd>lua require('rose-pine').set('dawn')<cr>]], { noremap = true, silent = true })
