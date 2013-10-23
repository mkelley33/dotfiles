" See also > Coming Home to Vim, Steve Losh
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" http://mirnazim.org/writings/vim-plugins-i-use/

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'airblade/vim-gitgutter'
Bundle 'danchoi/ruby_bashrockets.vim'
Bundle 'edsono/vim-matchit'
Bundle 'godlygeek/tabular'
Bundle 'majutsushi/tagbar'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rvm'
Bundle 'tpope/vim-unimpaired'
Bundle 'daviddavis/vim-colorpack'
Bundle 'kien/ctrlp.vim'
Bundle 'rosenfeld/conque-term'

set nocompatible
set foldmethod=indent
set foldlevel=9999
" Not sure what modelines are, but apparently they open a security
" exploit so lets kill 'em.
set modelines=0

set tabstop=2
set shiftwidth=2
set softtabstop=2
set backspace=2
set expandtab

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar

" Other reasonable defaults
set encoding=utf-8
set scrolloff=10
set autoindent
set visualbell
set cursorline
set ttyfast
set ruler
set undofile
let mapleader = ","
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
set wrap
set textwidth=79
set formatoptions=qrn1
set list
set listchars=tab:▸\ ,eol:¬

set nu
set rnu 
syntax on
"set transp=9
set t_Co=256
set background=dark
colorscheme molokai
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)
set guifont=Menlo:h12

" turn off blinking cursor in command mode
set gcr=n:blinkon0
set lazyredraw

" I can't type
cmap W w
cmap Wa wa
cmap WA wa
cmap Wq wq

" Move between splits
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" Handlebars syntax highlighting
" https://github.com/nono/vim-handlebars
" http://www.vim.org/scripts/script.php?script_id=3638
" au BufRead,BufNewFile *.handlebars,*.hbs set ft=handlebars

" Press enter to clear highlighting
noremap - :nohl<cr>-
noremap <cr> :nohl<cr><cr>

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif
