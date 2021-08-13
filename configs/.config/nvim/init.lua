--
-- Plugins and Plugin Setup
--
require('plugins')
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
	'coc-solargraph'
}


--
-- Editing
--
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2


--
-- Interface and theming
--
vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.colorcolumn = { 80, 100 }
vim.opt.winwidth = 107

vim.g.tokyonight_style = 'night'

vim.cmd 'colorscheme tokyonight'


--
-- Keybindings
--

-- Disable hotkey manpage lookups
vim.api.nvim_set_keymap('n', 'K', '<NOP>', { noremap = true })

-- Open file browser sidebar
vim.api.nvim_set_keymap('n', '<leader>t', ':NERDTreeToggle<CR>', {})

-- Find current file in file tree sidebar
vim.api.nvim_set_keymap('n', '<leader>b', ':NERDTreeFind<CR>', {})

-- Open fuzzy file finder
vim.api.nvim_set_keymap('n', '<leader>f', ':Files<CR>', {})

-- Trigger code completion
vim.api.nvim_set_keymap('i', '<c-space>', 'coc#refresh()', { expr = true, silent = true })

-- Code navigation: Go to definition
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { silent = true })

-- Open popup terminal prefilled with the current filename
vim.api.nvim_set_keymap('n', '<leader>e', ':call v:lua.ExecuteOnCurrentFile(expand(\'%\'))<CR>', {})


--
-- Automation
--

-- Highlight trailing whitespace
vim.cmd 'autocmd BufWinEnter * match ErrorMsg /\\s\\+$/'
vim.cmd 'autocmd InsertLeave * match ErrorMsg /\\s\\+$/'
vim.cmd 'autocmd InsertEnter * match ErrorMsg /\\s\\+\\%#\\@<!$/'

-- Trim trailing whitespace on save
vim.cmd 'autocmd BufWritePre * :%s/\\s\\+$//e'

-- exit if nerdtree is the only buffer left
vim.cmd 'autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif'

-- Highlight the hovered symbol and its references, if supported by the LS
vim.cmd 'autocmd CursorHold * silent call CocActionAsync("highlight")'
