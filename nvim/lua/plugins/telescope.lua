require('telescope').setup {
    defaults = {
        prompt_prefix = "> ",
        selection_caret = "> ",
    },
}

require('telescope').load_extension('fzf')
require("telescope").load_extension("file_browser")


local map = function(key, option)
    local rhs = string.format("<cmd>lua require('telescope.builtin').%s()<CR>", option)
    local map_options = {
        noremap = true,
        silent = true,
    }
    vim.api.nvim_set_keymap('n', key, rhs, map_options)
end

local map_extension = function(key, option)
    local rhs = string.format(":Telescope %s<CR>", option)
    local map_options = {
        noremap = true,
        silent = true,
    }
    vim.api.nvim_set_keymap('n', key, rhs, map_options)
end

-- Telescope mappings
--map('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<CR>", {})
--map('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<CR>", {})
--map('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<CR>", {})
--map('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<CR>", {})


-- Files
map("<leader>ft", "git_files")                   -- search trough git files
map("<leader>fo", "oldfiles")                    -- search through old opened files
map("<leader>ff", "find_files")                  -- search through file in cwd
map("<leader>fg", "live_grep")                   -- search for words through file
map("<leader>fb", "buffers")
map_extension("<leader>b", "file_browser")
--map_tele("<space>fg", "multi_rg")
--


-- Git
map("<leader>gs", "git_status")
map("<leader>gc", "git_commits")
