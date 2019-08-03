" Custom hotkeys "
" * Leader: , "
" * Fast save: <leader>,"
" * Nerdtree draw: <leader>k "
" * Change buffer focus: <C>hjkl "



" NVIM "


" Plug vim "
call plug#begin('~/.vim/plugged')

	" colorschemes "
	Plug 'chriskempson/base16-vim'
	Plug 'mhartington/oceanic-next'

	" Utilities "
	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " Filedraw, but only load on opening the draw "
	Plug 'vim-airline/vim-airline' " Status line with often used info (line number, git status etc) "
	Plug 'vim-airline/vim-airline-themes' " themes for vim-airline "
	Plug 'editorconfig/editorconfig-vim' " Autoload .editorconfig "
	Plug 'airblade/vim-gitgutter' " Git status in the gutter"
	Plug 'nacitar/terminalkeys.vim' " Som things to improve key support in rxvt "
	Plug 'wincent/terminus' " Terminus enhances Vim's and Neovim's integration with the terminal when using tmux "
	Plug 'ryanoasis/vim-devicons' " Devicons in font "
call plug#end()


set nocompatible " not compatible with vi "
set autoread " detect when a file is changed "
filetype off
set encoding=utf-8
set clipboard=unnamed " Use the OS clipboard by default (on versions compiled with `+clipboard`)"
set shortmess=atI " hide startup message "
set laststatus=2 " Show status line "
set ttyfast " faster redrawing "
set diffopt+=vertical

" Visuals "
syntax on " switch syntax highlighting on "
set guifont=Hack\ Nerd\ Font:h15
highlight Comment cterm=italic
set number " Show line numbers "
set relativenumber " show relative line numbers "
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set backspace=indent,eol,start " make backspace behave in a sane manner "
set history=1000 " change history to 1000 "


set background=dark " Dark theme "

set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors"
colorscheme OceanicNext
let g:airline_theme='oceanicnext'
"let base16colorspace=256"  " Access colors present in 256 colorspace"


if &term =~ '256color'
	set t_ut=
endif

" Abbreviations "
abbr funciton function
abbr teh the
abbr tempalte template
abbr fitler filter

" set a map leader for more key combos "
let mapleader = ','
let g:mapleader = ','


set so=5 " number of lines to the cursors - when moving vertical "
set wildmenu " enhanced command line completion "
set hidden " current buffer can be put into background "
set showcmd " show incomplete commands "
set noshowmode " don't show which mode disabled for PowerLine "
set wildmode=list:longest " complete files like a shell "
set shell=$SHELL
set cmdheight=1 " command bar height "

set title " set terminal title "


" Searching "
set ignorecase " case insensitive searching "
set smartcase " case-sensitive if expresson contains a capital letter "
set hlsearch
set incsearch " set incremental search, like modern browsers "
set nolazyredraw " don't redraw while executing macros "

set magic " Set magic on, for regex "

set showmatch " show matching braces "
set mat=2 " how many tenths of a second to blink "


" error bells "
set noerrorbells
set visualbell
set t_vb=
set tm=500


" Tab control "
set noexpandtab " insert tabs rather than spaces for <Tab> "
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop' "
set tabstop=4 " the visible width of tabs "
set softtabstop=4 " edit as if the tabs are 4 characters wide "
set shiftwidth=4 " number of spaces to use for indent and unindent "
set shiftround " round indent to a multiple of 'shiftwidth' "
set completeopt+=longest


" Word wrap "
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0


" highlight conflicts "
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Enables mouse "
if has('mouse')
	set mouse=a
	" set ttymouse=xterm2 "
endif

" Use hjkl to change foucs to other buffers "
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

nmap <leader>, :w<cr> " shortcut to save "
noremap Q <NOP> " disable Ex mode "

nmap <leader>. <c-^> " switch between current and last buffer "
vnoremap . :normal .<cr> " enable . command in visual mode "

" Disable Arrow keys in Escape mode "
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode "
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Set relevant filetypes "
au BufRead,BufNewFile *.scss set filetype=css
au BufRead,BufNewFile *.md set filetype=markdown

" . "
" Section Plugins "
" . "

" close NERDTree after a file is opened "
let g:NERDTreeQuitOnOpen=1
" Focus file on open "
"autocmd VimEnter * wincmd l"
" Close vim if only NERDTree is open "
autocmd bufenter * if (winnr("$") == 1 &&exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" remove some files by extension"
let NERDTreeIgnore = ['\.js.map$']
" Toggle NERDTree "
nmap <silent> <leader>k :NERDTreeToggle<cr>

let NERDTreeMinimalUI = 1
let NERDTreeShowHidden=1

let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#formatter = 'unique_tail'
