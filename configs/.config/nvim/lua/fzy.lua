-- In large part thanks to @benjaminwil ->
--   https://github.com/benjaminwil/dotfiles/blob/e70a14886e8095d74296a3c4540e3ca3b7a24202/.vim/pack/benjaminwil/start/frgzy/plugin/rg%2Bfzy-files.vim

vim.cmd[[
function! FzyFiles(vim_command) abort
	let l:files_command = "fd -t f -H"
	let l:callback = {
		\ 'window_id': win_getid(),
		\ 'filename': tempname(),
		\ 'vim_command': a:vim_command
	\ }

	function! l:callback.on_exit(job_id, data, event) abort
		bdelete!
		call win_gotoid(self.window_id)
		if filereadable(self.filename)
			try
				let l:selected_filename = readfile(self.filename)[0]
				exec self.vim_command . ' ' . l:selected_filename
			catch /E684/
			endtry
		endif
		call delete(self.filename)
	endfunction

	botright 10 new
	let l:terminal_command = l:files_command . ' | fzy > ' .  l:callback.filename
	silent call termopen(l:terminal_command, l:callback)
	setlocal nonumber norelativenumber
	startinsert
endfunction
]]
