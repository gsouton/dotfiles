-- Colorscheme persistence — survives nvim restarts.
-- Stores the picked scheme name in stdpath('data')/colorscheme.
do
  local file = vim.fn.stdpath('data') .. '/colorscheme'
  local startup_done = false

  -- Restore on startup (after every colorscheme plugin is on rtp), then
  -- flip the gate so subsequent ColorScheme events get persisted.
  vim.api.nvim_create_autocmd('VimEnter', {
    group = vim.api.nvim_create_augroup('restore-colorscheme', { clear = true }),
    once = true,
    callback = function()
      local ok, saved = pcall(vim.fn.readfile, file)
      if ok and saved and saved[1] and saved[1] ~= vim.g.colors_name then
        pcall(vim.cmd.colorscheme, saved[1])
      end
      startup_done = true
    end,
  })

  -- Save on every change, but only after startup — otherwise the default
  -- colorscheme being applied at boot would clobber the user's saved choice.
  vim.api.nvim_create_autocmd('ColorScheme', {
    group = vim.api.nvim_create_augroup('persist-colorscheme', { clear = true }),
    callback = function()
      if not startup_done then return end
      pcall(vim.fn.writefile, { vim.g.colors_name }, file)
    end,
  })
end

return {
  -- Default colorscheme — loaded eagerly so it applies before other plugins draw.
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    lazy = false,
    config = function()
      require('tokyonight').setup({
        styles = { comments = { italic = false } },
      })
      vim.cmd.colorscheme('tokyonight-night')
    end,
  },

  -- Alternative colorschemes — must be on runtimepath at startup so the
  -- Telescope colorscheme picker sees them. They don't auto-activate; only
  -- the priority-1000 default above runs `vim.cmd.colorscheme(...)`.
  { 'catppuccin/nvim',         name = 'catppuccin', lazy = false, priority = 100 },
  { 'rebelot/kanagawa.nvim',                        lazy = false, priority = 100 },
  { 'rose-pine/neovim',        name = 'rose-pine',  lazy = false, priority = 100 },
  { 'ellisonleao/gruvbox.nvim',                     lazy = false, priority = 100 },

  -- Keymap hints
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
      delay = 0,
      icons = {
        mappings = vim.g.have_nerd_font,
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ', Down = '<Down> ', Left = '<Left> ', Right = '<Right> ',
          C = '<C-…> ', M = '<M-…> ', D = '<D-…> ', S = '<S-…> ',
          CR = '<CR> ', Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ', ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ', BS = '<BS> ', Space = '<Space> ', Tab = '<Tab> ',
          F1 = '<F1>', F2 = '<F2>', F3 = '<F3>', F4 = '<F4>',
          F5 = '<F5>', F6 = '<F6>', F7 = '<F7>', F8 = '<F8>',
          F9 = '<F9>', F10 = '<F10>', F11 = '<F11>', F12 = '<F12>',
        },
      },
      spec = {
        { '<leader>c', group = '[C]ode',      mode = { 'n', 'x' } },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      },
    },
  },

  -- mini.nvim: small, focused modules (ai textobjects, surround, statusline)
  {
    'nvim-mini/mini.nvim',
    config = function()
      require('mini.ai').setup({ n_lines = 500 })
      require('mini.surround').setup()

      local statusline = require('mini.statusline')
      statusline.setup({ use_icons = vim.g.have_nerd_font })
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function() return '%2l:%-2v' end
    end,
  },

  -- snacks.nvim: opt-in QoL modules
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      bigfile  = { enabled = true },
      lazygit  = { enabled = true },
      notifier = { enabled = true },
    },
    keys = {
      { '<leader>gg', function() Snacks.lazygit() end, desc = 'LazyGit' },
    },
  },
}
