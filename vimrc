set nocompatible

" NeoBundle init
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

"NeoBundle 'http://www.vim.org/scripts/download_script.php?src_id=19161',
		"\ { 'type__filename' : 'buffkill.vim', 'script_type' : 'plugin' }


if executable('ctags')
	" Needed by easy tags
	NeoBundle 'xolox/vim-misc'
	NeoBundle 'xolox/vim-easytags'
	NeoBundle 'majutsushi/tagbar'
else
	echo "No ctags executable found!"
endif

" Run commands asynchronously (AG!)
NeoBundle 'idbrii/AsyncCommand'

" Lisp!
NeoBundle 'kovisoft/slimv'

" Toggle quickfix window
NeoBundle 'milkypostman/vim-togglelist'

" Show matching html tags
NeoBundle 'gregsexton/MatchTag'
" Close html tags
NeoBundle 'docunext/closetag.vim', {'autoload':{'filetypes':['html', 'xml']}}
NeoBundle 'vim-scripts/summerfruit256.vim'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'pangloss/vim-javascript', {'autoload':{'filetypes':['javascript']}}
" In window file browser with '-'
NeoBundle 'tpope/vim-vinegar'
NeoBundle 'rking/ag.vim'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'maxbrunsfeld/vim-yankstack'
" Close buffer without closing window
NeoBundle 'moll/vim-bbye'

NeoBundle 'bling/vim-bufferline'

NeoBundle 'https://bitbucket.org/ludovicchabant/vim-lawrencium'

NeoBundle 'elixir-lang/vim-elixir'

" Rust support
NeoBundle 'wting/rust.vim'

" Allow local vimrcs
NeoBundle 'embear/vim-localvimrc'

NeoBundle 'othree/javascript-libraries-syntax.vim', {'autoload':{'filetypes':['javascript', 'html']}}
NeoBundle 'burnettk/vim-angular', {'autoload':{'filetypes':['javascript', 'html']}}

" Display vertical bars for indents
NeoBundle 'Yggdroot/indentLine'
"NeoBundle 'nathanaelkane/vim-indent-guides'

" Add :GrepBuffer command
NeoBundle 'yegappan/grep'

" Zoom windows (<C-o>
NeoBundle 'regedarek/ZoomWin'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Lokaltog/vim-easymotion'

" Auto close parens/quotes/etc
NeoBundle 'Raimondi/delimitMate'
" Style checker
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'kien/ctrlp.vim'
" Command-T like ctrp matcher
NeoBundle 'JazzCore/ctrlp-cmatcher'
"NeoBundle 'wincent/Command-T'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'guns/vim-sexp'
"NeoBundle 'tpope/vim-sexp-mappings-for-regular-people'
NeoBundle 'guns/vim-clojure-static'
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'tpope/vim-classpath'

NeoBundle 'itchyny/lightline.vim'

NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

"NeoBundleLazy 'davidhalter/jedi-vim', {'autoload': {'filetypes': ['python']}}

call neobundle#end()
NeoBundleCheck
" NeoBundle init stop

syntax on
set t_Co=256  " make use of 256 terminal colors
color summerfruit256"

" change the mapleader from \ to ,
let mapleader=","

inoremap jk <esc>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>6r :e $MYVIMRC<CR>
nmap <silent> <leader>6s :so $MYVIMRC<CR>

" One particularly useful setting is hidden. Its name isn’t too descriptive, though. It hides buffers instead of closing them. This means that you can have unwritten changes to a file and open a new file using :e, without being forced to write or undo your changes first. Also, undo buffers and marks are preserved while the buffer is open. This is an absolute must-have.
set hidden

set splitbelow
set splitright

set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set expandtab     " tabs -> spaces
set backspace=indent,eol,start	" allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line number
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set wildmenu 	  " show matches when trying to autocomplete filenames i.e. :e
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highdark search terms
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set scrolloff=10		 " center cursor vertically on searches

set synmaxcol=120		 " color max 120 lines/ for performance

set laststatus=2 " always show the status line

set nocursorline
set nocursorcolumn

set ttyfast
set lazyredraw

set foldenable
set foldmethod=indent
set foldlevel=20

set colorcolumn=80,81

