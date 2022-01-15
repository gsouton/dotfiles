local map = vim.api.nvim_set_keymap
local saga = require('lspsaga')

saga.init_lsp_saga {
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = "round",
}


map('n', '<silent>K',  "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", {})
