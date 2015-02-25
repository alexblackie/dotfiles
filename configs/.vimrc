" ------------------------------------------------------------------------------
"  Bootstrap
" ------------------------------------------------------------------------------
set enc=utf-8          " Force UTF-8 because fuckers
call pathogen#infect() " Init Pathogen


" ------------------------------------------------------------------------------
"  Text-editing
" ------------------------------------------------------------------------------
set autoindent       " Hit enter, re-indents according to last line
set backspace=2      " Use sane backspace behaviour
set noexpandtab      " Hard-tabs masterrace
set nocompatible     " Don't care about Vi compat
set nowrap           " Line wrapping is a sin
set smartcase        " More sane searching
set pastetoggle=<F2> " Stop the insane cascading-indents when pasting
set tabstop=4        " 4-space-sized tabs
set shiftwidth=4     " Instruct `<< >>` to match tabstop


" ------------------------------------------------------------------------------
"  UI Things
" ------------------------------------------------------------------------------
syntax on           " COLOURS!!!11!1

set background=dark " The only way to code is in darkness
colorscheme jellybeans

highlight ColorColumn ctermbg=00 guibg=black

set colorcolumn=81 " Highlight text over 80-characters
set cursorline      " Highlight current line
set cursorcolumn    " Highlight current column
set noerrorbells    " No bells
set novisualbell    " No visual bells
set nu              " Enable line numbers
set relativenumber  " Relative line numbers from cursor
set ruler           " Show cursor position
set t_Co=256        " LOTS OF COLOURS
set title           " Show the filename in the window titlebar.
set ttyfast         " Send more characters at a given time.
set laststatus=2    " Always show bar

if has("gui_running")
	set background=dark
	colorscheme jellybeans
	set guioptions=-t " No goddamned toolbars
	set noantialias
	set guifont=Fixed

	if has("gui_macvim")
	  set guifont=6x13:h13
	endif
endif

set hlsearch
hi Search cterm=NONE ctermfg=black ctermbg=yellow


" ------------------------------------------------------------------------------
" System
" ------------------------------------------------------------------------------
set exrc          " enable per-directory .vimrc files
set magic         " Enable extended regexes
set nobackup      " Call me naive, but Vim has never crashed
set nostartofline " Don't reset cursor to start of line when moving around.
set noswapfile    " Seriously don't care
set incsearch     " Show search results 'as you type'
set secure        " disable unsafe commands in per-directory .vimrc files

let &winwidth = 87 " Ensure a minimum width for active split


" ------------------------------------------------------------------------------
"  Mappings
" ------------------------------------------------------------------------------
" Move around splits with ctrl-{h,j,k,l}
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Unlearn peasantry
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Quick-close quickfix
map <leader>qq :cclose<CR>

" Clear highlights
map <leader>nh :nohl<CR>

" Run current file as a script
map <leader>r :!./%<CR>

" Compile and run Elixir
map <leader>E :!elixir %<CR>

" Run current project's test suite
map <leader>s :!./.test_runner<CR>
map <Leader>t :!./.test_runner %<CR>

" Center things
map <leader>c :center<CR>


" ------------------------------------------------------------------------------
"  Filetype-specific overrides
" ------------------------------------------------------------------------------
augroup filetypedetect
	autocmd BufNew,BufNewFile,BufRead *.txt,*.text,*.md,*.markdown :set textwidth=80
	autocmd BufNew,BufNewFile,BufRead COMMIT_EDITMSG :set textwidth=72
	autocmd BufNewFile,BufReadPost *.hamlbars set filetype=haml
	autocmd BufNewFile,BufReadPost *.styl set filetype=sass
	autocmd BufNewFile,BufReadPost *.info set filetype=dosini
	autocmd BufNewFile,BufReadPost rebar.config set filetype=erlang
	autocmd BufNewFile,BufReadPost *.app.src set filetype=erlang
augroup END

" ------------------------------------------------------------------------------
"  Automatic things
" ------------------------------------------------------------------------------
autocmd BufWritePre * :%s/\s\+$//e


" ------------------------------------------------------------------------------
"  Plugin config
" ------------------------------------------------------------------------------

" Tabularize.vim
" --------------
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a=> :Tabularize /=><CR>
vmap <Leader>a=> :Tabularize /=><CR>
nmap <Leader>a-> :Tabularize /-><CR>
vmap <Leader>a-> :Tabularize /-><CR>
nmap <Leader>a: :Tabularize /:\zs/l0l1<CR>
vmap <Leader>a: :Tabularize /:\zs/l0l1<CR>
nmap <Leader>a, :Tabularize /,\zs/l0l1<CR>
vmap <Leader>a, :Tabularize /,\zs/l0l1<CR>

" Lightline.vim
" -----------
let g:lightline = {
	\ 'colorscheme': 'jellybeans',
	\ }

" CtrlP.vim
" ---------
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command      = 'ag %s -l --nocolor -g ""'

" Markdown.vim
" ------------
let g:vim_markdown_folding_disabled = 1
