" ------------------------------------------------------------------------------
" Plugins
" ------------------------------------------------------------------------------
call plug#begin(stdpath('data') . '/plugged')

" Colours and UI
Plug 'morhetz/gruvbox'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'hoob3rt/lualine.nvim'

" Behavioural/Core
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Language support/integration
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'

call plug#end()

" ------------------------------------------------------------------------------
" Plugin and system-level setup
" ------------------------------------------------------------------------------

lua << EOF
vim.g.tokyonight_style = "night"

require("lualine").setup({
	options = {
		theme = "tokyonight",
		lower = true,
		padding = 1,
		section_separators = {"", ""},
		component_separators = {"", ""},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "filename" },
		lualine_c = { },
		lualine_x = { },
		lualine_y = { "filetype" },
		lualine_z = { "location" },
	},
	extensions = { },
})

require("nvim-treesitter.configs").setup({
	ensure_installed = "maintained",
	ignore_install = { },
	highlight = { enable = true },
})
EOF

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

" Open a split with a Terminal pre-populated with the current buffer's file
" path trailing your cursor.
"
" e for execute
function ExecuteOnCurrentFile(path)
	let width = 128
	let height = 30
	let buf = nvim_create_buf(v:false, v:true)
	let ui = nvim_list_uis()[0]
	let opts = {
		\ 'relative': 'editor',
		\ 'width': width,
		\ 'height': height,
		\ 'col': (ui.width/2) - (width/2),
		\ 'row': (ui.height/2) - (height/2),
		\ 'border': 'shadow'
		\ }
	let win = nvim_open_win(buf, 1, opts)
	terminal
	put =' ' . a:path . \"\<c-l>\<c-a>\"
	execute 'normal! I'
endfunction
nmap <Leader>e :call ExecuteOnCurrentFile(expand('%'))<CR>

" ------------------------------------------------------------------------------
" Automation
" ------------------------------------------------------------------------------
" Highlight trailing whitespace
autocmd BufWinEnter * match ErrorMsg /\s\+$/
autocmd InsertLeave * match ErrorMsg /\s\+$/
autocmd InsertEnter * match ErrorMsg /\s\+\%#\@<!$/

" Trim trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
