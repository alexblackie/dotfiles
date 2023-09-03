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

-- Highlight trailing whitespace
vim.cmd[[autocmd BufWinEnter * match TSWarning /\s\+$/]]
vim.cmd[[autocmd InsertLeave * match TSWarning /\s\+$/]]
vim.cmd[[autocmd InsertEnter * match TSWarning /\s\+\%#\@<!$/]]

-- Yank to the system clipboard(s)
vim.opt.clipboard = "unnamed,unnamedplus"
