return {
  {
    'saghen/blink.cmp',
    version = '1.*',
    event = 'InsertEnter',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          if vim.fn.has('win32') == 1 or vim.fn.executable('make') == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
      },
    },
    opts = {
      keymap = {
        preset = 'enter',
        ['<Tab>']   = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<C-l>']   = { 'snippet_forward', 'fallback' },
        ['<C-h>']   = { 'snippet_backward', 'fallback' },
        ['<C-b>']   = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>']   = { 'scroll_documentation_down', 'fallback' },
      },
      sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
      signature = { enabled = true },
      snippets = { preset = 'luasnip' },
      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 200 },
      },
    },
  },
}
