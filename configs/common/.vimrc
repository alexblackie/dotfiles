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
set background=dark
colorscheme solarized
set t_Co=256

set colorcolumn=80
set noerrorbells
set number
set ruler
set cursorline
set laststatus=2 " Always show bar

set incsearch " Show search results 'as you type'
set hlsearch
highlight Search ctermbg=LightYellow ctermfg=Black cterm=NONE

let &winwidth = 87 " Ensure a minimum width for active split

if has('mouse')
  set mouse=a
endif


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
	autocmd BufNew,BufNewFile,BufRead *.txt,*.text,*.md,*.markdown set textwidth=80
	autocmd BufNew,BufNewFile,BufRead COMMIT_EDITMSG set textwidth=72
	autocmd BufNewFile,BufReadPost *.hamlbars set filetype=haml
	autocmd BufNewFile,BufReadPost *.styl set filetype=sass
	autocmd BufNewFile,BufReadPost *.info set filetype=dosini
	autocmd BufNewFile,BufReadPost rebar.config set filetype=erlang
	autocmd BufNewFile,BufReadPost *.app.src set filetype=erlang
	autocmd BufNewFile,BufReadPost *.es6 set filetype=javascript
	autocmd BufNewFile,BufReadPost Jenkinsfile* set filetype=groovy
	autocmd BufNewFile,BufReadPost *.toml set filetype=dosini
	" vim's default indenting of erlang is fucking annoying and mixes
	" tabs/spaces. Just turn it off, I'll deal with just autoindent thanks
	autocmd BufNewFile,BufReadPost *.erl filetype plugin indent off
	autocmd FileType yaml setl indentkeys-=<:>
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

" Goyo
" ----
function! ActivateGoyo()
	set noshowmode
endfunction

function! DisableGoyo()
	set showmode
endfunction

autocmd! User GoyoEnter nested call ActivateGoyo()
autocmd! User GoyoLeave nested call DisableGoyo()

nnoremap <c-g><c-y> :Goyo<cr>

" ------------------------------------------------------------------------------
" Load local modifications
" ------------------------------------------------------------------------------
if filereadable(expand("~/.vimrc.local"))
	source ~/.vimrc.local
endif
