" to use this vimrc, copy it to ~/.vimrc (make sure to back your's up if you want to save it first)
" in case you haven't noticed, " is the comment character in vim config files
" to extend it, see https://vimways.org/2018/debugging-your-vim-config/

"---------Vundle options----------------------------------------------------
"Vundle options, requires having vundle installed in ~/.vim/bundle/vundle
" for help go to: https://github.com/gmarik/Vundle.vim
set nocompatible
set nomodeline "Turn off parsing vim settings out of files you open (security vulnerability)
set laststatus=2 "make status line always display
set nobackup "testing if this reduces instances of lag
filetype off
let mapleader = ","
noremap <Leader>vrc :so ~/.vimrc<CRc

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" Load bundles here, it default loads from github, but can specify specifics

" Plugin 'terryma/vim-multiple-cursors'
    " Multiple cursors
    " try the function :MultipleCursorsFind (works like /s)
    " https://github.com/terryma/vim-multiple-cursors

" Plugin 'kien/ctrlp.vim'
    " fuzzy filename finder
    " Run :CtrlP to enter CtrlP file finding mode
    " :h ctrlp-mappings in normal mode or just ? in CtrlP mode for help
    " https://github.com/kien/ctrlp.vim
" let g:ctrlp_custom_ignore = {
    " \ 'dir': '\v[\/](build|bld|dep|bin|logs|swig|install|node_modules|targets|dist|mavsdk)$',
    " \ }

" Plugin 'msanders/snipmate.vim'
    " Code snippet completion
    " Start typing standard things and let tab completion do the rest
    " <C-r>\t to get a menu with available snippets
    " :h snipMate.txt
    " Look in ~/.vim/bundle/snipmate.vim/snippets to see expansions
    " https://github.com/msanders/snipmate.vim

" Plugin 'Lokaltog/vim-easymotion'
    " Easy large movement
    " press \\w then type the highlighted letters to jump anywhere
    " also works with other motion cmds like e, b, f{char}
    " :h easymotion.txt
    " https://github.com/Lokaltog/vim-easymotion

"Plugin 'bling/vim-airline'
    "" Adds the nice bottom line
"let g:airline_powerline_fonts = 1
"let g:airline_theme             = 'bubblegum'
""let g:airline_enable_branch     = 1
""let g:airline#extensions#syntastic#enabled = 1
"let g:airline#extensions#whitespace#enabled = 0
"let g:airline_section_x = airline#section#create([""])
""let g:airline_section_y = airline#section#create([""])

"Plugin 'hut8labs/diffscuss', {'rtp': 'diffscuss.vim/'}
    " diff based code comments and reviews

" Plugin 'sheerun/vim-polyglot'
    " Multi-language support
" let g:polyglot_disabled = ['markdown']

"Plugin 'fatih/vim-go'
    " GoLang support

"Plugin 'JuliaEditorSupport/julia-vim'
    " JuliaLang support

"Plugin 'pangloss/vim-javascript'
    " Javascript syntax and folding

"Plugin 'dense-analysis/ale'
    " Language Server Protocol support. For languages supported:
    " https://github.com/dense-analysis/ale/blob/master/supported-tools.md

Plugin 'neoclide/coc.nvim'

" Give more space for displaying messages.
set cmdheight=2
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)


"Plugin 'mattn/emmet-vim'
    " high speed HTML and css editing
    " seems to kinda suck ...

" I have found that I don't particularly like this plugin because it doesn't
" do a good job with colorschemes, tabs, or vsplits
"Plugin 'FredKSchott/CoVim'
    " Multiuser editing with vim
    " :CoVim start [port] [name]
    " :CoVim connect [host address / 'localhost'] [port] [name]
    " https://github.com/FredKSchott/CoVim
"let CoVim_default_name = "IsaacCovim"
"let CoVim_default_port = "1337"

" Basic commands
" :PluginList       - list configured plugins
" :PluginInstall    - install (update) plugins
" :PluginSearch foo - search for foo
" :PluginClean      - confirm removal of unused plugins
" :h vundle         - get detailed help
" Note that comments after Bundle commands are not allowed

call vundle#end()
filetype plugin indent on

"---------Plugin configuration----------------------------------------------
"let g:user_emmet_install_global = 0
"au FileType html,css EmmetInstall


"---------Matlab Support----------------------------------------------------
" Turns out this guy's stuff isn't all that great ...
" http://www.vim.org/scripts/script.php?script_id=2407
" Files located in ~/.vim/
"source $VIMRUNTIME/macros/matchit.vim
"autocmd BufEnter *.m  compiler mlint


"---------standard options--------------------------------------------------
set shiftwidth=4 tabstop=4
    " tab sizes

