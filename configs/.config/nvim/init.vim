" ------------------------------------------------------------------------------
" Plugins
" ------------------------------------------------------------------------------
call plug#begin(stdpath('data') . '/plugged')

" Colours
Plug 'morhetz/gruvbox'
Plug 'ghifarit53/tokyonight-vim'

" Behavioural/Core
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Language support/integration
Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'

call plug#end()

let g:coc_global_extensions = [
	\ 'coc-elixir',
	\ 'coc-java',
	\ 'coc-go',
	\ 'coc-solargraph'
	\]

" ------------------------------------------------------------------------------
" Editing
" ------------------------------------------------------------------------------
set expandtab        " Spaces for tabs by default
set tabstop=2        " 2-space indents by default
set shiftwidth=2     " 2-space reindents by default

" ------------------------------------------------------------------------------
" Interface
" ------------------------------------------------------------------------------
set termguicolors       " Use 'true' GUI colours, even in a terminal
set background=dark    " Use the dark variant
set number              " Show the line number of the current line
set cursorline          " Highlight the current line
set colorcolumn=80,100  " Warning gutter for long lines
set winwidth=107        " Set a minimum width for the active split

let g:tokyonight_style = 'night'

colorscheme tokyonight

" ------------------------------------------------------------------------------
" Keybindings
" ------------------------------------------------------------------------------
" Disable hotkey manpage lookups
noremap K <NOP>

" exit vim when if nerdtree is the only buffer left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Toggle NERDTree visibility
map <Leader>t :NERDTreeToggle<CR>

" Expand and select current buffer's file in NERDTree
map <Leader>b :NERDTreeFind<CR>

" Pop open fuzzy file finder
map <Leader>f :Files<CR>

" ctrl-space to trigger code completion
inoremap <silent><expr> <c-space> coc#refresh()

" Highlight the hovered symbol and its references, if supported
autocmd CursorHold * silent call CocActionAsync('highlight')

" Enable code navigation
nmap <silent> gd <Plug>(coc-definition)

" ------------------------------------------------------------------------------
" Automation
" ------------------------------------------------------------------------------
" Highlight trailing whitespace
autocmd BufWinEnter * match ErrorMsg /\s\+$/
autocmd InsertLeave * match ErrorMsg /\s\+$/
autocmd InsertEnter * match ErrorMsg /\s\+\%#\@<!$/

" Trim trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
