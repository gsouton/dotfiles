local utils = require('utils')
local theme = "kanagawa"



--- Gruvbox material settings ---
vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_disable_italic_comment = 1
vim.g.gruvbox_material_transparent_background = 1

--- Gruvbox Settings ---
vim.g.gruvbox_contrast_dark = "hard"
-- vim.g.gruvbox_italic = 1
vim.g.gruvbox_sign_column = "dark0_hard"
-- vim.g.gruvbox_invert_selection = 1
-- vim.g.gruvbox_hls_cursor = "yellow"
-- vim.g.gruvbox_invert_indent_guides = 1

--- Rose Pine settings ---
-- Matches terminal theme if unset
-- @usage 'main' | 'moon' | 'dawn'
vim.g.rose_pine_variant = 'main'

vim.g.rose_pine_bold_vertical_split_line = false
vim.g.rose_pine_inactive_background = false
vim.g.rose_pine_disable_background = false
vim.g.rose_pine_disable_float_background = false
vim.g.rose_pine_disable_italics = false

local p = require('rose-pine.palette')
vim.g.rose_pine_colors = {
	punctuation = p.subtle,
	comment = p.subtle,
	hint = p.iris,
	info = p.foam,
	warn = p.gold,
	error = p.love,

	-- Or set all headings to one colour: `headings = p.text`
	headings = {
		h1 = p.iris,
		h2 = p.foam,
		h3 = p.rose,
		h4 = p.gold,
		h5 = p.pine,
		h6 = p.foam,
	},
}

-- tokyonight_style config in Lua
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

--utils.create_augroup({{'Colorscheme', '*', 'highlight' ,'Normal',  'ctermbg=none', 'guibg=none'}}, 'user_colors')
--utils.create_augroup({{'Colorscheme', '*', 'highlight' ,'Normal',  'ctermbg=none'}}, 'user_colors')
--utils.create_augroup({{'Colorscheme', '*', 'highlight' ,'NonText',  'ctermbg=none', 'guibg=none'}}, 'user_colors')


vim.cmd('colorscheme ' .. theme)

return theme
