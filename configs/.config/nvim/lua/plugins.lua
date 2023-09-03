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

-- nvim-tree
require("nvim-tree").setup({
	view = {
		width = 30,
		mappings = {
			list = {
				{ key = "s", action = "vsplit" },
			},
		},
	},
	renderer = {
		add_trailing = true,
		highlight_git = false,
		highlight_opened_files = "none",
		highlight_modified = "none",
		indent_markers = {
			enable = true,
		},
		icons = {
			webdev_colors = false,
			padding = "",
			show = {
				file = false,
				folder_arrow = false,
				folder = false,
			},
		},
	},
	git = { enable = false },
	modified = { enable = false },
})

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
