local lsp_status = require('lsp-status')
lsp_status.register_progress()

require('lualine').setup {
  options = {
    --theme = color_theme,
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {
        {'filename', file_status = true},
    },
    -- lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_x = {"lsp_status.register_progress()", 'filetype', 'encoding', 'fileformat'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = {'quickfix', 'nvim-tree'}
}
-- local status = require("plugins.status")

