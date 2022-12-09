
set nocompatible
filetype on
filetype plugin on
filetype indent on

syntax on

set number

set shiftwidth=4
set tabstop=4

set expandtab
set nobackup


set nowrap

set incsearch

set ignorecase

set smartcase

set showcmd

set showmode

set showmatch

set hlsearch

set history=1000

set wildmenu

set wildmode=list:longest

set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

set laststatus=2

highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')


  Plug 'dense-analysis/ale'
  Plug 'itchyny/lightline.vim'
  Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
  Plug 'sheerun/vim-polyglot'

call plug#end()

" }}}

" Turns on syntax highlighting
syntax on

if has('termguicolors')
    " Turns on true terminal colors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

    " Turns on 24-bit RGB color support
    set termguicolors

    " Defines how many colors should be used. (maximum: 256, minimum: 0)
    set t_Co=256
endif

set background=dark
