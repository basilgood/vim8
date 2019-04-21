scriptencoding utf-8

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
set showmatch
set matchtime=1
set matchpairs&
set nrformats-=octal
set display=lastline

"""" searching and patterns
set incsearch
set hlsearch|nohlsearch
set gdefault

"""" windows, buffers
set switchbuf=useopen,usetab
set splitright
set splitbelow

"""" sessions
set sessionoptions-=options

"""" Insert completion
set dictionary='$HOME/.vim/dict'
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
set completeopt-=preview
set completeopt+=menu
set completeopt+=noinsert
set completeopt+=noselect
set complete=.,w,b,u,U,t,i,d,k
set pumheight=10

"""" text formatting
set formatoptions=q
set formatoptions+=j
set formatoptions+=n
set formatoptions+=1

""""" diff
set diffopt+=internal,algorithm:patience

"""" display
set number
set mouse=a
set ttymouse=sgr
set cursorline
set list
let &g:listchars = 'tab:▸ ,space:·,extends:❯,precedes:❮,nbsp:⦸'
autocmd MyAutoCmd InsertEnter * set listchars-=trail:•
autocmd MyAutoCmd InsertLeave * set listchars+=trail:•

"""" messages, info, status
set visualbell t_vb=
set confirm
set showcmd
set shortmess+=IiatTFc
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

""" view
set viewoptions&
      \ viewoptions-=curdir
      \ viewoptions-=options

"""" command line
set history=1000
set wildmenu
set wildmode=longest:full,full
set wildoptions=tagfile
set wildignore+=**/node_modules/**
set wildignore+=**/bower_components/**
set wildcharm=<C-Z>

"""" update time
set updatetime=500

function! options#options() abort
endfunction