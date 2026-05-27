return {
  -- Lua LSP enhanced with nvim runtime + plugins for editing this config
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },

  -- Main LSP plumbing
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      'mason-org/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      'saghen/blink.cmp',
    },
    config = function()
      -- Mason auto-installs these on first launch.
      -- Anything else: install on demand with :MasonInstall <name>.
      require('mason-tool-installer').setup({
        ensure_installed = { 'lua_ls', 'stylua' },
      })

      -- mason-lspconfig 2.0: automatic_enable calls vim.lsp.enable() for
      -- every mason-installed server. Per-server config lives in lsp/<name>.lua.
      require('mason-lspconfig').setup({
        ensure_installed = {},
        automatic_enable = true,
      })

      -- Default capabilities for every LSP — pulls in blink.cmp's completion support.
      vim.lsp.config('*', {
        capabilities = require('blink.cmp').get_lsp_capabilities(),
      })

      -- Diagnostic display: compact virtual_text by default
      vim.diagnostic.config({
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN]  = '󰀪 ',
            [vim.diagnostic.severity.INFO]  = '󰋽 ',
            [vim.diagnostic.severity.HINT]  = '󰌶 ',
          },
        } or {},
        virtual_text = {
          source = 'if_many',
          spacing = 2,
          format = function(d) return d.message end,
        },
      })

      -- <leader>e opens the diagnostic for the current line in a floating popup.
      -- Press <leader>e again (or move cursor into the float) to focus and scroll it.
      -- Press <Esc> or move cursor away to close.
      vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float,
        { desc = 'Show diagnostic float' })

      -- LspAttach: per-buffer LSP keymaps, only active when an LSP is attached.
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end
          local builtin = require('telescope.builtin')

          map('gd',         builtin.lsp_definitions,                'Goto Definition')
          map('gD',         vim.lsp.buf.declaration,                'Goto Declaration')
          map('gr',         builtin.lsp_references,                 'Goto References')
          map('gI',         builtin.lsp_implementations,            'Goto Implementation')
          map('<leader>D',  builtin.lsp_type_definitions,           'Type Definition')
          map('<leader>ds', builtin.lsp_document_symbols,           'Document Symbols')
          map('<leader>ws', builtin.lsp_dynamic_workspace_symbols,  'Workspace Symbols')
          map('<leader>rn', vim.lsp.buf.rename,                     'Rename')
          map('<leader>ca', vim.lsp.buf.code_action,                'Code Action', { 'n', 'x' })

          -- Inlay hints toggle (only if the server supports them)
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client:supports_method('textDocument/inlayHint', event.buf) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
            end, 'Toggle Inlay Hints')
          end
        end,
      })
    end,
  },
}
