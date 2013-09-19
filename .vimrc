call pathogen#infect()

filetype plugin indent on

set nocompatible

set noerrorbells
set novisualbell

set nowrap

set nu

syntax on
set background=dark
set t_Co=256

set expandtab
set tabstop=2
set shiftwidth=2

set noswapfile
set nobackup

set title " Show the filename in the window titlebar.
set ttyfast " Send more characters at a given time.
set ttymouse=xterm " Set mouse type to xterm.

set nostartofline " Don't reset cursor to start of line when moving around.
set magic " Enable extended regexes.
set mouse=a " Enable moouse in all in all modes.

" Close Quickfix window (,qq)
map <leader>qq :cclose<CR>

set relativenumber

command W w
nnoremap Y y$

"highlight ExtraWhitespace ctermbg=red guibg=red
"match ExtraWhitespace /\s\+$/

set ruler " Show the cursor position

autocmd InsertLeave * redraw!

if has("gui_running")
	colorscheme solarized
  set guioptions=-t
  set guifont=PT\ Mono\ 9
endif

if has("gui_macvim")
  set guifont=Menlo:h14 " Fuck you, OSX Vim.
endif

