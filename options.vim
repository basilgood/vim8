scriptencoding utf-8

"""" moving around/editing
set nostartofline
set nowrap
set virtualedit=block
set scrolloff=3
set sidescrolloff=10
set sidescroll=1
set nostartofline
let &showbreak = '↳ '
set breakat=\ \ ;:,!?
set breakindent
set breakindentopt=sbr
set backspace=indent,eol,start
set showmatch
set matchtime=2
set nrformats-=octal
set display=lastline

"""" searching and patterns
set incsearch
set hlsearch|nohlsearch
set gdefault

"""" windows, buffers
set hidden
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
set completeopt+=menuone
set completeopt+=noinsert
set completeopt+=noselect
set complete=.,w,b,u,U,t,i,d,k
set pumheight=10

"""" text formatting
set formatoptions=q
set formatoptions+=j
set formatoptions+=n
set formatoptions+=1

"""" display
set number
set mouse=a
set ttymouse=sgr
set cursorline

"""" messages, info, status
set visualbell t_vb=
set confirm
set showcmd
set report=0
set shortmess+=Iac
set laststatus=2

"""" tabs/indent levels
set autoindent
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab

"""" reading/writing
set autoread

set modeline
set modelines=5
set fileformats=unix,dos,mac

"""" command line
set wildmenu
set wildmode=longest:full,full
set wildoptions=tagfile
set wildignore+=tags,*/pack/*
set wildcharm=<C-Z>

"""" time out on key codes but not mappings.
set notimeout
set ttimeout
set ttimeoutlen=10
set ttyfast
set lazyredraw

"""" update time
set updatetime=500
