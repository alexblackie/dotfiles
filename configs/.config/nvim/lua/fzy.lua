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

function _G.FzyGems()
	local terminal_command = 'bundle list --name-only | fzy'

	CreateFloatingWindow({ height = 10 })

	local opts = {
		on_exit = function()
			local gem_name = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), " ")
			vim.cmd('bdelete!')
			FzyGemFiles(gem_name)
		end
	}
	vim.fn.termopen(terminal_command, opts)
	vim.cmd('startinsert')
end

function FzyGemFiles(gem_name)
	local terminal_command = 'gemdir="$(bundle show ' .. gem_name .. ')" ; echo "$gemdir" ; cd "$gemdir" ; fd -t f -H . | fzy'

	CreateFloatingWindow({ height = 10 })

	local opts = {
		on_exit = function()
			local gemdir = table.concat(vim.api.nvim_buf_get_lines(0, 0, 1, false), " ")
			local filename = table.concat(vim.api.nvim_buf_get_lines(0, 1, 2, false), " ")
			vim.cmd('bdelete!')
			vim.fn.execute(':e ' .. gemdir .. '/' .. filename)
		end
	}
	vim.fn.termopen(terminal_command, opts)
	-- For some reason, `startinsert` does nothing here and we need to
	-- manually force it into insert mode by typing...
	vim.fn.feedkeys('I')
end
