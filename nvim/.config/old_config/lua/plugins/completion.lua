-- Aliases
local cmp = require('cmp')
local lspkind = require('lspkind')
local types = require("cmp.types")
local str = require("cmp.utils.str")


local luasnip = require("luasnip")

luasnip.config.setup({
	region_check_events = "CursorMoved",
	delete_check_events = "TextChanged",
})


cmp.setup({
     formatting = {
         format = lspkind.cmp_format({
         with_text = true, -- do not show text alongside icons
         --maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
         menu = {
             buffer = "[buf]",
             nvim_lsp = "[LSP]",
             nvim_lua = "[api]",
             path = "[path]",
             luasnip = "[snip]"
         },

        -- The function below will be called before any actual modifications from lspkind
        -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
        -- before = function (entry, vim_item)
        --     -- Get the full snippet (and only keep first line)
        --     local word = entry:get_insert_text()
        --     if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet then
        --         word = vim.lsp.util.parse_snippet(word)
        --     end
        --     word = str.oneline(word)

        --     -- concatenates the string
        --     --local max = 50
        --     --if string.len(word) >= max then
        --     --	local before = string.sub(word, 1, math.floor((max - 3) / 2))
        --     --	word = before .. "..."
        --     --end
        --     if
        --         entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet
        --         and string.sub(vim_item.abbr, -1, -1) == "~"
        --     then
        --         word = word .. "~"
        --     end
        --     vim_item.abbr = word
        --     return vim_item
        -- end
         })
     },
     experimental = {
        native_menu = false,
        --ghost_test = true,
     },

     snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
	sources = {
		{ name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'luasnip' },
        { name = 'buffer', keyword_length = 4}
	},
	mapping = {
		['<Tab>'] = cmp.mapping.select_next_item(),
		['<C-j>'] = cmp.mapping.select_next_item(),
		['<Down>'] = cmp.mapping.select_next_item(),
		['<C-k>'] = cmp.mapping.select_prev_item(),
		['<Up>'] = cmp.mapping.select_prev_item(),
		['<C-d>'] = cmp.mapping.scroll_docs(-1),
		['<C-u>'] = cmp.mapping.scroll_docs(1),
		['<CR>'] = cmp.mapping.confirm({select = true}),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
	},
})
