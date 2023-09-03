--
-- Plugins and Plugin Setup
--
require('floater')
require('fzy')

-- We already map '\\' so we need to override the leader for 'vim-visual-multi'
vim.g.VM_leader = '<space>'

-- LSP Setup
local lspconfig = require("lspconfig")
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"ansiblels",
		"bicep",
		"cssls",
		"elixirls",
		"gopls",
		"html",
		"jsonls",
		"lua_ls",
		"rust_analyzer",
		"solargraph",
		"tailwindcss",
		"tsserver",
	}
})

lspconfig.ansiblels.setup({})
lspconfig.bicep.setup({})
lspconfig.cssls.setup({})
lspconfig.elixirls.setup({})
lspconfig.gopls.setup({})
lspconfig.html.setup({})
lspconfig.jsonls.setup({})
lspconfig.lua_ls.setup({})
lspconfig.rust_analyzer.setup({})
lspconfig.solargraph.setup({})
lspconfig.tailwindcss.setup({})
lspconfig.tsserver.setup({})
