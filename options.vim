scriptencoding utf-8

set term=xterm-256color
" cursor shape
let &t_SI.="\e[5 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[1 q"

" 256colors, transparent background, no bold fonts
set t_Co=256
set t_ut=
set t_md=

" backup, swap, undo
let s:undoDir = $HOME . '/.cache/vim/undo-dir'
if !isdirectory(s:undoDir)
  call mkdir(s:undoDir, 'p')
endif
let &undodir=s:undoDir
set undofile
set nobackup
set noswapfile

" viminfo
set viminfo=!,'300,<50,s10,h,n$HOME/.cache/vim/.viminfo

" path
set path& | let &path .= '**'

" moving around/editing
set nostartofline
set nojoinspaces
set nowrap
set virtualedit=block
set sidescrolloff=10
set sidescroll=1
let &showbreak = '↳ '
set breakat=\ \ ;:,!?
set breakindent
set breakindentopt=sbr
set matchtime=1
set matchpairs&
set display=lastline

" searching and patterns
set hlsearch|nohlsearch
set gdefault

" windows, buffers
set switchbuf+=useopen,usetab
set splitright
set splitbelow

" sessions
set sessionoptions-=options
set sessionoptions-=blank
set sessionoptions-=help
set sessionoptions-=curdir
set sessionoptions+=globals
set sessionoptions+=unix

" Insert completion
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
set completeopt-=preview
set completeopt+=menuone,noselect,noinsert
set complete=.,w,b,u,U,t,i,d,k
set pumheight=10

" diff
set diffopt+=context:3,indent-heuristic,algorithm:patience

" display
set number
set mouse=a
set ttymouse=sgr
set noshowmode
set tabline=%!functions#tabline()
set list
set listchars=tab:›\ ,trail:•,extends:»,precedes:«,nbsp:‡
autocmd vimRc InsertEnter * set listchars-=trail:•
autocmd vimRc InsertLeave * set listchars+=trail:•

" messages, info, status
set confirm
set shortmess=IO

" tabs/indent levels
set autoindent
set copyindent
set preserveindent
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab

" reading/writing
set autoread

" spell
set helplang=en
set spelllang=en_us

" command line
set history=1000
set wildmenu
set wildmode=longest:full,full
set wildoptions=tagfile
set wildignore=
      \*.png,
      \*.jpg,
      \*.gif,
      \*.gem,
      \*.swp,
      \*.zip,
      \*.gz,
      \*/.DS_Store/*,
      \*/tmp/*,
      \*/node_modules/*,
      \*/bower_components/*,
      \*/vendor/*,
      \*/pack/*,
      \*/.gem/*,
      \*/.git/*,
      \*/.hg/*,
      \*/.svn/*
set wildcharm=<C-Z>

" speed
set ttimeoutlen=0
set timeoutlen=1000
autocmd vimRc InsertEnter * set timeout
autocmd vimRc InsertLeave * set notimeout
set updatetime=50
set lazyredraw

" " grep
if executable('ag')
  set grepprg=ag\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif
"
" statusline
set laststatus=2
set statusline=
set statusline+=%<%{toupper(mode())}
set statusline+=%4c
set statusline+=\ %{expand('%:p:h:t')}
set statusline+=/%t
set statusline+=%h%r
set statusline+=\ %#error#
set statusline+=%{&modified?'+++++':''}
set statusline+=%*
set statusline+=%=
set statusline+=%{&filetype!=#''?&filetype:''}
