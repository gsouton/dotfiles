-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Open explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Moving line around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {})
vim.keymap.set("i", "<C-j>", "<esc>:m .+1<CR>==", {})
vim.keymap.set("i", "<C-k>", "<esc>:m .-2<CR>==", {})
vim.keymap.set("n", "<leader>j", ":m .+1<CR>==", {})
vim.keymap.set("n", "<leader>k", ":m .-2<CR>==", {})

-- Paste without erasing current clipboard
vim.keymap.set("x", "<leader>p", '"_dP')

-- Yank into system clipboard
-- vim.keymap.set("n", "<leader>y", "\"+y")
-- vim.keymap.set("v", "<leader>y", "\"+y")
-- vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Delete and not putting it in vim clipboard
-- vim.keymap.set("n", "<leader>d", "\"_dP")
-- vim.keymap.set("v", "<leader>d", "\"_dP")
-- vim.keymap.set("n", "<leader>D", "\"_dP")

--tmux sessionizer (The Primeagen)
vim.keymap.set("n", "<C-f>", ":silent !tmux neww tmux-sessionizer<cr>", {})

--Subsitute
vim.keymap.set("n", "<leader>r", ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>", {})

-- Make file executable
-- vim.keymap.set("n", "<leader>x","<cmd>!chmod +x %<CR>", {silent = true})

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
