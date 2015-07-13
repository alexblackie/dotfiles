" ------------------------------------------------------------------------------
"  Bootstrap
" ------------------------------------------------------------------------------
set enc=utf-8
call pathogen#infect()


" ------------------------------------------------------------------------------
"  Text-editing
" ------------------------------------------------------------------------------
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
syntax on           " COLOURS!!!11!1
set background=dark
colorscheme jellybeans

highlight ColorColumn ctermbg=00

set colorcolumn=81
set noerrorbells
set novisualbell
set number
set ruler
set t_Co=256
set ttyfast " Gotta go fast!
set laststatus=2 " Always show bar

set incsearch " Show search results 'as you type'
set hlsearch
hi Search cterm=NONE ctermfg=black ctermbg=yellow

let &winwidth = 87 " Ensure a minimum width for active split


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

" Quick-close quickfix
map <leader>qq :cclose<CR>

" Clear highlights
map <leader>nh :nohl<CR>

" Run current file as a script
map <leader>r :!./%<CR>

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
	autocmd BufNewFile,BufReadPost *.sh,*.erl,*.java,*.c,*.cc,Makefile,*.conf set noexpandtab tabstop=4 shiftwidth=4
	autocmd BufNewFile,BufReadPost *.py set tabstop=4 shiftwidth=4
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
	\ 'component': {
		\ 'gitbranch': '%{gitbranch#name()}',
	\ },
	\ 'component_function': {
		\ 'filename': 'FullFilename'
	\ }
\ }

let g:lightline.active = {
	\ 'left': [
		\ [ 'mode', 'paste' ],
		\ [ 'gitbranch' ],
		\ [ 'readonly', 'filename', 'modified' ]
	\ ], 'right': [
		\ [ 'lineinfo' ],
		\ [ 'percent' ],
		\ [ 'fileformat', 'fileencoding', 'filetype' ]
	\ ]
\ }

function! FullFilename()
	return ('' != expand('%') ? expand('%') : '[Untitled]')
endfunction

" CtrlP.vim
" ---------
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command      = 'ag %s -l --nocolor -g ""'

" Markdown.vim
" ------------
let g:vim_markdown_folding_disabled = 1
