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
