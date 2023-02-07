--
-- Plugins and Plugin Setup
--
require('floater')
require('execute_upon')
require('fzy')

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
