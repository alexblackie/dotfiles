" ------------------------------------------------------------------------------
"  Bootstrap
" ------------------------------------------------------------------------------
set enc=utf-8
call pathogen#infect()


" ------------------------------------------------------------------------------
"  Text-editing
" ------------------------------------------------------------------------------
filetype plugin indent on

set autoindent
set backspace=2      " Use sane backspace behaviour
set expandtab        " Spaces for tabs by default
set nocompatible
set smartcase        " Better searching
set pastetoggle=<F2> " Stop the cascading-indents when pasting
set tabstop=2
set shiftwidth=2

" Kill annoying delay on ESC
set esckeys
set timeoutlen=1000 ttimeoutlen=0


" ------------------------------------------------------------------------------
"  UI Things
" ------------------------------------------------------------------------------
syntax on
set background=light
colorscheme default
set t_Co=256

set colorcolumn=80
set noerrorbells
set novisualbell
set number
set ruler
set laststatus=2 " Always show bar

set incsearch " Show search results 'as you type'
set hlsearch

let &winwidth = 87 " Ensure a minimum width for active split

highlight Search      ctermbg=LightYellow ctermfg=Black cterm=NONE
highlight ColorColumn ctermbg=LightGray cterm=NONE

" ------------------------------------------------------------------------------
" System
" ------------------------------------------------------------------------------
set exrc          " Enable per-directory .vimrc files
set secure        " Disable unsafe commands in per-directory .vimrc files
set magic         " Enable extended regexes
set nobackup
set noswapfile
set nostartofline " Don't reset cursor to start of line when moving around.


" ------------------------------------------------------------------------------
"  Mappings
" ------------------------------------------------------------------------------
" Move around splits with ctrl-{h,j,k,l}
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Fuck this shit
noremap K <NOP>

" Run current project's test suite
map <leader>s :!./.test_runner<CR>
map <Leader>t :!./.test_runner %<CR>

" Convert old hashrockets into 1.9 syntax
noremap <leader>rr :s/:\(\w\+\)\s*=>/\1:/g<CR>


" ------------------------------------------------------------------------------
"  Automatic things
" ------------------------------------------------------------------------------
augroup filetypedetect
	autocmd BufNew,BufNewFile,BufRead *.txt,*.text,*.md,*.markdown set textwidth=80
	autocmd BufNew,BufNewFile,BufRead COMMIT_EDITMSG set textwidth=72
	autocmd BufNewFile,BufReadPost *.hamlbars set filetype=haml
	autocmd BufNewFile,BufReadPost *.styl set filetype=sass
	autocmd BufNewFile,BufReadPost *.info set filetype=dosini
	autocmd BufNewFile,BufReadPost rebar.config set filetype=erlang
	autocmd BufNewFile,BufReadPost *.app.src set filetype=erlang
	autocmd BufNewFile,BufReadPost *.sh,*.erl,*.app.src,*.java,*.c,*.cc,Makefile,*.conf set noexpandtab tabstop=4 shiftwidth=4
	autocmd BufNewFile,BufReadPost *.py set tabstop=4 shiftwidth=4
	autocmd BufNewFile,BufReadPost *.es6 set filetype=javascript
	autocmd BufNewFile,BufReadPost *.go set noexpandtab tabstop=8 shiftwidth=8
	" vim's default indenting of erlang is fucking annoying and mixes
	" tabs/spaces. Just turn it off, I'll deal with just autoindent thanks
	autocmd BufNewFile,BufReadPost *.erl filetype plugin indent off
augroup END

" Whitespace highlighting/deleting
highlight ExtraWhitespace ctermbg=darkred guibg=#382424
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufWritePre * :%s/\s\+$//e


" ------------------------------------------------------------------------------
"  Plugin config
" ------------------------------------------------------------------------------
" Fzy
" ---
function! FzyCommand(choice_command, vim_command)
	try
		let output = system(a:choice_command . " | fzy ")
	catch /Vim:Interrupt/
		" Swallow errors from ^C, allow redraw! below
	endtry
	redraw!
	if v:shell_error == 0 && !empty(output)
		exec a:vim_command . ' ' . output
	endif
endfunction

nnoremap <c-p> :call FzyCommand("ag . --nocolor -l -g ''", ":e")<cr>
