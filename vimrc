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

if has("mouse_sgr") " Fix mouse for really large Vim windows
  set ttymouse=sgr
else
  set ttymouse=xterm2
end

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
  colorscheme base16-atelierlakeside
  set guioptions=-t          " No goddamned toolbars
  set guifont=Source\ Code\ Pro\ 12
endif

if has("gui_macvim")    " If on a Mac
  set guifont=Menlo:h14
endif

set list listchars=tab:»·,trail:· " show extra space characters

" System
set noswapfile " Don't fucking care
set nobackup   " YOLO

set nostartofline " Don't reset cursor to start of line when moving around.
set magic         " Enable extended regexes.
set mouse=a       " Enable moouse in all in all modes.
set incsearch     " show search results in 'real-time'

set exrc    " enable per-directory .vimrc files
set secure  " disable unsafe commands in local .vimrc files

" Kick the arrow key habit
for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor

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
  autocmd BufNew,BufNewFile,BufRead COMMIT_EDITMSG :set textwidth=72
  autocmd BufNewFile,BufReadPost *.hamlbars set filetype=haml
  autocmd BufNewFile,BufReadPost *.styl set filetype=sass
augroup END

" RSpec.vim
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

let g:rspec_runner = "os_x_iterm"
let g:rspec_command = "!foreman run rspec {spec}"

" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    silent let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
nnoremap <leader>f :call SelectaCommand("find * -type f", "", ":e")<cr>
nnoremap <C-p> :call SelectaCommand("find * -type f", "", ":e")<cr>
