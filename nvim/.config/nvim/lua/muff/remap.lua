vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Moving line around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {})
vim.keymap.set("i", "<C-j>", "<esc>:m .+1<CR>==", {})
vim.keymap.set("i", "<C-k>", "<esc>:m .-2<CR>==", {})
vim.keymap.set("n", "<leader>j", ":m .+1<CR>==", {})
vim.keymap.set("n", "<leader>k", ":m .-2<CR>==", {})

-- Paste without erasing current clipboard
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Yank into system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Delete and not putting it in vim clipboard
vim.keymap.set("n", "<leader>d", "\"_dP")
vim.keymap.set("v", "<leader>d", "\"_dP")
vim.keymap.set("n", "<leader>D", "\"_dP")

--tmux sessionizer (The Primeagen)
vim.keymap.set("n", "<C-f>", ":silent !tmux neww tmux-sessionizer<cr>", {})

--Subsitute
vim.keymap.set("n", "<leader>r",":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>", {})

-- Make file executable
vim.keymap.set("n", "<leader>x","<cmd>!chmod +x %<CR>", {silent = true})

-- switch pane with Ctrl + (hjkl)
-- vim.keymap.set("n", "<C-j>", "<C-W><C-J>")
-- vim.keymap.set("n", "<C-k>", "<C-W><C-K>")
-- vim.keymap.set("n", "<C-l>", "<C-W><C-L>")
-- vim.keymap.set("n", "<C-h>", "<C-W><C-H>")