imap <BS> <Left><Del>
set whichwrap+=[
    " backspace behavior should only ever delete 1 character, not soft tabs

set number
    " use line numbers

set wildmode=longest,list,full
set wildmenu
    " change tab completion in menus to be more like bash

set expandtab
au FileType make,text :setlocal noexpandtab
    " expand tabs, but only if you are not editing a make file or a txt file

set scrolloff=8

set tabpagemax=100

set path+=include
    " used to allow auto opening of files using gf that are in an include dir

set hlsearch

"---------Filetypes and coloring---------------------------------------------
au BufRead,BufNewFile *.h set filetype=c
    " if reading an header file, treat it like a c file
au BufRead,BufNewFile *.hpp set filetype=cpp
    " if reading an cpp header file, treat it like a cpp file
au BufRead,BufNewFile *.lcm set filetype=c
    " if reading an lcm file, treat it like a c file
au BufRead,BufNewFile *.zcm set filetype=c
    " if reading an zcm file, treat it like a c file
au BufRead,BufNewFile *.ino set filetype=c
    " if reading an arduino file, treat it like a c file
au BufRead,BufNewFile *.dox set filetype=c
    " if reading an dox file, treat it like a c file
au BufRead,BufNewFile *.md set filetype=markdown
    " if reading an md file, treat it like a markdown file
au BufRead,BufNewFile *.config set filetype=c
    " if reading an config file, treat it like a c file
au BufRead,BufNewFile *\.config\.* set filetype=c
    " if reading an config file, treat it like a c file
au BufRead,BufNewFile *.jslp set filetype=c
    " if reading an jslp file, treat it like a c file
au BufRead,BufNewFile *.world set filetype=c
    " if reading an world config file, treat it like a c file
au BufRead,BufNewFile *.proc set filetype=c
    " if reading an procman file, treat it like a c file
au BufRead,BufNewFile *.rules set filetype=udevrules
    " if reading an rulesg file, ensure the highlighting is proper
au FileType c,cpp,java,matlab,sh,make :setlocal cindent
    " if editing some form of code, use c indentation
au FileType text :setlocal smartindent
    " if reading a text file, use smart indenting
au FileType html,xml,javascript,typescript,css :setlocal shiftwidth=2 tabstop=2

au BufWritePre * :%s/\s\+$//e
    " remove extra whitespace from ends of lines

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
    " ignore version control directories when expanding file names
set wildignore+=*.o,*.so,*.a,*.swp,*.zip,*.tar,*.gz
    " ignore generated files when expanding file names
"set wildignore+=*.d
    " ignore dependency files when expanding file names

colorscheme ron "colorscheme elflord
    " set the best color scheme
syntax on
    " turn on syntax highlighting
hi DiffText ctermbg=90
    " try address some of the bad contrast diff colors
hi TabLineSel ctermbg=Black ctermfg=Yellow term=bold cterm=bold
    " Make the selected tab stand out a bit more
hi PMenu ctermbg=Black ctermfg=Yellow
    " Make the word completion menu a bit more legible
hi PMenuSel ctermbg=Black ctermfg=Cyan term=bold cterm=bold
    " Make the word completion menu a bit more legible

nnoremap <silent> ( :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
    " maps ( to highlight the word under the cursor in normal mode
vnoremap ( :<C-u>let @q=@"<CR>gv:<C-u>let @w=@0<CR>gvy:let @/=@"<CR>:let @"=@q<CR>:let @0=@w<CR>:set hls<CR>
    " maps ( to highlight select under the cursor in visual mode
nnoremap <silent> ) :noh<CR>
    " maps ) to turn off highlighting of words from search

"---------Folds--------------------------------------------------------------
set foldmethod=syntax
    " fold on syntax
set foldlevelstart=99
    " start with all folds open, if you prefer all folds to be closed, change
    " this to 0 or 1
nnoremap <silent> <Space> za
    " space toggles one level of fold
nnoremap <C-f> zA
    " <C-f> now toggles folds recursively under cursor
nnoremap <silent> <F8> zM
    " F8 closes all folds in document
nnoremap <silent> <F9> zR
    " F9 opens all folds in document

" Prevent folds from opening when you enter insert mode
autocmd InsertEnter * let w:last_fdm=&foldmethod | setlocal foldmethod=manual
autocmd InsertLeave * let &l:foldmethod=w:last_fdm


"---------Sessions-----------------------------------------------------------
set sessionoptions=buffers,tabpages,winsize,curdir
noremap <F2> <esc>:mksession! <C-R>="~/.vim/sessions/" <CR>
    " Makes F2 save your vim session to ~/.vim/sessions/ (after you press enter)
noremap <F3> <esc>:source <C-R>="~/.vim/sessions/" <CR>
    " Makes F3 load the vim session saved by F2 (after you press enter)
nnoremap <F4> "=strftime("%F")<CR>p
    " Makes F4 insert the current date stamp
inoremap <F4> <C-R>=strftime("%F")<CR>
    " Makes F4 insert the current date stamp


"---------Disabled commands--------------------------------------------------
noremap <F1> <nop>
inoremap <F1> <nop>
    " disable the F1 help key because I hit it when trying to hit escape
noremap K <nop>
    " disable the shift K command because I hit it and it does annoying things
nnoremap U <nop>
    " disable the shift U command because I hit it and it does annoying things
nnoremap <C-b> <nop>
    " disable the ctrl b command because it conflicts with tmux
" nnoremap <C-f> <nop>
    " disable the ctrl f command to be consistent with disabled ctrl b
    " <C-f> now used for folding, no need to disable


"---------A few common but niche category items------------------------------
inoremap <silent> <nul> <C-n>
    " ctrl + space does auto completion now
"inoremap {     {}<Left>
inoremap {<CR> {<CR>}<Esc>O
"inoremap {{    {
"inoremap {}    {}
    " remapping that makes { form an auto closed pair either on the
    " same line or the next if you hit enter fast enough
inoremap <silent> <C-d> <esc>ddko
    " maps ctrl+d in insert mode to delete your current line and append to the
    " one above it
inoremap <silent> <C-f> <esc>kJi
    " maps ctrl+f in insert mode to merge your current line with the
    " one above it


"---------resizing splits----------------------------------------------------
noremap = <esc><C-w>>
    " = increase size of vertically split window
noremap - <esc><C-w><
    " - decrease size of vertically split window
noremap + <esc><C-w>+
    " + increase size of horizontally split window
noremap _ <esc><C-w>-
    " _ decrease size of horizontally split window
" noremap <C-=> <esc><C-w><C-=>
    " <C-=> equalizes size of splits

" Other useful keys:
    " <C-w>= sets splits to same size
    " <C-w>r rotates splits once to the right
    " <C-w>R rotates splits once to the left


"----------moving between tabs and splits------------------------------------
noremap gh <esc><C-w><Left>
    " gh moves left one vertically split window
noremap gH <esc><C-w><Left>
    " gH moves left one vertically split window (in ex mode gh is overridden)
noremap gl <esc><C-w><Right>
    " gl moves right one vertically split window
noremap gj <esc><C-w><Down>
    " gj moves down one horizontally split window
noremap gk <esc><C-w><Up>
    " gk moves up one horizontally split window
noremap gu <esc>gT
    " gu moves left one tab
noremap gi <esc>gt
    " gi moves right one tab
nnoremap <silent> g<C-u> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> g<C-i> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>


"----------opening tabs and splits------------------------------------------
noremap <silent> g<C-e> <esc>:Ex<CR>
    " g<C-e> opens explorer mode
noremap <silent> g<C-t> <esc>:tabe<CR>
"noremap <silent> g<C-t> <esc>:Tex<CR>
    " g<C-t> opens a new tab
nnoremap <silent> gc <esc>:tabc<CR>
    "gc closes current tab
noremap <silent> g= <esc><C-w>v<C-w><Right>
    " g= splits window vertically and enters the right one
noremap <silent> g- <esc><C-w>v
    " g- splits window vertically and enters the left one
noremap <silent> g+ <esc><C-w>s
    " g+ splits window horizontally and enters the top one
noremap <silent> g_ <esc><C-w>s<C-w><Down>
    " g_ splits window horizontally and enters the bottom one
noremap <silent> gy :call MarkWindowSwap()<CR>
    " gy tags a window to be moved to a target location with gp
noremap <silent> gp :call DoWindowSwap()<CR>
    " swaps the current window with the one previously tagged with gy


"---------home, end, pgup, pgdn-----------------------------------------------
noremap <silent> <C-l> 10l
    " <C-l> moves by 10 characters
noremap <silent> <C-h> 10h
    " <C-h> moves by 10 characters
inoremap <silent> <C-l> <esc>10la
    " <C-l> moves by 10 characters in insert mode
inoremap <silent> <C-h> <esc>10ha
    " <C-h> moves by 10 characters in insert mode
noremap <silent> L $
    " L goes to end of line
noremap <silent> H ^
    " H goes to beginning of line
" Unfortunately, vim can't tell the difference between <C-l> and <C-L>
"inoremap <silent> <C-L> <esc>A
    " <C-L> goes to end of line in insert mode
"inoremap <silent> <C-H> <esc>I
    " <C-H> goes to beginning of line in insert mode
noremap <silent> <C-j> 10j
    " <C-j> goes to bottom of page
noremap <silent> <C-k> 10k
    " <C-k> goes to top of page
inoremap <silent> <C-j> <esc>10ja
    " <C-l> moves by 10 characters in insert mode
inoremap <silent> <C-k> <esc>10ka
    " <C-h> moves by 10 characters in insert mode

"noremap <silent> <C-l> $
    " <C-l> goes to end of line
"noremap <silent> <C-h> ^
    " <C-h> goes to beginning of line
"inoremap <silent> <C-l> <esc>A
    " <C-l> goes to end of line in insert mode
"inoremap <silent> <C-h> <esc>I
    " <C-h> goes to beginning of line in insert mode
"noremap <silent> L 10l
    " L now moves by 10 characters
"noremap <silent> H 10h
    " H now moves by 10 characters
"noremap <silent> <C-j> <C-e>
    " <C-j> now scrolls down the page
"noremap <silent> <C-k> <C-y>
    " <C-k> now scrolls up the page


"---------compiler error window---------------------------------------------
noremap <silent> cn <esc>:cn<CR>
    " cn goes to the next compiler error (must compile with :make in vim)
noremap <silent> cp <esc>:cp<CR>
    " cp goes to the previous compiler error (must compile with :make in vim)
noremap <silent> cw <esc>:cw<CR>
    " cw opens the compiler output window (must compile with :make in vim)
noremap <silent> cc <esc>:ccl<CR>
    " cc closes the compiler output window (must compile with :make in vim)


"---------don't fill buffer with single char delete-------------------------
noremap <silent> x "_x
    " sends characters deleted with x to the null buffer so they don't
    " overwrite things in the default paste buffer


"-------comments ------------------------------------------------------------
au FileType haskell,vhdl,ada let b:comment_leader = '--'
au FileType vim let b:comment_leader = '"'
au FileType c,cpp,java,javascript let b:comment_leader = '//'
au FileType sh,make,python,julia let b:comment_leader = '#'
au FileType matlab,tex let b:comment_leader = '%'
    "set up comment characters for given filetypes

noremap <silent> ,c :<C-B>sil <C-E>s/^\(\s*\)/\1<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:noh<CR>
noremap <silent> ,u :<C-B>sil <C-E>s/^\(\s*\)\V<C-R>=escape(b:comment_leader,'\/')<CR>/\1/e<CR>:noh<CR>
    " maps ,c to comment out a line/section and ,u to uncomment a line/section


"-------tags----------------------------------------------------------------
set tags=./tags;/
    "sets default tag file name
noremap <silent> th <esc>:pclose<CR>
    " th closes preview window
noremap <silent> tJ <esc>:exec("tag ".expand("<cword>"))<CR>
    " tJ to open the tag
noremap <silent> tj <esc>:exec("ptag ".expand("<cword>"))<CR>
    " tj preview the tag
noremap <silent> t<C-j> <esc>:tab split<CR>:exec("tag ".expand("<cword>"))<CR>
    " t<C-j> opens the destination of following the tag in a new tab
noremap <silent> t<A-j> <esc>:vsp <CR>:exec("tag ".expand("<cword>"))<CR>
    " t<A-j> opens the destination of following the tag in a vsplit window
noremap <silent> tK <esc>:exec("tselect ".expand("<cword>"))<CR>
    " tK executes tag select
noremap <silent> tk <esc>:exec("ptselect ".expand("<cword>"))<CR>
    " tk previews the tag select
noremap <silent> t<C-k> <esc>:tab split<CR>:exec("tselect ".expand("<cword>"))<CR>
    " t<C-k> opens the tselect of the tag in a new tab
noremap <silent> t<A-k> <esc>:vsp <CR>:exec("tselect ".expand("<cword>"))<CR>
    " t<A-k> opens the tselect of the tag in a vsplit window


"-------Random Hotkeys------------------------------------------------------
nnoremap <silent> ,s <esc>A;<esc>
    " ,s puts a semicolon at the end of a line

nnoremap <silent> <C-x> <esc>/TODO\\|XXX<CR>
    " C-x searches for the next TODO or XXX

nnoremap <silent> ,i <esc>:%s/\(\S\+\)\([+-][+-]\)/\2\1/gc<CR>
    " ,i to search-replace for post-increment/decrement

nnoremap <silent> ,p <esc>:%s/ \*/* /gc<CR>
    " ,p to search-replace for " *" instad of "* "

nnoremap <silent> ,r <esc>:%s/\r/\r/g
    " ,r to redo line endings to be linux style

function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf
endfunction


"-------Highlight Overlength------------------------------------------------
if exists('+colorcolumn')
    "let &colorcolumn="81,".join(range(101,999),",")
    let &colorcolumn="81,101"
    highlight ColorColumn ctermbg=darkgrey
endif
