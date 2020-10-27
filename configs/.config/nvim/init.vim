" ------------------------------------------------------------------------------
" Plugins
" ------------------------------------------------------------------------------
call plug#begin(stdpath('data') . '/plugged')

" Colours
Plug 'morhetz/gruvbox'

" Behavioural/Core
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Language support/integration
Plug 'editorconfig/editorconfig-vim'
Plug 'elixir-lang/vim-elixir'
Plug 'noprompt/vim-yardoc'
Plug 'LnL7/vim-nix'

call plug#end()

let g:coc_global_extensions = [
	\ 'coc-pairs',
	\ 'coc-json',
	\ 'coc-elixir'
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
colorscheme gruvbox
set relativenumber   " Show line numbers relative to current line.
set number           " Show the line number of the current line
set cursorline       " Highlight the current line
set colorcolumn=100  " Warning gutter for long lines
set winwidth=107     " Set a minimum width for the active split

" ------------------------------------------------------------------------------
" Keybindings
" ------------------------------------------------------------------------------
" Disable hotkey manpage lookups
noremap K <NOP>

" exit vim when if nerdtree is the only buffer left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Toggle NERDTree visibility
map <C-n> :NERDTreeToggle<CR>

" Expand and select current buffer's file in NERDTree
map <C-b> :NERDTreeFind<CR>

" Pop open fuzzy file finder
map <C-p> :Files<CR>

" Escape terminals more naturally with esc
tnoremap <Esc> <C-\><C-n>

" ctrl-space to trigger code completion
inoremap <silent><expr> <c-space> coc#refresh()

" ------------------------------------------------------------------------------
" Automation
" ------------------------------------------------------------------------------
" Highlight trailing whitespace
autocmd BufWinEnter * match ErrorMsg /\s\+$/
autocmd InsertLeave * match ErrorMsg /\s\+$/
autocmd InsertEnter * match ErrorMsg /\s\+\%#\@<!$/

" Trim trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Custom filetype style/syntax overrides
augroup filetypedetect
	" Hard-wrap plain text documents at 80
	autocmd BufNew,BufNewFile,BufRead *.txt,*.text,*.md,*.markdown set textwidth=80

	" Set git commit line length to kernel standard
	autocmd BufNew,BufNewFile,BufRead COMMIT_EDITMSG set textwidth=72

	" Typescript, and Typescript JSX is basically JavaScript
	autocmd BufNewFile,BufReadPost *.ts,*.tsx set filetype=javascript

	" Jenkins declarative config is Groovy-based
	autocmd BufNewFile,BufReadPost Jenkinsfile* set filetype=groovy

	" TOML is pretty close enough to ini
	autocmd BufNewFile,BufReadPost *.toml set filetype=dosini

	" Terraform files are pretty similar to groovy, and tfvars are basically
	" just ini files.
	autocmd BufNewFile,BufReadPost *.tf set filetype=groovy
	autocmd BufNewFile,BufReadPost *.tfvars set filetype=dosini
augroup END
