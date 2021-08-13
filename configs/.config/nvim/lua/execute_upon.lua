-- Create a floating window and put the current buffer's relative file path
-- after the cursor so you can just type a command and run it with the file
-- path as the argument(s).
--
-- Useful for quickly running tests or linters on a specific file.
function _G.ExecuteOnCurrentFile(path)
	-- Window maths lovingly stolen from:
	--   https://www.2n.pl/blog/how-to-make-ui-for-neovim-plugins-in-lua
	local width = vim.api.nvim_get_option('columns')
	local height = vim.api.nvim_get_option('lines')
	local win_height = math.ceil(height * 0.8 - 4)
	local win_width = math.ceil(width * 0.8)
	local row = math.ceil((height - win_height) / 2 - 1)
	local col = math.ceil((width - win_width) / 2)

	local opts = {
		relative = 'editor',
		width = win_width,
		height = win_height,
		col = col,
		row = row,
		border = 'shadow',
	}

	local win = vim.api.nvim_open_win(buf, true, opts)

	vim.cmd('terminal')
	vim.cmd('put =\' ' .. path  .. '\' . \\"\\<c-l>\\<c-a>\\"')
	vim.cmd('execute \'normal! I\'')
end
