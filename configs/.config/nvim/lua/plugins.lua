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

-- nvim-tree
local function nvim_tree_onattach(bufnr)
	local api = require "nvim-tree.api"

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	vim.keymap.set('n', 's',   api.node.open.vertical,              opts('Open: Vertical Split'))
end

require("nvim-tree").setup({
	on_attach = nvim_tree_onattach,
	view = {
		width = 30,
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
