-- Aliases
local nvim_lsp = require("lspconfig")

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<space>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)
end

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}
require("lspconfig")["pyright"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
})

require("lspconfig")["tsserver"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
})

require("lspconfig")["sumneko_lua"].setup({
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
	on_attach = on_attach,
	flags = lsp_flags,
})

require("lspconfig")["rust_analyzer"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	-- Server-specific settings...
	-- settings = {
	--   ["rust-analyzer"] = {}
	-- }
})

require("lspconfig")["astro"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	-- Server-specific settings...
	-- settings = {
	--   ["rust-analyzer"] = {}
	-- }
})



-- Configure omnisharp
-- https://www.jhonatandasilva.com/published/1623278444
-- local pid = vim.fn.getpid()
-- On linux/darwin if using a release build, otherwise under scripts/OmniSharp(.Core)(.cmd)
-- local omnisharp_bin = "/home/gilles/.local/share/lsp/omnisharp-linux-x64-net6.0/run"
-- require("lspconfig")["omnisharp"].setup({
-- 	on_attach = on_attach,
-- 	flags = lsp_flags,
--
--     cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
--     root_dir = nvim_lsp.util.root_pattern("*.csproj","*.sln"),
--     use_mono = true,
--
--     -- cmd = { "dotnet", "/home/gilles/.local/share/lsp/omnisharp-linux-x64-net6.0/OmniSharp.dll", "--languageserver"},
--     -- cmd = { "/home/gilles/.local/share/nvim/mason/bin/omnisharp", "--languageserver" },
--     -- cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
--
-- 	-- Enables support for reading code style, naming convention and analyzer
-- 	-- settings from .editorconfig.
-- 	enable_editorconfig_support = true,
--
-- 	-- If true, MSBuild project system will only load projects for files that
-- 	-- were opened in the editor. This setting is useful for big C# codebases
-- 	-- and allows for faster initialization of code navigation features only
-- 	-- for projects that are relevant to code that is being edited. With this
-- 	-- setting enabled OmniSharp may load fewer projects and may thus display
-- 	-- incomplete reference lists for symbols.
-- 	enable_ms_build_load_projects_on_demand = false,
--
-- 	-- Enables support for roslyn analyzers, code fixes and rulesets.
-- 	enable_roslyn_analyzers = false,
--
-- 	-- Specifies whether 'using' directives should be grouped and sorted during
-- 	-- document formatting.
-- 	organize_imports_on_format = false,
--
-- 	-- Enables support for showing unimported types and unimported extension
-- 	-- methods in completion lists. When committed, the appropriate using
-- 	-- directive will be added at the top of the current file. This option can
-- 	-- have a negative impact on initial completion responsiveness,
-- 	-- particularly for the first few completion sessions after opening a
-- 	-- solution.
-- 	enable_import_completion = false,
--
-- 	-- Specifies whether to include preview versions of the .NET SDK when
-- 	-- determining which version to use for project loading.
-- 	sdk_include_prereleases = true,
--
-- 	-- Only run analyzers against open files when 'enableRoslynAnalyzers' is
-- 	-- true
-- 	analyze_open_documents_only = false,
--     path = "latest",
-- })

----- OLD neovim.lsp
-- local on_attach = function(client, bufnr)
--     -- Aliases
--     local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--
--     local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
--
--     -- Mapping
--     local opts = { noremap = true, silent = true }
--     -- Set keys
--     buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--     buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
--     buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
--     buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
--     buf_set_keymap('n', '<leader>h', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
--     buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
--     buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
--     buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
--     buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
--     buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
--     buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
--     buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
--     buf_set_keymap('n', '<leader>gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
--     buf_set_keymap('n', '<leader>gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
--     buf_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
--     buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
--
--     if client.server_capabilities.document_formatting then
--         vim.api.nvim_command [[augroup Format]]
--         vim.api.nvim_command [[autocmd! * <buffer>]]
--         vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
--         vim.api.nvim_command [[augroup END]]
--     end
--
-- end

--- UI Customization
-- Diagnostic signs
-- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
-- for type, icon in pairs(signs) do
--     local hl = "DiagnosticSign" .. type
--     vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
-- end

-- vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=none]]
-- vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=none guibg=none]]
-- local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
-- function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
--   opts = opts or {}
--   -- opts.border = opts.border or "rounded"
--   return orig_util_open_floating_preview(contents, syntax, opts, ...)
-- end

-- Support autocompletion
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Add snippet support
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- local servers = { 'clangd', 'tsserver',
--     'sumneko_lua', 'volar', 'eslint', 'tailwindcss', 'cssls', 'html' }
--
--
-- for _, lsp in ipairs(servers) do
--     local settings = {}
--     if lsp == 'sumneko_lua' then
--         settings.Lua = {
--             runtime = {
--                 version = "LuaJIT",
--                 path = vim.split(package.path, ";")
--             },
--             diagnostics = {
--                 -- Recognize `vim` global
--                 globals = { "vim", "use" }
--             },
--             workspace = {
--             },
--         }
--     end
--     nvim_lsp[lsp].setup {
--         on_attach = on_attach,
--         capabilities = capabilities,
--         settings = settings,
--
--     }
-- end

-- Configure omnisharp
-- https://www.jhonatandasilva.com/published/1623278444
-- local pid = vim.fn.getpid()
-- On linux/darwin if using a release build, otherwise under scripts/OmniSharp(.Core)(.cmd)
-- local omnisharp_bin = "/home/gilles/.local/share/lsp/omnisharp-linux-x64/run"

-- nvim_lsp.omnisharp.setup {
--     cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
--     root_dir = nvim_lsp.util.root_pattern("*.csproj","*.sln");
--     on_attach = on_attach,
--     capabilities = capabilities,
-- }

-- Server installed and managed by plugin nvim-lsp-installer
-- local lsp_installer = require('nvim-lsp-installer')

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
-- lsp_installer.on_server_ready(function(server)
--     local opts = {
--         on_attach = on_attach,
--         capabilities = capabilities,
--     }

-- (optional) Customize the options passed to the server
-- if server.name == "tsserver" then
--     opts.root_dir = function() ... end
-- end

-- This setup() function is exactly the same as lspconfig's setup function.
-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- server:setup(opts)
-- end)
