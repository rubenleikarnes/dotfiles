" .vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Genral
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" No compatibility
set nocompatible
filetype off
set encoding=utf-8
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vundle 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

Bundle 'Raimondi/delimitMate'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-sensible'
Bundle 'mhinz/vim-startify'
Bundle 'chriskempson/base16-vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Syntax highlighting

" Enable syntax highighting
syntax enable
" 256 colours, please
set t_Co=256
"let base16colorspace=256
" Scheme
set background=dark
"colorscheme Tomorrow-Night
colorscheme base16-ocean
set guifont=Inconsolata\ for\ Powerline


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



" Interactions

" Start scrolling slightly before the cursor reaches an edge
set scrolloff=7
set sidescrolloff=7
" Scroll sideways 7 characters at a time, rather than a screen at a time
set sidescroll=7
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
" Enables mouse by default
set mouse=a

" Word wrap
set wrap
set linebreak
set nolist 
set textwidth=0
set wrapmargin=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom keyboard shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Hotkeys 
map <silent> <C-m> :NERDTreeToggle<CR>
map <silent> <C-d> :NERDTreeToggle<CR>
map <silent> <C-n> :NERDTreeFocus<CR>
map <silent> <C-b> :VimFocus<CR>
"map <silent> <C-M> :TagbarToggle<CR>

" Use hjkl to change foucs to other buffers
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree 
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden=1
" Focus file on open
autocmd VimEnter * wincmd l
" Close vim if only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 &&exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Activates neocomplcache
let g:neocomplcache_enable_at_startup = 1

" automatically populate the g:airline_symbols dictionary with the powerline symbols.
let g:airline_powerline_fonts = 1

" Startify startscreen for vim
let g:startify_list_order = ['dir', 'files', 'bookmarks', 'sessions']
let g:startify_session_detection = 1
let g:startify_skiplist = ['.DS_Store', '.git']
