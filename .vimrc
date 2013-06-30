" .vimrc


" No compatibility
set nocompatible
set encoding=utf-8
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed


" Plugins
execute pathogen#infect()

	
" NERDTree 
autocmd vimenter * NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden=1
" Focus file on open
autocmd VimEnter * wincmd l
" Close vim if only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif



" Syntax highlighting

" Detect filetype
filetype plugin on
" Enable syntax highighting
syntax enable
" 256 colours, please
set t_Co=256
" Scheme
set background=dark
colorscheme Tomorrow-Night-Bright



" Set relevant filetypes
au BufRead,BufNewFile *.scss set filetype=css
au BufRead,BufNewFile *.md set filetype=markdown



" Tabs, indentation and lines

filetype plugin indent on
" tabs instead of spaces
set noexpandtab
set tabstop=4
set shiftwidth=4
" Round indent to nearst multiple of 4
set shiftround
" No line-wrapping
set nowrap



" Interactions

" Start scrolling slightly before the cursor reaches an edge
set scrolloff=3
set sidescrolloff=5
" Scroll sideways a character at a time, rather than a screen at a time
set sidescroll=1
"Allow motions and back-spacing over line-endings etc
set backspace=indent,eol,start
set whichwrap=h,l,b,<,>,~,[,]
" Underscores denote words
set iskeyword-=_
" Disable error bells
set noerrorbells



" Visual decorations

" hide startup message
set shortmess=atI
" Show status line
set laststatus=2
" Show what mode you’re currently in
set showmode
" Show what commands you’re typing
set showcmd
" Allow modelines
set modeline
" Show current line and column position in file
set ruler
" Show file title in terminal tab
set title
" Show line numbers
set number
"Highlight current line
set cursorline
" Don’t keep results highlighted after searching...
set nohlsearch
" ...just highlight as we type
set incsearch
" Ignore case when searching...
set ignorecase
" ...except if we input a capital letter
set smartcase
" Enhance command-line completion
set wildmenu
" Change mapleader
let mapleader=","



" Word wrap
set wrap
set linebreak
set nolist 
set textwidth=0
set wrapmargin=0



" Hotkeys 
map <silent> <C-m> :NERDTreeToggle<CR>
map <silent> <C-n> :NERDTreeFocus<CR>
map <silent> <C-b> :VimFocus<CR>
map <silent> <C-M> :TagbarToggle<CR>

" Use hjkl to change foucs to other buffers
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

