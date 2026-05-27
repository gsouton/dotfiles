-- nvim-treesitter main branch: a thin layer over vim.treesitter.*
--
-- Differences from the legacy master-branch config:
--   - No setup() table with ensure_installed/highlight/indent flags
--   - Parsers installed explicitly via .install()
--   - Highlighting/indent enabled per-buffer via FileType autocmd
return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = function() require('nvim-treesitter').update() end,
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      local parsers = {
        'bash', 'c', 'cpp', 'diff', 'glsl', 'go', 'html', 'json',
        'lua', 'luadoc', 'markdown', 'markdown_inline', 'python',
        'query', 'rust', 'toml', 'vim', 'vimdoc', 'yaml',
      }
      require('nvim-treesitter').install(parsers)

      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('treesitter-start', { clear = true }),
        callback = function(ev)
          local lang = vim.treesitter.language.get_lang(vim.bo[ev.buf].filetype)
          if not lang then return end
          if not pcall(vim.treesitter.start, ev.buf, lang) then return end
          if vim.treesitter.query.get(lang, 'indents') then
            vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
}
