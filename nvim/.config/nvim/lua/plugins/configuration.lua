--- Lsp
require("plugins.lsp")
require("plugins.lsp_status")
--- Auto-Completion
require("plugins.completion")
--- Fuzzy finder
require("plugins.telescope")
--- Workflow and UI
require("plugins.status_line")
require("plugins.gutter")
require("plugins.comments")
require("plugins.luasnip")
require("fidget").setup{}
require("luasnip.loaders.from_vscode").load()
--require("plugins.lspsaga")
---
require("plugins.treesitter")
