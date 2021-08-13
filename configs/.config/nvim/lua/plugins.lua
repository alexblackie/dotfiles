return require('packer').startup(function()
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
