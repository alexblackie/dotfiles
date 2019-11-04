set enc=utf-8

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
set background=dark
colorscheme solarized
set t_Co=256

set colorcolumn=100
set noerrorbells
set number
set ruler
set cursorline
set laststatus=2 " Always show bar

set incsearch " Show search results 'as you type'
set hlsearch
highlight Search ctermbg=LightYellow ctermfg=Black cterm=NONE

set winwidth=107 " Ensure the active split can comfortably show at least 100 chars


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
" Disable hotkey manpage lookups
noremap K <NOP>


" ------------------------------------------------------------------------------
"  Automatic things
" ------------------------------------------------------------------------------

" Custom filetype style/syntax overrides
augroup filetypedetect
	" Hard-wrap plain text documents at 80
	autocmd BufNew,BufNewFile,BufRead *.txt,*.text,*.md,*.markdown set textwidth=80

	" Set git commit line length to kernel standard
	autocmd BufNew,BufNewFile,BufRead COMMIT_EDITMSG set textwidth=72

	" Stylus is just a worse Sass
	autocmd BufNewFile,BufReadPost *.styl set filetype=sass

	" Rebar and OTP are erlang
	autocmd BufNewFile,BufReadPost rebar.config set filetype=erlang
	autocmd BufNewFile,BufReadPost *.app.src set filetype=erlang

	" ES6 is javascript.
	autocmd BufNewFile,BufReadPost *.es6 set filetype=javascript

	" Jenkins declarative config is Groovy-based
	autocmd BufNewFile,BufReadPost Jenkinsfile* set filetype=groovy

	" TOML is pretty close enough to ini
	autocmd BufNewFile,BufReadPost *.toml set filetype=dosini

	" Terraform/HCL files are pretty similar to groovy, and tfvars are
	" basically just ini files.
	autocmd BufNewFile,BufReadPost *.tf set filetype=groovy
	autocmd BufNewFile,BufReadPost *.tfvars set filetype=dosini

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

" NERDTree
" --------
" exit vim when if nerdtree is the only buffer left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>
map <C-b> :NERDTreeFind<CR>

" ------------------------------------------------------------------------------
" Load local modifications
" ------------------------------------------------------------------------------
if filereadable(expand("~/.vimrc.local"))
	source ~/.vimrc.local
endif
