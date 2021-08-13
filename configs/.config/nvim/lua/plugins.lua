--
-- Plugins and Plugin Setup
--
packer = require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Themes and UI plugins
	use 'folke/tokyonight.nvim'
	use 'hoob3rt/lualine.nvim'

	-- Behavioural and "Core" stuff
	use { 'neoclide/coc.nvim', branch = 'release' }
	use { 'junegunn/fzf.vim', requires = { { 'junegunn/fzf', run = function() vim.fn['fzf#install']() end } } }
	use 'preservim/nerdtree'
	use 'preservim/nerdcommenter'
	use 'tpope/vim-fugitive'

	-- Language support and integration
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use 'sheerun/vim-polyglot'
	use 'editorconfig/editorconfig-vim'
end)

require('execute_upon')

require('lualine').setup({
	options = {
		theme = 'tokyonight',
		padding = 1,
		section_separators = {'', ''},
		component_separators = {'', ''},
	},
	sections = {
		lualine_a = { { 'mode', lower = true } },
		lualine_b = { { 'filename', path = 1 } },
		lualine_c = { },
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
	'coc-html',
	'coc-sh',
}

return packer
