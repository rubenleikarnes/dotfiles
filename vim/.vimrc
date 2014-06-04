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

Bundle 'tpope/vim-sensible'
Bundle 'chriskempson/base16-vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'editorconfig/editorconfig-vim'
" lean & mean status/tabline for vim thats light as air
Bundle 'bling/vim-airline'
" provides insert mode auto-completion for quotes, parens, brackets, etc.
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/nerdtree'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set guifont=Inconsolata\ for\ Powerline:h14


" Show line numbers
set number
" Enable syntax highighting
syntax enable
colorscheme base16-ocean
set background=dark
set guifont=Inconsolata\ for\ Powerline:h14


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

" Word wrap
set wrap
set linebreak
set nolist 
set textwidth=0
set wrapmargin=0


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
" Enables mouse by default
set mouse=a


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

" automatically populate the g:airline_symbols dictionary with the powerline symbols.
let g:airline_powerline_fonts = 1
