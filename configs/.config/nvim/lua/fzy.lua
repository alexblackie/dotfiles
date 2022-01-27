function _G.FzyFiles(vim_command)
	local terminal_command = 'fd -t f -H | fzy'

	CreateFloatingWindow({ height = 10 })

	local opts = {
		on_exit = function()
			local filename = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), " ")
			vim.cmd('bdelete!')
			vim.fn.execute(vim_command .. ' ' .. filename)
		end
	}
	vim.fn.termopen(terminal_command, opts)
	vim.cmd('startinsert')
end
