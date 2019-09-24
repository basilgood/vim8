scriptencoding utf-8

"""" terminal vim
set notimeout
set ttimeout
set ttimeoutlen=10
set lazyredraw

"""" viminfo
set viminfo=!,'300,<50,s10,h,n$CACHE_HOME/.viminfo

"""" moving around/editing
set nostartofline
set nowrap
set virtualedit=block
set sidescrolloff=10
set sidescroll=1
let &showbreak = '↳ '
set breakat=\ \ ;:,!?
set breakindent
set breakindentopt=sbr
set backspace=indent,eol,start
set noshowmatch
set matchtime=1
set matchpairs&
set nrformats-=octal
set display=lastline

"""" searching and patterns
set incsearch
set hlsearch|nohlsearch
" autocmd vimRc InsertLeave * :setlocal hlsearch
" autocmd vimRc InsertEnter * :setlocal nohlsearch
set gdefault

"""" windows, buffers
set switchbuf=useopen,usetab
set splitright
set splitbelow

"""" sessions
set sessionoptions-=options
set sessionoptions-=blank
set sessionoptions-=help
set sessionoptions-=curdir
set sessionoptions+=globals
set sessionoptions+=unix

"""" Insert completion
set dictionary='$HOME/.vim/dict'
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
set completeopt-=preview
set completeopt+=menuone,noselect
set complete=.,w,b,u,U,t,i,d,k
set pumheight=10

"""" text formatting
set formatoptions=q
set formatoptions+=j
set formatoptions+=n
set formatoptions+=1

""""" diff
set diffopt+=context:3,indent-heuristic,algorithm:patience

"""" display
set number
set mouse=a
set ttymouse=sgr
set tabline=%!functions#tabline()
set t_ut=
set cursorline
set list
let &g:listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:⦸'
autocmd vimRc InsertEnter * set listchars-=trail:•
autocmd vimRc InsertLeave * set listchars+=trail:•
set termguicolors

"""" messages, info, status
set visualbell t_vb=
set confirm
set showcmd
set noshowmode
set shortmess+=Icm
set signcolumn=yes
set laststatus=2

"""" tabs/indent levels
set autoindent
set copyindent
set preserveindent
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab

"""" reading/writing
set autoread

"""" spell
set helplang=en
set nospell
set spelllang=en_us
set fileformats=unix,dos,mac

"""" command line
set history=1000
set wildmenu
set wildmode=longest:full,full
set wildoptions=tagfile
set wildignore+=**/node_modules/**
set wildignore+=**/bower_components/**
set wildcharm=<C-Z>

"""" update time
set updatetime=300
