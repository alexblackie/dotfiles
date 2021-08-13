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
