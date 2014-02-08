set nocompatible
filetype off

let mapleader = ","

"---- Exclude things from CtrlP and others when searching
set wildignore+=doc/*,*.swp,*.zip,log/*,tmp/*,.git/*

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"----let Vundle manage Vundle
Bundle 'gmarik/vundle'

"----my bundles here:
Bundle 'tpope/vim-sensible'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'MarcWeber/vim-addon-mw-utils'
" Bundle 'bling/vim-airline'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'kien/ctrlp.vim'
" Bundle 'pangloss/vim-javascript'
" Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-markdown'
Bundle 'tomtom/tlib_vim'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'vim-ruby/vim-ruby'

filetype plugin indent on

set tabstop=2
set shiftwidth=2
set expandtab
set number
set showcmd
set autoindent
set smartcase       " Case insensitive searches become sensitive with capitals
set smarttab        " sw at the start of the line, sts everywhere else
set visualbell
 
" let g:airline#extensions#tabline#enabled = 1
" map <C-n> :NERDTreeToggle<CR>

filetype plugin indent on

