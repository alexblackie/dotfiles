require('plugins')

-- Anti-Colourscheme
vim.cmd("syntax off")

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

-- Yank to the system clipboard(s)
vim.opt.clipboard = "unnamed,unnamedplus"

-- Override built-in colours for popups/modal windows (which are pink by
-- default which is awful), and the LSP inline text because it is otherwise
-- indistinguishable from everything else.
vim.cmd [[
	set termguicolors
	hi DiagnosticError guifg=red
	hi DiagnosticWarn  guifg=lightgrey
	hi DiagnosticInfo  guifg=lightgrey
	hi DiagnosticHint  guifg=lightgrey
	hi PMenu           guibg=lightgrey guifg=black
	hi SignColumn      guibg=white guifg=lightgrey
	hi EndOfBuffer     guibg=white guifg=white
]]
