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
set noshowmatch
set matchtime=1
set matchpairs&
set nrformats-=octal
set display=lastline

"""" searching and patterns
set incsearch
set hlsearch|nohlsearch
autocmd MyAutoCmd InsertLeave * :setlocal hlsearch
autocmd MyAutoCmd InsertEnter * :setlocal nohlsearch
set gdefault

"""" windows, buffers
set switchbuf=useopen,usetab
set splitright
set splitbelow

"""" sessions
set sessionoptions-=options
set sessionoptions-=blank
set sessionoptions-=globals
set sessionoptions-=folds
set sessionoptions-=help
set sessionoptions+=tabpages

"""" Insert completion
set dictionary='$HOME/.vim/dict'
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
set completeopt-=preview
set completeopt+=longest,menuone,noselect
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
set relativenumber
autocmd MyAutoCmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
autocmd MyAutoCmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
set mouse=a
set ttymouse=sgr
if &term =~# '256color'
  set t_ut=
endif
set cursorline
set list
let &g:listchars = 'tab:▸ ,space:·,extends:❯,precedes:❮,nbsp:⦸'
autocmd MyAutoCmd InsertEnter * set listchars-=trail:•
autocmd MyAutoCmd InsertLeave * set listchars+=trail:•

"""" messages, info, status
set visualbell t_vb=
set confirm
set showcmd
set noshowmode
set shortmess+=Icm

"""" statusline
set laststatus=2
let &g:statusline=''
let &g:statusline.=' %{winnr("$")>1?winnr():""}'
let &g:statusline.=' %{toupper(mode())}'
let &g:statusline.=' ⦁ %{pathshorten(expand("%:~:."))}'
let &g:statusline.=' %h%r'
let &g:statusline.='%{exists("g:loaded_fugitive")?"⦁ ".fugitive#head():""} '
let &g:statusline.=' %{&mod?" ✚ ":" ✔ "}'
let &g:statusline.=' %{exists("g:asyncrun_status")?g:asyncrun_status:""}'
let &g:statusline.='%='
let &g:statusline.='%{&filetype!=#""?&filetype:""} ⦁'
let &g:statusline.='%12(%c:%l/%L%) '

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
set updatetime=500

function! options#options() abort
endfunction
