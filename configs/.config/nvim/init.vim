" ------------------------------------------------------------------------------
" Plugins
" ------------------------------------------------------------------------------
call plug#begin(stdpath('data') . '/plugged')

" Colours
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'

" Behavioural/Core
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Language support/integration
Plug 'editorconfig/editorconfig-vim'
Plug 'elixir-lang/vim-elixir'
Plug 'noprompt/vim-yardoc'

call plug#end()

let g:deoplete#enable_at_startup = 1

" ------------------------------------------------------------------------------
" Editing
" ------------------------------------------------------------------------------
set expandtab        " Spaces for tabs by default
set tabstop=2        " 2-space indents by default
set shiftwidth=2     " 2-space reindents by default
set pastetoggle=<F2> " Temporarily disable autoindent with <F2>

" ------------------------------------------------------------------------------
" Interface
" ------------------------------------------------------------------------------
colorscheme gruvbox
set number           " Show line numbers
set cursorline       " Highlight the current line
set colorcolumn=100  " Warning gutter for long lines
set winwidth=107     " Set a minimum width for the active split

" ------------------------------------------------------------------------------
" Keybindings
" ------------------------------------------------------------------------------
" Disable hotkey manpage lookups
noremap K <NOP>

" NERDTree
" --------
" exit vim when if nerdtree is the only buffer left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open/Close NERDTree
map <C-n> :NERDTreeToggle<CR>

" Pop open fuzzy file finder
map <C-p> :Files<CR>

" ------------------------------------------------------------------------------
" Automation
" -----------------------------------------------------------------------------
" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=darkred
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkred
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/

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
