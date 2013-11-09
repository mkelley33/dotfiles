" See also > Coming Home to Vim, Steve Losh
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" http://mirnazim.org/writings/vim-plugins-i-use/

" Type :version to see what vim features you have enabled
" ie. X11 or clipboard

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

" :help fo-table
set formatoptions=qn1

" Don't autocomment
" http://vim.wikia.com/wiki/Disable_automatic_comment_insertion
set formatoptions-=c
set formatoptions-=r
set formatoptions-=o

set list
set lcs=tab:▸\ ,eol:¬

filetype plugin on
set nu
set rnu
syntax on
" set transp=9
set t_Co=256
set background=dark
colorscheme molokai
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)
set guifont=Menlo:h12

" Turn off blinking cursor in command mode
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
"
" Disabled, because I don't really use handlebars that much.
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

" Don't highlight matching parens (visually it drives me nuts)
let loaded_matchparen = 1

" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=red guibg=red
augroup WhitespaceMatch
  " Remove ALL autocommands for the WhitespaceMatch group.
  autocmd!
  autocmd BufWinEnter * let w:whitespace_match_number =
    \ matchadd('ExtraWhitespace', '\s\+$')
  autocmd InsertEnter * call s:ToggleWhitespaceMatch('i')
  autocmd InsertLeave * call s:ToggleWhitespaceMatch('n')
augroup END
function! s:ToggleWhitespaceMatch(mode)
  let pattern = (a:mode == 'i') ? '\s\+\%#\@<!$' : '\s\+$'
    if exists('w:whitespace_match_number')
      call matchdelete(w:whitespace_match_number)
      call matchadd('ExtraWhitespace', pattern, 10, w:whitespace_match_number)
    else " Something went wrong, try to be graceful.
      let w:whitespace_match_number =  matchadd('ExtraWhitespace', pattern)
    endif
endfunction

