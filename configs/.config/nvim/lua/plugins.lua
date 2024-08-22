--
-- Plugins and Plugin Setup
--
require('floater')
require('fzy')

-- We already map '\\' so we need to override the leader for 'vim-visual-multi'
vim.g.VM_leader = '<space>'

-- LSP Setup
local lsps = {
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

local lspconfig = require("lspconfig")
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = lsps
})

local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<C-y>'] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "vsnip" },
	}, {
		{ name = 'buffer' },
	}),
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
for _, name in pairs(lsps) do
	lspconfig[name].setup({
		capabilities = capabilities
	})
end

-- Treesitter
local treesitter_langs = {
	'bash',
	'c',
	'css',
	'dockerfile',
	'elixir',
	'erlang',
	'go',
	'gomod',
	'graphql',
	'hcl',
	'heex',
	'java',
	'javascript',
	'json',
	'lua',
	'python',
	'ruby',
	'rust',
	'vim',
	'yaml',
}

-- Ensure treesitter and polyglot do not fight for control of the same
-- languages. This causes all sorts of weird autoindent issues.
vim.g.polyglot_disabled = treesitter_langs

require('nvim-treesitter.configs').setup({
	ensure_installed = treesitter_langs,
	ignore_install = {},
	highlight = { enable = true },
})

-- carbon.nvim
require('carbon').setup({
	auto_open = false,
})
