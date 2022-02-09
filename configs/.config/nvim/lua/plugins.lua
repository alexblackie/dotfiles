--
-- Plugins and Plugin Setup
--
require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Themes and UI plugins
	use 'alexblackie/lunarised'
	use 'hoob3rt/lualine.nvim'
	use 'airblade/vim-gitgutter'

	-- Behavioural and "Core" stuff
	use { 'neoclide/coc.nvim', branch = 'release' }
	use 'preservim/nerdtree'
	use 'tpope/vim-commentary'
	use 'tpope/vim-fugitive'
	use 'tpope/vim-rhubarb'

	-- Language support and integration
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use 'sheerun/vim-polyglot'
	use 'editorconfig/editorconfig-vim'
end)

require('floater')
require('execute_upon')
require('fzy')

require('lualine').setup({
	options = {
		theme = 'lunarised',
		padding = 1,
		section_separators = {'', ''},
		component_separators = {'', ''},
	},
	sections = {
		lualine_a = { { 'mode', lower = true } },
		lualine_b = { 'branch' },
		lualine_c = { { 'filename', path = 1 } },
		lualine_x = { },
		lualine_y = { 'filetype' },
		lualine_z = { 'location' },
	},
	extensions = { },
})

require('nvim-treesitter.configs').setup({
	ensure_installed = 'maintained',
	ignore_install = { },
	highlight = { enable = true },
})

vim.g.coc_global_extensions = {
	'coc-elixir',
	'coc-java',
	'coc-go',
	'coc-solargraph',
	'coc-sh',
}
