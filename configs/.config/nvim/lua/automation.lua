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
