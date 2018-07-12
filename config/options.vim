scriptencoding utf-8
set autoread
set backspace=indent,eol,start
set timeoutlen=1000 ttimeoutlen=10
set updatetime=300
if !has('nvim')
  set ttymouse=xterm2
  set ttyscroll=2
endif
set mouse=a
set number
set hidden
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
set linebreak
set showbreak=\
set breakat=\ \ ;:,!?
set breakindent
set shortmess=Iatc
set nowritebackup
set nobackup
set noswapfile
set wildmenu
set wildmode=longest:full,full
set history=1000
set viminfo=h,'500,<10000,s1000,/1000,:1000
set completeopt=menuone,noinsert,noselect
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
set complete=.,w,b,u,U,t,i,d,k
set pumheight=10
set nostartofline
set scrolloff=5
set sidescroll=1
set sidescrolloff=5
set splitbelow
set splitright
set switchbuf=useopen,usetab
set display+=lastline
set laststatus=2
set statusline=
set statusline+=%(%{'help'!=&filetype?'\ \ '.bufnr('%'):''}\ %)
set statusline+=%{fugitive#head()!=''?'\ \ '.fugitive#head().'\ ':''}
set statusline+=\ %f
set statusline+=\ %{&modified?'\ \ +':''}
set statusline+=\ %{&readonly?'\ \ ':''}
set statusline+=%=
set statusline+=\ %{''!=#&filetype?&filetype:'none'}
set statusline+=\ %5v/%l
set statusline+=\ %4L
