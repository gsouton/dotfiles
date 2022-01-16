local fn = vim.fn -- retrieve vim functions
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim" -- install path for packer


-- check if install path is empty
-- if it is install packer
if fn.empty(fn.glob(install_path)) > 0 then
	print("Installing packer...")
	fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	print("Installed packer!")
end

local color_theme = vim.g.colorscheme --retrieve current colorscheme

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Optimise loading with lua
    use "lewis6991/impatient.nvim"
    -- LSP feature and extensions
    use {
        'neovim/nvim-lspconfig',
        'williamboman/nvim-lsp-installer',
        'onsails/lspkind-nvim',
        'nvim-lua/lsp-status.nvim',
        'tjdevries/lsp_extensions.nvim'
    }

    -- Completion {{
    use 'hrsh7th/nvim-cmp'      -- Completion
    use 'hrsh7th/cmp-nvim-lsp'  -- LSP sources
    use 'hrsh7th/cmp-buffer'    -- Buffer source
    use 'hrsh7th/cmp-path'      -- Path source
    use 'hrsh7th/cmp-cmdline'   -- Cmdline source

    --Snippet support:
    --LuaSnip
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    -- }}

    -- Language specific plugins {{
    use {
        'mfussenegger/nvim-jdtls',          -- java
        'tjdevries/nlua.nvim',              -- lua dev for nvim
        'junegunn/goyo.vim',                -- (markdown) Distraction free mode
        'iamcco/markdown-preview.nvim',     -- (markdown) Previem mode
        'Hoffs/omnisharp-extended-lsp.nvim'
    }

    -- Useful functions
    use 'nvim-lua/plenary.nvim'

    -- Worflow and cool tools {{

    -- fuzzy finder (telescope)
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    -- More telescope extensions:
    --use { "nvim-telescope/telescope-fzy-native.nvim" }
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    use { "nvim-telescope/telescope-file-browser.nvim" }

    use 'christoomey/vim-tmux-navigator'  -- tmux movements in nvim
    use 'preservim/nerdtree'    -- tree for visualizing files

    --Text manipulation
    use "godlygeek/tabular" -- Quickly align text by pattern
    --use "tpope/vim-repeat" -- Repeat actions better
    --use "tpope/vim-abolish" -- Cool things with words!
    --use "tpope/vim-characterize"

    -- }}


    -- Git {{
    use 'tpope/vim-fugitive'
    use 'kdheepak/lazygit.nvim'
    use {
      'lewis6991/gitsigns.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      },
      config = function()
        require('gitsigns').setup()
      end
    }
    use "rhysd/git-messenger.vim"
    -- }}

    -- Highlighting
    use 'elzr/vim-json'
    use 'octol/vim-cpp-enhanced-highlight'

    -- Treesitter
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/playground'

    -- UI {{
    use 'mhinz/vim-startify'
    use 'kyazdani42/nvim-web-devicons'      -- Dev icon
    use 'shaunsingh/nord.nvim'              -- Nord theme
    use 'overcache/NeoSolarized'            -- Solarized theme
    use 'gruvbox-community/gruvbox'         -- Gruvbox theme
    use({
    'rose-pine/neovim',
    as = 'rose-pine',
    tag = 'v0.1.0', -- Optional tag release
    })
    use 'glepnir/lspsaga.nvim'
    use {
        'nvim-lualine/lualine.nvim',
        config = function()
            require("lualine").setup({
                options = { theme = color_theme }
            })
        end,
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    }
    use 'sbdchd/neoformat'
    -- }}

    -- Comment auto
    use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
    }

    -- Benchmark
    use {
      "dstein64/vim-startuptime",
      cmd = "StartupTime",
    }

end)
