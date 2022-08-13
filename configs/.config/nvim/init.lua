require('plugins')

--
-- Editing
--
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

--
-- Interface and theming
--
vim.opt.cursorline = true
vim.opt.colorcolumn = { 80, 100 }
vim.opt.winwidth = 107

vim.g.lunarised_italic_comments = true

require('lunarised').load()

--
-- Keybindings
--

-- Disable hotkey manpage lookups
vim.api.nvim_set_keymap('', 'K', '<NOP>', { noremap = true })

-- Open file browser sidebar
vim.api.nvim_set_keymap('n', '<leader>f', ':NERDTreeToggle<CR>', {})

-- Find current file in file tree sidebar
vim.api.nvim_set_keymap('n', '<leader>F', ':NERDTreeFind<CR>', {})

-- Open fuzzy file finder
vim.api.nvim_set_keymap('n', '<leader><leader>', ':call v:lua.FzyFiles(\':e\')<cr>', {})

-- Trigger code completion
vim.api.nvim_set_keymap('i', '<c-space>', 'coc#refresh()', { expr = true, silent = true })

-- Code navigation: Go to definition
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { silent = true })

-- Open popup terminal prefilled with the current filename
vim.api.nvim_set_keymap('n', '<leader>e', ':call v:lua.ExecuteOnCurrentFile(expand(\'%\'))<CR>', {})


--
-- Automation
--

-- Start with all folds expanded
vim.cmd[[autocmd BufRead * normal zR]]

-- Highlight trailing whitespace
vim.cmd[[autocmd BufWinEnter * match TSWarning /\s\+$/]]
vim.cmd[[autocmd InsertLeave * match TSWarning /\s\+$/]]
vim.cmd[[autocmd InsertEnter * match TSWarning /\s\+\%#\@<!$/]]

-- exit if nerdtree is the only buffer left
vim.cmd 'autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif'

-- Highlight the hovered symbol and its references, if supported by the LS
vim.cmd 'autocmd CursorHold * silent call CocActionAsync("highlight")'
