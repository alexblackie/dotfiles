--
-- Plugins and Plugin Setup
--
require('floater')
require('fzy')

-- We already map '\\' so we need to override the leader for 'vim-visual-multi'
vim.g.VM_leader = '<space>'

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
	ignore_install = { },
	highlight = { enable = true },
})

vim.g.coc_global_extensions = {
	'coc-clangd',
	'coc-elixir',
	'coc-java',
	'coc-go',
	'coc-solargraph',
	'coc-sh',
	'coc-tsserver',
	'coc-rust-analyzer',
}

require("zen-mode").setup({
	window = { backdrop = 1 },
});
