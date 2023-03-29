require('plugins')

-- Set common end-of-line gutters
vim.opt.colorcolumn = { 80, 100 }

-- Colourscheme
vim.cmd('colorscheme dayfox')

-- Open file explorer
vim.api.nvim_set_keymap('n', '<leader>f', ':NvimTreeToggle<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>F', ':NvimTreeFindFile<cr>', {})

-- Open fuzzy file finder
vim.api.nvim_set_keymap('n', '<leader><leader>', ':call v:lua.FzyFiles(\':e\')<cr>', {})

-- Enable  z e n   m o d e
vim.api.nvim_set_keymap('n', '<leader>z', ':ZenMode<cr>', {})

-- Language Server stuff
vim.api.nvim_set_keymap('i', '<c-space>', 'coc#refresh()', { expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'K', ':call CocAction("doHover")<CR>', {})
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>c', ':CocCommand<CR>', {})

-- Open popup terminal prefilled with the current filename
vim.api.nvim_set_keymap('n', '<leader>e', ':call v:lua.ExecuteOnCurrentFile(expand(\'%\'))<CR>', {})

-- Highlight trailing whitespace
vim.cmd[[autocmd BufWinEnter * match TSWarning /\s\+$/]]
vim.cmd[[autocmd InsertLeave * match TSWarning /\s\+$/]]
vim.cmd[[autocmd InsertEnter * match TSWarning /\s\+\%#\@<!$/]]

-- Highlight the hovered symbol and its references, if supported by the LS
vim.cmd 'autocmd CursorHold * silent call CocActionAsync("highlight")'
