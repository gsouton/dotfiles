local function configure_one_dark()
  -- Lua
  require('onedark').setup {
    -- Main options --
    style = 'dark',               -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = true,           -- Show/hide background
    term_colors = true,           -- Change terminal color as per the selected theme style
    ending_tildes = false,        -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

    -- toggle theme style ---
    toggle_style_key = nil,                                                              -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
    toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }, -- List of styles to toggle between

    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
    code_style = {
      comments = 'italic',
      keywords = 'none',
      functions = 'none',
      strings = 'none',
      variables = 'none'
    },

    -- Lualine options --
    lualine = {
      transparent = false, -- lualine center bar transparency
    },

    -- Custom Highlights --
    colors = {},     -- Override default colors
    highlights = {}, -- Override highlight groups

    -- Plugins Config --
    diagnostics = {
      darker = true,     -- darker colors for diagnostic
      undercurl = true,  -- use undercurl instead of underline for diagnostics
      background = true, -- use background color for virtual text
    },
  }
end

local function configure_rose_pine()
  require('rose-pine').setup {
    disable_background = true
  }
end

local function configure_kanagawa()
  local colors = require('kanagawa').setup({
    compile = false,  -- enable compiling the colorscheme
    undercurl = true, -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = true,    -- do not set background color
    dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
    terminalColors = true, -- define vim.g.terminal_color_{0,17}
    colors = {             -- add/modify theme and palette colors
      palette = {},
      theme = { wave = {}, lotus = {}, dragon = {}, all = { ui = { bg_gutter = "none" } } },
    },

    -- Transparent Floating Windows
    overrides = function(colors)
      local theme = colors.theme
      return {
        ---- Making transparent floating windows
        -- NormalFloat = { bg = theme.ui.fg_dim },
        -- FloatBorder = { bg = theme.ui.fg_dim },
        -- FloatTitle = { bg = "none" },
        --
        -- Save an hlgroup with dark background and dimmed foreground
        -- so that you can use it where your still want darker windows.
        -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
        NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

        -- Popular plugins that open floats will link to NormalFloat by default;
        -- set their background accordingly if you wish to keep them dark and borderless
        LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
        MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },


        ---- Making telescope transparent
        TelescopeTitle = { fg = theme.ui.special, bold = true },

        TelescopePromptNormal = { bg = "none" },
        TelescopePromptBorder = { fg = "none", bg = "none" },

        TelescopeResultsNormal = { fg = "none", bg = "none" },
        TelescopeResultsBorder = { fg = "none", bg = "none" },

        TelescopePreviewNormal = { bg = "none" },
        TelescopePreviewBorder = { bg = "none", fg = "none" },

        ---- Darker pop up menu
        Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
        PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
        PmenuSbar = { bg = theme.ui.bg_m1 },
        PmenuThumb = { bg = theme.ui.bg_p2 },

      }
    end,


    theme = "wave",  -- Load "wave" theme when 'background' option is not set
    background = {   -- map the value of 'background' option to a theme
      dark = "wave", -- try "dragon" !
      light = "lotus"
    },
  })

  -- vim.api.nvim_create_autocmd("ColorScheme", {
  --   pattern = "kanagawa",
  --   callback = function()
  --     if colors == nil then
  --       vim.fn.system("alacritty_themes ~/.local/share/alacritty/dist/alacritty_kanagawa.yml")
  --     elseif colors.theme == "lotus" then
  --       vim.fn.system("alacritty_themes ~/.local/share/alacritty/dist/alacritty_kanagawa-light.yml")
  --     else
  --       vim.fn.system("alacritty_themes ~/.local/share/alacritty/dist/alacritty_kanagawa.yml")
  --     end
  --   end,
  -- })
end

local function configure_gruvbox()
  local colors = require('gruvbox').setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
      strings = true,
      comments = true,
      operators = false,
      folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "",  -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {},
    dim_inactive = false,
    transparent_mode = true,
  })
end

local function configure_tokio()
  local colors = require('tokyonight').setup({
    -- your configuration comes here
    -- or leave it empty to use the default settings
    style = "storm",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    light_style = "day",    -- The theme is used when the background is set to light
    transparent = true,     -- Enable this to disable setting the background color
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
    styles = {
      -- Style to be applied to different syntax groups
      -- Value is any valid attr-list value for `:help nvim_set_hl`
      comments = { italic = true },
      keywords = { italic = true },
      functions = {},
      variables = {},
      -- Background styles. Can be "dark", "transparent" or "normal"
      sidebars = "dark",              -- style for sidebars, see below
      floats = "dark",                -- style for floating windows
    },
    sidebars = { "qf", "help" },      -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
    day_brightness = 0.3,             -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
    hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
    dim_inactive = false,             -- dims inactive windows
    lualine_bold = false,             -- When `true`, section headers in the lualine theme will be bold

    --- You can override specific color groups to use other groups or a hex color
    --- function will be called with a ColorScheme table
    ---@param colors ColorScheme
    on_colors = function(colors) end,

    --- You can override specific highlights to use other groups or a hex color
    --- function will be called with a Highlights and ColorScheme table
    ---@param highlights Highlights
    ---@param colors ColorScheme
    on_highlights = function(highlights, colors) end,
  })
end

function ColorMyPencils(color)
  configure_one_dark()
  configure_kanagawa()
  configure_gruvbox()
  configure_tokio()
  color = color or "tokyonight-day"
  vim.cmd.colorscheme(color)

  -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})
end

ColorMyPencils("kanagawa")
