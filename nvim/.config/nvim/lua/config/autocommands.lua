-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- GLSL shader filetypes (replaces ftdetect/*.vim)
vim.filetype.add({
  extension = {
    frag = 'glsl',
    vert = 'glsl',
    glsl = 'glsl',
  },
})

-- Ansible YAML detection — sets filetype to `yaml.ansible` for files in the
-- standard role layout, so `ansiblels` attaches without disturbing plain YAML.
vim.filetype.add({
  pattern = {
    ['.*/playbooks/.*%.ya?ml']         = 'yaml.ansible',
    ['.*/roles/.*/tasks/.*%.ya?ml']    = 'yaml.ansible',
    ['.*/roles/.*/handlers/.*%.ya?ml'] = 'yaml.ansible',
    ['.*/roles/.*/vars/.*%.ya?ml']     = 'yaml.ansible',
    ['.*/roles/.*/defaults/.*%.ya?ml'] = 'yaml.ansible',
    ['.*/roles/.*/meta/.*%.ya?ml']     = 'yaml.ansible',
    ['.*/group_vars/.*%.ya?ml']        = 'yaml.ansible',
    ['.*/host_vars/.*%.ya?ml']         = 'yaml.ansible',
    ['.*/inventor.*/.*%.ya?ml']        = 'yaml.ansible',
    ['.*/ansible/.*%.ya?ml']           = 'yaml.ansible',
  },
})
