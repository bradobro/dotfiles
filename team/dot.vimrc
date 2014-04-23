set nocompatible
filetype off

" set scrolloff=8
set foldmethod=syntax
set nofoldenable
let g:ctrlp_working_path_mode = 'a'

nnoremap <silent> <Space> za
nnoremap <silent> <F8> zM
nnoremap <silent> <F9> zR
"---------resizing splits----------------------------------------------------
noremap = <esc><C-w>>
    " = increase size of vertically split window
noremap - <esc><C-w><
    " - decrease size of vertically split window
noremap + <esc><C-w>+
    " + increase size of horizontally split window
noremap _ <esc><C-w>-
    " _ decrease size of horizontally split window


noremap <F1> <nop>
inoremap <F1> <nop>
    " disable the F1 help key because I hit it when trying to hit escape


" reload .vimrc
noremap <Leader>vrc :so $MYVIMRC<CR>

let mapleader = ","

"---- Exclude things from CtrlP and others when searching
set wildignore+=doc/*,*.swp,*.zip,log/*,tmp/*,.git/*,node_modules/*
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"----let Vundle manage Vundle
Bundle 'gmarik/vundle'

"----our experimental bundles

" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'altercation/vim-colors-solarized'

"----team bundles
Bundle 'bling/vim-airline'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'chriskempson/base16-vim'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'kana/vim-textobj-user'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'pangloss/vim-javascript'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tomtom/tlib_vim'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-surround'
Bundle 'vim-ruby/vim-ruby'

set t_Co=256

set tabstop=2
set shiftwidth=2
set expandtab
set number
set showcmd
set autoindent
set smartcase       " Case insensitive searches become sensitive with capitals
set smarttab        " sw at the start of the line, sts everywhere else
set visualbell
set nowrap

"#ejs
au BufNewFile,BufRead *.ejs set filetype=html

let g:airline_powerline_fonts = 1
let g:airline_theme             = 'bubblegum'
"let g:airline_enable_branch     = 1
"let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_section_x = airline#section#create([""])
"let g:airline_section_y = airline#section#create([""])

"open files with ctrl-p in tab by default
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
nnoremap <leader>. :CtrlPTag<cr>

" nerdtree
map <C-0> :NERDTreeToggle<CR>

" shortcuts for esc
:imap jj <Esc>
:imap jk <Esc>

" tab shortcuts
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" Leader shortcuts for Rails commands
noremap <Leader>m :Rmodel
noremap <Leader>c :Rcontroller
noremap <Leader>v :Rview
noremap <Leader>u :Runittest
noremap <Leader>f :Rfunctionaltest
noremap <Leader>tm :RTmodel
noremap <Leader>tc :RTcontroller
noremap <Leader>tv :RTview
noremap <Leader>tu :RTunittest
noremap <Leader>tf :RTfunctionaltest
noremap <Leader>sm :RSmodel
noremap <Leader>sc :RScontroller
noremap <Leader>sv :RSview
noremap <Leader>su :RSunittest
noremap <Leader>sf :RSfunctionaltest

noremap <Leader>fws :FixWhitespace

" shortcuts for ctags
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

nmap <Leader>b :TagbarToggle<CR>

filetype plugin indent on
