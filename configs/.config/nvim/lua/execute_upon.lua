-- Create a floating window and put the current buffer's relative file path
-- after the cursor so you can just type a command and run it with the file
-- path as the argument(s).
--
-- Useful for quickly running tests or linters on a specific file.
function _G.ExecuteOnCurrentFile(path)
	CreateFloatingWindow({})
	vim.cmd('terminal')
	vim.cmd('put =\' ' .. path  .. '\' . \\"\\<c-l>\\<c-a>\\"')
	vim.cmd('execute \'normal! I\'')
end
