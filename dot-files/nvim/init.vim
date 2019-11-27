" Settings ---------------------------------------------- {{{
if has("nvim")
	" set guicursor=
	let $VTE_VERSION="100"
	set inccommand=nosplit
else
	set nocompatible
	set ruler
	set showcmd
	set incsearch               " search as characters are entered
	set hlsearch                " highlight matches
	set wildmenu               " visual autocomplete for command menu
	set autoread
	set autoindent
	set laststatus=2
	set encoding=utf-8
	set backspace=indent,eol,start
	set display=lastline
endif
set hidden
set list
set listchars=tab:│·,trail:·,extends:→
" set mouse=a
set visualbell    " stop that ANNOYING beeping
set textwidth=0
set wrap
" set linebreak
set cursorline              " highlight current line
set showmatch               " highlight matching [{()}]
set wildmode=list:longest,full
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*.pdf,*.psd
set lazyredraw              " redraw only when we need to.
"set colorcolumn=80
"highlight ColorColumn ctermbg=80
set relativenumber number
"Improve Search and Replace
" set gdefault" Never have to type /g at the end of search / replace again
set ignorecase              " ignore case when searching
set smartcase" make search case Sensitive if it contains an Uppercase letter otherwise search is case insensitive
" Code Folding
set foldenable              " enable folding
set foldmethod=indent
set foldnestmax=5
set foldlevelstart=99
" Disable backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile
set clipboard=unnamed " copy to system clipboard
set splitbelow
set splitright
" Spaces / Tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set undofile
set undodir=$HOME/.VIM_UNDOS
" see help 'complete' for details
set complete=.,w,b,u,t
set shortmess+=c
" set fillchars+=vert:\|  " remove chars from seperators


" Put your python path below
let g:python_host_prog  = 'python'
let g:python3_host_prog = '/usr/bin/python3'
"}}}

"Plugins ----------------------------------------------- {{{
call plug#begin('~/.config/nvim/plugged')
Plug 'tomtom/tcomment_vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'machakann/vim-highlightedyank'
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jpo/vim-railscasts-theme'
Plug 'ryanoasis/vim-devicons'
call plug#end()
" }}}

" Airline ----------------------------------------------- {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_type = 0
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
			\ '0': '0 ',
			\ '1': '1 ',
			\ '2': '2 ',
			\ '3': '3 ',
			\ '4': '4 ',
			\ '5': '5 ',
			\ '6': '6 ',
			\ '7': '7 ',
			\ '8': '8 ',
			\ '9': '9 ',
\}
" }}}


" Vim-Devicons --------------------------------------------------------------{{{
let g:DevIconsEnableNERDTreeRedraw = 0
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = ''
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['css'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['html'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['json'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['md'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['sql'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['py'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['zip'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['txt'] = ''
if exists("g:loaded_webdevicons")
	call webdevicons#refresh()
endif
	" }}}


"Color schemes ----------------------------------------------- {{{
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
silent! colo railscasts
let g:airline_theme='bubblegum'
hi CursorLineNR guifg=#ffffff
" }}}

"AutoCommands ----------------------------------------------- {{{
source ~/.config/nvim/autocommands.vim
" }}}

"Mappings ----------------------------------------------- {{{
source ~/.config/nvim/mappings.vim
" }}}
