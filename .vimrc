" See also > Coming Home to Vim, Steve Losh
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" http://mirnazim.org/writings/vim-plugins-i-use/
" Press ; twice to enter command mode 
inoremap ;; <esc>
vnoremap ;; <esc> 

" Plugin: vim-pathogen
" https://github.com/tpope/vim-pathogen
" http://www.vim.org/scripts/script.php?script_id=2332
" Note that you need to invoke the pathogen functions before invoking 'filetype
" plugin indent on' if you want it to load ftdetect files. On Debian (and probably 
" other distros), the system vimrc does this early on, so you actually need to 
" 'filetype off' before 'filetype plugin indent on' to force reloading.
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin on

" Remove vi compatibility. Why?
" Acccording to Steve Losh you gain functionality by do this.
set nocompatible
set foldmethod=indent
" Not sure what modelines are, but apparently they open a security
" exploit so lets kill 'em.
set modelines=0

set tabstop=2
set shiftwidth=2
set softtabstop=2
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
set colorcolumn=80
set list
set listchars=tab:▸\ ,eol:¬
set number
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

set laststatus=2
noremap <leader>o <Esc>:CommandT<CR>
noremap <leader>O <Esc>:CommandTFlush<CR>
noremap <leader>m <Esc>:CommandTBuffer<CR>

"For efficiency purposes I have configured CloseTag to load only for html/xml like files
autocmd FileType html,eruby let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,eruby source ~/.vim/bundle/closetag/plugin/closetag.vim

nnoremap <silent> <F3> :YRShow<cr>
inoremap <silent> <F3> <ESC>:YRShow<cr>

let g:showmarks_marks = "abcdefghijklmnop" 
nnoremap <leader>l :TagbarToggle<CR>
au! BufWritePost $MYVIMRC source %

