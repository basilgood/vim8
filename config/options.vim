scriptencoding utf-8
set autoread
set backspace=indent,eol,start
set timeoutlen=1000 ttimeoutlen=100
set updatetime=300
set ttyfast
set lazyredraw
if !has('nvim')
  set ttymouse=xterm2
  set ttyscroll=2
endif
set mouse=a
set hidden
set number
set noshowmode
set showcmd
set incsearch
set hlsearch|nohlsearch
set nowrap
set autoindent
set smartindent
set expandtab
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set list listchars=tab:▸\ ,eol:¬,trail:~,space:·,extends:»,precedes:«,nbsp:⦸
set noshowmatch
set linebreak
set showbreak=\
set breakat=\ \	;:,!?
set breakindent
set shortmess=Iat
set nowritebackup
set nobackup
set noswapfile
set wildmenu
set wildmode=longest:full,full
set history=1000
set viminfo=h,'500,<10000,s1000,/1000,:1000
let g:did_install_default_menus = 1
set completeopt=menuone,preview,noinsert,noselect
set complete=.,w,b,u,t,i,k
set omnifunc=syntaxcomplete#Complete
set pumheight=10
set nostartofline
set scrolloff=5
set sidescroll=1
set sidescrolloff=5
set splitbelow
set splitright
set switchbuf=useopen,usetab
set display=lastline
set laststatus=2
