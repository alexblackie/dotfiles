function CreateFloatingWindow(overrides)
	-- Window maths lovingly stolen from:
	--   https://www.2n.pl/blog/how-to-make-ui-for-neovim-plugins-in-lua
	local width = vim.api.nvim_get_option('columns')
	local height = vim.api.nvim_get_option('lines')
	local win_height = math.ceil(height * 0.8 - 4)
	local win_width = math.ceil(width * 0.8)
	local col = math.ceil((width - win_width) / 2)
	local buf = vim.api.nvim_create_buf(false, true)

	local opts = {
		relative = 'editor',
		width = win_width,
		height = win_height,
		col = col,
		row = 2,
		border = 'rounded',
	}
	for k,v in pairs(overrides) do opts[k] = v end

	return vim.api.nvim_open_win(buf, true, opts)
end
