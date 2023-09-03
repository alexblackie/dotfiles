require('plugins')

-- Set common end-of-line gutters
vim.opt.colorcolumn = { 80, 100 }

-- Colourscheme
vim.cmd [[colorscheme nightfox]]

-- Open file explorer
vim.keymap.set('n', '<leader>f', ':NvimTreeToggle<cr>')
vim.keymap.set('n', '<leader>F', ':NvimTreeFindFile<cr>')

-- Open fuzzy file finder
vim.keymap.set('n', '<leader><leader>', function() FzyFiles(':e') end)

-- LSP integration
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[g', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']g', vim.diagnostic.goto_next)

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<leader><space>', function()
			vim.lsp.buf.format { async = true }
		end, opts)
	end,
})

-- Highlight trailing whitespace
vim.cmd [[autocmd BufWinEnter * match TSWarning /\s\+$/]]
vim.cmd [[autocmd InsertLeave * match TSWarning /\s\+$/]]
vim.cmd [[autocmd InsertEnter * match TSWarning /\s\+\%#\@<!$/]]

-- Yank to the system clipboard(s)
vim.opt.clipboard = "unnamed,unnamedplus"
