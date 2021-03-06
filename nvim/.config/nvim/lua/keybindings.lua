local map = vim.api.nvim_set_keymap
-- LOL STILL USING ARROWS?
map("n", "<Up>", "<Nop>", {})
map("n", "<Down>", "<Nop>", {})
map("n", "<Left>", "<Nop>", {})
map("n", "<Right>", "<Nop>", {})

map("i", "<Up>", "<Nop>", {})
map("i", "<Down>", "<Nop>", {})
map("i", "<Left>", "<Nop>", {})
map("i", "<Right>", "<Nop>", {})

-------------------------------------
---  Must have remap ---
-------------------------------------

-- make `Y` copy the rest of the line like `D` or `C`
map("n", "Y", "y$", {})

-- Undo break points
map("i", ".", ".<c-g>u", {})
map("i", ",", ",<c-g>u", {})
map("i", "!", "!<c-g>u", {})
map("i", "?", "?<c-g>u", {})

-- Moving line around
map("v", "J", ":m '>+1<CR>gv=gv", {})
map("v", "K", ":m '<-2<CR>gv=gv", {})
map("i", "<C-j>", "<esc>:m .+1<CR>==", {})
map("i", "<C-k>", "<esc>:m .-2<CR>==", {})
map("n", "<leader>j", ":m .+1<CR>==", {})
map("n", "<leader>k", ":m .-2<CR>==", {})

--Subsitute
map("n", "<leader>r",":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>", {})

--- change Buffer
map("n", "<leader>bh", ":bprevious<CR>", {})
map("n", "<leader>bl", ":bnext<CR>", {})
map("n", "<leader>bq", ":bdelete<CR>", {})


--- Tab
map("n", "<leader>t", ":tabnew<CR>", {})
map("n", "<leader>tc", ":tabclose<CR>", {})
map("n", "<leader>tl", ":tabn<CR>", {})
map("n", "<leader>th", ":tabp<CR>", {})

--- move paragraph Cannot work with tmux movements
-- map("n", "<C-j>", "}",{})
-- map("n", "<C-k>", "{",{})

-- NerdTree
--vim.api.nvim_set_keymap("n", "<Leader>t", ":NERDTreeFocus<CR>", {})

-- Disable colorcolumn
--vim.api.nvim_set_keymap("n", "<Leader>0", ":set colorcolumn=0<CR>", {})


--Rose-pine
---- Toggle variants
-- map('n', '<c-m>', [[<cmd>lua require('rose-pine').toggle()<cr>]], { noremap = true, silent = true })

-- Set variant
-- vim.api.nvim_set_keymap('n', '<c-0>', [[<cmd>lua require('rose-pine').set('main')<cr>]], { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<c-9>', [[<cmd>lua require('rose-pine').set('moon')<cr>]], { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<c-8>', [[<cmd>lua require('rose-pine').set('dawn')<cr>]], { noremap = true, silent = true })


--tmux sessionizer (The Primeagen)
map("n", "<C-f>", ":silent !tmux neww tmux-sessionizer<cr>", {})

-- Resize
-- map("n" ,"<+>",  ":vertical resize +1<CR>", {})
-- map("n" ,"<->",  ":vertical resize -1<CR>", {})
--
-- map("n" ,"<Up>",  ":resize +1<CR>", {})
-- map("n" ,"<Down>",  ":resize -1<CR>", {})

-- LazyGit
map("n", "<leader>gl", ":LazyGit<CR>", {})


vim.api.nvim_set_keymap('i', '<C-;>', 'copilot#Accept("<CR>")', {expr=true, silent=true})