" Enable autoread
set autoread
autocmd CursorHold * checktime
"""""""""""""""""

" Load plugins depending on filetype
filetype plugin indent on
filetype plugin on

" Dont change tabs to spaces in make files
autocmd FileType make setlocal noexpandtab

" Execute clojure/python
au FileType python map <buffer> <S-r> :w<CR>:!/usr/bin/env python % <CR>
au FileType clojure map <buffer> <S-r> :Eval <CR>
"au FileType rust map <buffer> <S-r> :w<CR>:!rustc % && echo 'compiled ok\!' && ./%:r <CR>
au FileType rust map <buffer> <S-r> :w<CR>:!cargo run <CR>
au FileType rust map <buffer> <S-e> :w<CR>:!cargo test <CR>

" You can temporarily switch to “paste mode”, simply by setting the following option:
set pastetoggle=<F2>
nnoremap <F3> :set nonumber!<CR>:set foldcolumn=0<CR>

" Disable arrows
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Jump one row when line is wrapped
nnoremap j gj
nnoremap k gk

nnoremap qq q

" Clean last search highlighing
nmap <silent> ,/ :nohlsearch<CR>

" Use special directories to store undo/backup/swap files
" Trailing slashes remove name collision problem
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Write directly to file
set nowritebackup
set undofile
set backup

" Set proper filename autocomplete
set wildmode=longest,list

set wildignore=*.swp,*.bak,*.class
set wildignore+=*/tmp/*,*.so,*.zip,*.o
set wildignore+=*.pyc
set wildignore+=*.un~
set wildignore+=*build/*
set wildignore+=*dist/*
set wildignore+=*.egg-info/*
set wildignore+=*/coverage/*

" Disable built in paren matching in vim
let loaded_matchparen = 1

" Remove trailing whitespace on save
fun! StripTrailingWhitespace()
    " don't strip on these filetypes
    if &ft =~ 'markdown'
        return
    endif
    %s/\s\+$//e
endfun
autocmd BufWritePre * call StripTrailingWhitespace()

" Clojure rainbow parens
au BufEnter *.clj RainbowParenthesesActivate
au Syntax clojure RainbowParenthesesLoadRound
au Syntax clojure RainbowParenthesesLoadSquare
au Syntax clojure RainbowParenthesesLoadBraces

" Set clipboard as default register
set clipboard=unnamed
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

" Resize splits on terminal resize
autocmd VimResized * wincmd =
nnoremap <silent> <leader>= <Esc>:wincmd =<CR>

" Toggle absolute/relative line numbering mode
" There is no norelativenumber in < 7.3
"if has("&norelativenumber")
	"autocmd InsertEnter * silent! :set norelativenumber
"else
	"autocmd InsertEnter * silent! :set number
"endif
"autocmd InsertLeave,BufNewFile,VimEnter * silent! :set relativenumber

""""""""""""""""""""""""""""""
" PLUGIN SETUP
""""""""""""""""""""""""""""""

" Setup Syntastic for python
"let g:syntastic_python_checkers = ['pylint']
"let g:syntastic_python_pylint_post_args='--disable=C0111,C0103,W0710,R0201,W0223,W0142,R0903,C0330'

" Setup EasyMotion
let g:EasyMotion_do_mapping = 0 "Disable default mappings
let g:EasyMotion_smartcase = 1
map <leader>s <Plug>(easymotion-s2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

let g:jedi#goto_assignments_command = "<leader>G"
let g:jedi#goto_definitions_command = "<leader>g"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#show_call_signatures = "1"
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_on_dot = 0
" Disable preview popup during autocopletion
autocmd FileType python setlocal completeopt-=preview

" NERDTree
nnoremap <silent> <leader>d :NERDTreeToggle<CR>
nnoremap <silent> <leader>D :NERDTreeFind<CR>
let NERDTreeHijackNetrw=0
" Close vim when NERDTree is the last opened window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore=['\.pyc$', '\.swp$']
let NERDTreeMinimalUI=1
let NERDTreeShowBookmarks=1

" CtrlP config
"
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_map = '<leader>T'
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
let g:ctrlp_switch_buffer = 0
nnoremap <silent> <leader>t :CtrlPMixed<CR>
nnoremap <silent> <leader>m :CtrlPMRU<CR>
nnoremap <silent> <leader>x :CtrlPBuffer<CR>
nnoremap <silent> <leader>L :CtrlPTag<CR>
nnoremap <silent> <leader>l :CtrlPBufTagAll<CR>

" Toggle gundo
nnoremap <silent> <leader>u :GundoToggle<CR>

" Setup async ag if possible
if has('clientserver') && has("gui_macvim") && has("gui_running")
    nnoremap <leader>a :AsyncGrep<SPACE>
    nnoremap <leader>A :execute 'AsyncGrep ' . expand('<cword>')<Cr>
else
    nnoremap <leader>a :Ag<SPACE>
    nnoremap <leader>A :execute 'Ag ' . expand('<cword>')<Cr>
endif

" Find in open buffers
nnoremap <leader>f :GrepBuffer<space>

" JS Libs setup
let g:used_javascript_libs = 'underscore,jquery,angularjs,angularui'

" Switch to last buffer with ,b
nnoremap <silent> <leader>b :b#<CR>

" Close current buffer with ,q
nnoremap <silent> <Leader>q :Bdelete<CR>

" Setup yankstack
let g:yankstack_map_keys = 0
nnoremap <silent> <leader>y :Yanks<CR>
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

" Tagbar
nnoremap <silent> <leader>o :TagbarToggle<CR>
let g:tagbar_autofocus=1
let g:tagbar_compact=1

"Make easytags async
let g:easytags_async=1
let g:easytags_syntax_keyword = 'always'
let g:easytags_auto_highlight = 0
"set regexpengine=1

" Make localvimrc choice persistent
let g:localvimrc_persistent=2

" BufferLine
let g:bufferline_fixed_index =  0 "always first

" indentLine
let g:indentLine_faster = 1 "Try to improve indentLine performance

" ToggleList
let g:toggle_list_no_mappings = 1
let g:toggle_list_copen_command="botright copen"
nnoremap <silent> <leader>v :call ToggleQuickfixList()<CR>


let g:slimv_swank_cmd = '!osascript -e "tell application \"Terminal\" to do script \"sbcl --load ~/.vim/bundle/slimv/slime/start-swank.lisp\""'
"let g:paredit_mode=0
