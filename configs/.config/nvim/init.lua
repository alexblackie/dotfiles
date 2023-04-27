require('plugins')

-- Set common end-of-line gutters
vim.opt.colorcolumn = { 80, 100 }

-- Colourscheme
vim.cmd[[colorscheme dayfox]]

-- Open file explorer
vim.keymap.set('n', '<leader>f', ':NvimTreeToggle<cr>')
vim.keymap.set('n', '<leader>F', ':NvimTreeFindFile<cr>')

-- Open fuzzy file finder
vim.keymap.set('n', '<leader><leader>', function() FzyFiles(':e') end)

-- Enable  z e n   m o d e
vim.keymap.set('n', '<leader>z', ':ZenMode<cr>')

-- Language Server stuff
vim.keymap.set('i', '<c-space>', 'coc#refresh()', { expr = true, silent = true })
vim.keymap.set({'n', 'v'}, 'K', ':call CocAction("doHover")<CR>', { silent = true })
vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { silent = true })
vim.keymap.set('n', '<leader>c', ':CocCommand<CR>')
vim.keymap.set('n', '[g', '<Plug>(coc-diagnostic-prev)', { silent = true });
vim.keymap.set('n', ']g', '<Plug>(coc-diagnostic-next)', { silent = true });

-- Highlight trailing whitespace
vim.cmd[[autocmd BufWinEnter * match TSWarning /\s\+$/]]
vim.cmd[[autocmd InsertLeave * match TSWarning /\s\+$/]]
vim.cmd[[autocmd InsertEnter * match TSWarning /\s\+\%#\@<!$/]]

-- Highlight the hovered symbol and its references, if supported by the LS
vim.cmd[[autocmd CursorHold * silent call CocActionAsync("highlight")]]

-- Yank to the system clipboard(s)
vim.opt.clipboard = "unnamed,unnamedplus"
