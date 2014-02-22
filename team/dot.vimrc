set nocompatible
filetype off


let mapleader = ","
" reload .vimrc
map <Leader>vrc :so $MYVIMRC<CR>

"---- set up vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"----my bundles here:
Bundle 'bling/vim-airline'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'chriskempson/base16-vim'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'kana/vim-textobj-user'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'MarcWeber/vim-addon-mw-utils'
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
" Bundle 'tpope/vim-rbenv'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-surround'
Bundle 'vim-ruby/vim-ruby'

set autoindent
set expandtab
set nowrap
set number
set shiftwidth=2
set showcmd
set smartcase       " Case insensitive searches become sensitive with capitals
set smarttab        " sw at the start of the line, sts everywhere else
set t_Co=256
set tabstop=2
set visualbell
set wildignore+=doc/*,*.swp,*.zip,log/*,tmp/*,.git/*
 
"#ejs
au BufNewFile,BufRead *.ejs set filetype=html

let g:airline_powerline_fonts = 1
let g:airline_theme             = 'bubblegum'
"let g:airline_enable_branch     = 1
"let g:airline#extensions#syntastic#enabled = 1
"let g:airline#extensions#whitespace#enabled = 0
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
map <Leader>m :Rmodel 
map <Leader>c :Rcontroller 
map <Leader>v :Rview 
map <Leader>u :Runittest 
map <Leader>f :Rfunctionaltest 
map <Leader>tm :RTmodel 
map <Leader>tc :RTcontroller 
map <Leader>tv :RTview 
map <Leader>tu :RTunittest 
map <Leader>tf :RTfunctionaltest 
map <Leader>sm :RSmodel 
map <Leader>sc :RScontroller 
map <Leader>sv :RSview 
map <Leader>su :RSunittest 
map <Leader>sf :RSfunctionaltest 

" shortcuts for ctags
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

nmap <Leader>b :TagbarToggle<CR>

"autocmd FileType javascript inoremap {<CR> {<CR>}<Esc><S-o>
"autocmd FileType javascript inoremap (; ();<Esc>hi

filetype plugin indent on
