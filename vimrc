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
set expandtab        " Space-indent masterrace
set nocompatible     " Don't care about Vi compat
set nowrap           " Line wrapping is a sin
set shiftwidth=2     " Instruct `<< >>` to use 2 spaces
set pastetoggle=<F2> " Stop the insane cascading-indents when pasting
set tabstop=2        " 2-space tabs


" ------------------------------------------------------------------------------
"  UI Things
" ------------------------------------------------------------------------------
syntax on           " COLOURS!!!11!1

set background=dark " The only way to code is in darkness
colorscheme solarized

highlight ColorColumn ctermbg=233 guibg=black

set colorcolumn=81 " Highlight text over 80-characters
set cursorline      " Highlight current line
set noerrorbells    " No bells
set novisualbell    " No visual bells
set nu              " Enable line numbers
set relativenumber  " Relative line numbers from cursor
set ruler           " Show cursor position
set t_Co=256        " LOTS OF COLOURS
set title           " Show the filename in the window titlebar.
set ttyfast         " Send more characters at a given time.

if has("mouse_sgr") " Fix mouse for really large Vim windows
  set ttymouse=sgr
else
  set ttymouse=xterm2
end

if has("gui_running")
  set guioptions=-t " No goddamned toolbars
endif

set list listchars=tab:»·,trail:· " show extra space characters


" ------------------------------------------------------------------------------
" System
" ------------------------------------------------------------------------------
set exrc          " enable per-directory .vimrc files
set magic         " Enable extended regexes
set mouse=a       " Enable mouse in all in all modes
set nobackup      " Call me naive, but Vim has never crashed
set nostartofline " Don't reset cursor to start of line when moving around.
set noswapfile    " Seriously don't care
set incsearch     " Show search results 'as you type'
set secure        " disable unsafe commands in per-directory .vimrc files

let &winwidth = 90 " Don't let active pane be under 90 characters wide


" ------------------------------------------------------------------------------
"  Mappings
" ------------------------------------------------------------------------------
" Move around splits with ctrl-{h,j,k,l}
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Quick-close quickfix
map <leader>qq :cclose<CR>


" ------------------------------------------------------------------------------
"  Filetype-specific overrides
" ------------------------------------------------------------------------------
augroup filetypedetect
  autocmd BufNew,BufNewFile,BufRead *.txt,*.text,*.md,*.markdown :set textwidth=80
  autocmd BufNew,BufNewFile,BufRead COMMIT_EDITMSG :set textwidth=72
  autocmd BufNewFile,BufReadPost *.hamlbars set filetype=haml
  autocmd BufNewFile,BufReadPost *.styl set filetype=sass
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
nmap <Leader>a: :Tabularize /:\zs/l0l1<CR>
vmap <Leader>a: :Tabularize /:\zs/l0l1<CR>
nmap <Leader>a, :Tabularize /,\zs/l0l1<CR>
vmap <Leader>a, :Tabularize /,\zs/l0l1<CR>

" RSpec.vim
" ---------
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

let g:rspec_runner = "os_x_iterm"
let g:rspec_command = "!foreman run rspec {spec}"

" Airline.vim
" -----------
let g:airline_left_sep  = ''
let g:airline_right_sep = ''

" CtrlP.vim
" ---------
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore     = '\v[\/]\.(git|hg|svn|sass-cache)$'
let g:ctrlp_custom_ignore     = 'node_modules\|bower_components\|coverage\|build'
let g:ctrlp_user_command      = 'ag %s -l --nocolor -g ""'

" Markdown.vim
" ------------
let g:vim_markdown_folding_disabled = 1
