return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Optimise loading with lua
    use "lewis6991/impatient.nvim"

    -- LSP feature and extensions
    use {
        'neovim/nvim-lspconfig',
        'onsails/lspkind-nvim',
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        'nvim-lua/lsp-status.nvim',
        'tjdevries/lsp_extensions.nvim',
        'jose-elias-alvarez/null-ls.nvim'
    }

    -- Completion {{
    use 'hrsh7th/nvim-cmp'      -- Completion
    use 'hrsh7th/cmp-nvim-lsp'  -- LSP sources
    use 'hrsh7th/cmp-buffer'    -- Buffer source
    use 'hrsh7th/cmp-path'      -- Path source
    use 'hrsh7th/cmp-cmdline'   -- Cmdline source

    --Copilot
    -- use 'github/copilot.vim'

    --Snippet support:
    --LuaSnip
    use 'L3MON4D3/LuaSnip'
    use "rafamadriz/friendly-snippets"
    use 'saadparwaiz1/cmp_luasnip'
    -- }}

    -- Language specific plugins {{
    use {
        'mfussenegger/nvim-jdtls',          -- java
        'tjdevries/nlua.nvim',              -- lua dev for nvim
        'junegunn/goyo.vim',                -- (markdown) Distraction free mode
        'Hoffs/omnisharp-extended-lsp.nvim',
        'brgmnn/vim-opencl'
    }
    use 'BeneCollyridam/futhark-vim'


    -- Useful functions
    use 'nvim-lua/plenary.nvim'

    -- Worflow and cool tools {{
    use 'mg979/vim-visual-multi'
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })


    -- Really cool fuzzy finder (telescope)
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    -- More telescope extensions:
    --use { "nvim-telescope/telescope-fzy-native.nvim" }
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    use { "nvim-telescope/telescope-file-browser.nvim" }


    use 'christoomey/vim-tmux-navigator'  -- tmux movements in nvim
    -- use {'knubie/vim-kitty-navigator', run = "cp ./*.py ~/.config/kitty/" }
    -- use 'preservim/nerdtree'    -- tree for visualizing files

    --Text manipulation
    use "godlygeek/tabular" -- Quickly align text by pattern
    --use "tpope/vim-repeat" -- Repeat actions better
    --use "tpope/vim-abolish" -- Cool things with words!
    --use "tpope/vim-characterize"
    --
    --
    use {
      'chipsenkbeil/distant.nvim',
      config = function()
        require('distant').setup {
          -- Applies Chip's personal settings to every machine you connect to
          --
          -- 1. Ensures that distant servers terminate with no connections
          -- 2. Provides navigation bindings for remote directories
          -- 3. Provides keybinding to jump into a remote file's parent directory
          ['*'] = require('distant.settings').chip_default()
        }
      end
    }
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
    use "airblade/vim-gitgutter"

    -- }}

    -- Highlighting
    use 'elzr/vim-json'
    use 'octol/vim-cpp-enhanced-highlight'

    -- Treesitter
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/playground'

    -- UI {{
    -- use 'glepnir/lspsaga.nvim'           -- UI for Lsp config
    use "nvim-lua/popup.nvim"
    use "rcarriga/nvim-notify"              -- Fancy Notification UI
    use 'j-hui/fidget.nvim'                 -- UI showing loading of lsp servers
    use 'mhinz/vim-startify'
    use 'kyazdani42/nvim-web-devicons'      -- Dev icon
    use 'shaunsingh/nord.nvim'              -- Nord theme
    use 'overcache/NeoSolarized'            -- Solarized theme
    use 'morhetz/gruvbox'                   -- Gruvbox theme
    use 'jacoborus/tender.vim'
    -- use 'EdenEast/nightfox.nvim'
    use "rebelot/kanagawa.nvim"
    use "EdenEast/nightfox.nvim" -- Packer
    use 'sainnhe/gruvbox-material'
    use 'ishan9299/modus-theme-vim'
    use 'Shatur/neovim-ayu'
    use ({ 'projekt0n/github-nvim-theme' })
    use {
        "mcchrish/zenbones.nvim",
        -- Optionally install Lush. Allows for more configuration or extending the colorscheme
        -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
        -- In Vim, compat mode is turned on as Lush only works in Neovim.
        requires = "rktjmp/lush.nvim"
    }
    --use 'morhetz/gruvbox'
    use 'folke/tokyonight.nvim'
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    use 'numToStr/Sakura.nvim'
    use({
            'nvim-lualine/lualine.nvim',
            requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })
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


    --Java
    use 'vim-test/vim-test'

end)
