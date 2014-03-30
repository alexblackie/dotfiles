" Fix the shit
set enc=utf-8

" Pathogen FTW
call pathogen#infect()

" Indenting and shit
set autoindent   " Hit enter, re-indents according to last line
set expandtab    " Space-indent masterrace
set tabstop=2    " 2-spaces
set shiftwidth=2 " Instruct `<< >>` to use 2 spaces

set pastetoggle=<F2> " Stop the insane cascading-indents when pasting

set nowrap " Line wrapping is a sin

set nocompatible

" FUCK them bells
set noerrorbells
set novisualbell

" UI
set nu             " Line numbers
set relativenumber " Line numbers relative from current cursor position

set ruler " Show the cursor position

set title          " Show the filename in the window titlebar.
set ttyfast        " Send more characters at a given time.
set ttymouse=xterm " Set mouse type to xterm.

set backspace=2 " make backspace work like most other apps

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

let g:airline_left_sep=''
let g:airline_right_sep=''

syntax on           " COLOURS!!!11!1
set background=dark " The only way to code is in darkness
set t_Co=256        " LOTS OF COLOURS

colorscheme grb256 " Fits with terminal colours better

let &colorcolumn=81 " Change show 80-char line
highlight ColorColumn ctermbg=233 guibg=#151515

if has("gui_running")        " If in GVim
  colorscheme base16-tomorrow
  set guioptions=-t          " No goddamned toolbars
  set guifont=Source\ Code\ Pro\ for\ Powerline\ 10
endif

if has("gui_macvim")    " If on a Mac
  set guifont=Source\ Code\ Pro\ for\ Powerline:h11 " Fuck you, OSX Vim and your different syntax and font sizes
endif

set list listchars=tab:»·,trail:· " show extra space characters

" System
set noswapfile " Don't fucking care
set nobackup   " YOLO

set nostartofline " Don't reset cursor to start of line when moving around.
set magic         " Enable extended regexes.
set mouse=a       " Enable moouse in all in all modes.
set incsearch     " show search results in 'real-time'

" Kick the arrow key habit
for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor

" CtrlP.vim
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore     = 'tmp'
let g:ctrlp_custom_ignore     = 'git\|node_modules\|bower_components\|sass-cache\|js-dist'

" Autoresize.vim
let &winwidth = 90

" Tabular.vim
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a=> :Tabularize /=><CR>
vmap <Leader>a=> :Tabularize /=><CR>
nmap <Leader>a: :Tabularize /:\zs/l0l1<CR>
vmap <Leader>a: :Tabularize /:\zs/l0l1<CR>
nmap <Leader>a, :Tabularize /,\zs/l0l1<CR>
vmap <Leader>a, :Tabularize /,\zs/l0l1<CR>

" Close Quickfix window (\qq)
map <leader>qq :cclose<CR>

" Filetype-specific overrides
augroup filetypedetect
  autocmd BufNew,BufNewFile,BufRead *.txt,*.text,*.md,*.markdown :set textwidth=80
augroup END

autocmd BufNewFile,BufReadPost *.hamlbars set filetype=haml
