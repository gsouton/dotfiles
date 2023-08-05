local fb_actions = require "telescope".extensions.file_browser.actions
local actions = require "telescope.actions"

require("telescope").setup {
    defaults = {
        prompt_prefix = "❯ ",
        selection_caret = "❯ ",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        scroll_strategy = "cycle",
        color_devicons = true,
        mappings = {
            -- This is nicer when used with smart-history plugin.
            n = {
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-j>"] = actions.move_selection_next,
            },
            i = {
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-j>"] = actions.move_selection_next,
            },
        },
    },
    extensions = {
        file_browser = {
            mappings = {
                ["i"] = {
                -- your custom insert mode mappings
                    ["<C-e>"] = fb_actions.create,
                    ["<C-d>"] = fb_actions.remove,
                    ["<C-r>"] = fb_actions.rename,
                    -- ["<C-m>"] = fb_actions.move,
                },
                ["n"] = {
                -- your custom normal mode mappings
                    ["<C-e>"] = fb_actions.create,
                    ["<C-d>"] = fb_actions.remove,
                    ["<C-r>"] = fb_actions.rename,
                    -- ["<C-m>"] = fb_actions.move,
                },
            },
        },
    },
}

require("telescope").load_extension('fzf')
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
map("<leader>fg", "live_grep")                   -- search for words through all files
map("<leader>fb", "buffers")
map("<leader>fm", "man_pages")
map_extension("<leader>b", "file_browser")
--map_tele("<space>fg", "multi_rg")
--


-- Git
map("<leader>gs", "git_status")
map("<leader>gc", "git_commits")
