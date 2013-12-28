" Pathogen FTW
call pathogen#infect()

" Indenting and shit
set autoindent   " Hit enter, re-indents according to last line
set expandtab    " Space-indent masterrace
set tabstop=2    " 2-spaces
set shiftwidth=2 " Instruct `<< >>` to use 2 spaces

set pastetoggle=<F2> " Stop the insane cascading-indents when pasting

set nowrap " Line wrapping is a sin

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

syntax on           " COLOURS!!!11!1
set background=dark " The only way to code is in darkness
set t_Co=256        " LOTS OF COLOURS

if has("gui_running")        " If in GVim
  colorscheme jellybeans
  set guioptions=-t          " No goddamned toolbars
  set guifont=Source\ Code\ Pro\ for\ Powerline\ 9
endif

if has("gui_macvim")    " If on a Mac
  set guifont=Source\ Code\ Pro\ for\ Powerline:h12 " Fuck you, OSX Vim and your different syntax and font sizes
endif

let g:airline_powerline_fonts = 1 " Dem Symbols

let &colorcolumn=join(range(81,999),",") " Change BG for > 80 chars
highlight ColorColumn ctermbg=234 guibg=#1c1c1c

" System
set noswapfile " Don't fucking care
set nobackup   " YOLO

set nostartofline " Don't reset cursor to start of line when moving around.
set magic         " Enable extended regexes.
set mouse=a       " Enable moouse in all in all modes.

" CtrlP.vim
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore     = 'tmp'


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
