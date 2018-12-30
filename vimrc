let skip_defaults_vim=1

if !v:vim_did_enter && has('reltime')
  let g:startuptime = reltime()
  augroup vimrc-startuptime
    autocmd! VimEnter * let g:startuptime = reltime(g:startuptime)
          \                 | redraw
          \                 | echomsg 'startuptime: ' . reltimestr(g:startuptime)
  augroup END
endif

if &encoding !=? 'utf-8'
  let &termencoding = &encoding
  setglobal encoding=utf-8
endif

scriptencoding utf-8

if (&term =~# '^tmux') || (&term =~# '^st')
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

"""" Moving Around/Editing
set nostartofline
set nowrap
set virtualedit=block
set scrolloff=3
set sidescrolloff=10
set sidescroll=1
set nostartofline
set diffopt=filler,vertical
let &showbreak = '↳ '
set breakindent
set breakindentopt=sbr
set backspace=2
set showmatch
set matchtime=2
set report=0

"""" Searching and Patterns
set incsearch
set hlsearch

"""" Windows, Buffers
set hidden
set switchbuf=useopen,usetab
set splitright
set splitbelow

"""" Sessions
set sessionoptions-=options

"""" Shell
if &shell =~# 'fish$'
  set shell=/usr/bin/env\ bash
endif

"""" Delete comment character when joining commented lines
set formatoptions+=j

"""" Grep
" if executable('ag')
"   set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
"   set grepformat=%f:%l:%c:%m,%f:%l:%m
" endif

"""" Insert completion
set dictionary='$HOME/.vim/dict'
set completeopt-=preview
set completeopt+=menuone
set completeopt+=noinsert
set completeopt+=noselect
set complete=.,w,b,u,U,t,i,d,k
set pumheight=10

"""" Folding
set foldmethod=syntax
set foldlevelstart=99

"""" Text Formatting
set formatoptions=q
set formatoptions+=n
set formatoptions+=1

"""" Display
set number
set mouse=a
set cursorline

if &encoding =~# '^u\(tf\|cs\)'
  set list
  let s:tab = nr2char(9655)
  let s:dot = nr2char(8901)
  let s:trail = nr2char(164)
  let s:nbsp = nr2char(244)
  exe 'set listchars=tab:'    . s:tab . '\ '
  exe 'set listchars+=trail:' . s:trail
  exe 'set listchars+=space:' . s:dot
  exe 'set listchars+=nbsp:'  . s:nbsp
endif

"""" Messages, Info, Status
set visualbell t_vb=
set confirm
set showcmd
set report=0
set shortmess+=aI
set ruler
set laststatus=2

set statusline=
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction
function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction
set statusline+=\ %n
set statusline+=%#Visual#
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=%#CursorIM#
set statusline+=%R
set statusline+=%#Error#
set statusline+=%M
set statusline+=%#CursorIM#
set statusline+=\ %f
set statusline+=%=
set statusline+=%#CursorIM#
set statusline+=\ \%{StatuslineGit()}
set statusline+=\ %Y
set statusline+=%#CursorIM#
set statusline+=\ %-2c:%3l/%L

"""" Tabs/Indent Levels
set autoindent
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab

"""" Reading/Writing
set autoread
set modeline
set modelines=5
set fileformats=unix,dos,mac

"""" Backups/Swap Files
function! EnsureDirExists (dir)
  if !isdirectory(a:dir)
    if exists('*mkdir')
      call mkdir(a:dir,'p')
      echo 'Created directory: ' . a:dir
    else
      echo 'Please create directory: ' . a:dir
    endif
  endif
endfunction

call EnsureDirExists($HOME . '/.vim/files/backup')
set backup
set backupdir=$HOME/.vim/files/backup/
set backupext=-vimbackup
set backupskip  =
call EnsureDirExists($HOME . '/.vim/files/swap')
set directory=$HOME/.vim/files/swap//
set updatecount =100
call EnsureDirExists($HOME . '/.vim/files/undo')
set undofile
set undodir=$HOME/.vim/files/undo/
call EnsureDirExists($HOME . '/.vim/files/info')
set viminfo='100,n$HOME/.vim/files/info/viminfo

"""" Command Line
set history=1000
set wildmenu
set wildmode=full
set wildcharm=<C-Z>

"""" Time out on key codes but not mappings.
set notimeout
set ttimeout
set ttimeoutlen=10
set ttyfast
set lazyredraw

"""" Update time
set updatetime=500

let g:is_bash = 1
let g:sh_noisk = 1

filetype plugin indent on
syntax enable

""" Autocommands
if has('autocmd')
  augroup vimrcEx
    autocmd!
    " Quicfix on entire tab
    autocmd FileType qf wincmd J

    " Quit help
    autocmd FileType help nnoremap <silent><buffer> q :q<CR>

    " In plain-text files and svn commit buffers, wrap autocmdtomatically at 78 chars
    autocmd FileType text,svn setlocal tw=78 fo+=t

    " syntax highlight
    autocmd BufEnter * syntax sync fromstart

    " Load opt plugins
    autocmd BufEnter * call timer_start(300, function('pack_opt#plugins'))

    " Try to jump to the last spot the cursor was at in a file when reading it.
    autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif

    " Use :make to syntax check a perl script.
    autocmd FileType perl set makeprg=perl\ -c\ %\ $* errorformat=%f:%l:%m

    " Use :make to compile C, even without a makefile
    autocmd FileType c   if glob('[Mm]akefile') == "" | let &mp="gcc -o %< %" | endif

    " Use :make to compile C++, too
    autocmd FileType cpp if glob('[Mm]akefile') == "" | let &mp="g++ -o %< %" | endif

    autocmd Filetype * let &l:ofu = (len(&ofu) ? &ofu : 'syntaxcomplete#Complete')

    autocmd Syntax   javascript             setlocal isk+=$

    autocmd FileType javascript setlocal dictionary+=$HOME/.vim/dict/javascript.dict
    autocmd FileType vim setlocal dictionary+=$HOME/.vim/dict/vim.dict

    autocmd FileType * if exists("+omnifunc") && &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
    autocmd FileType * if exists("+completefunc") && &completefunc == "" | setlocal completefunc=syntaxcomplete#Complete | endif
    autocmd FileType html setlocal iskeyword+=~ | let b:dispatch = ':OpenURL %'
    autocmd FileType perl,javscript,php,css let b:surround_101 = "\r\n}"

  augroup END
endif

""" Mappings
nnoremap <Bs> :ls<CR>:b
nnoremap <Space>n :nohlsearch<CR>
nnoremap j gj
nnoremap k gk
vnoremap > >gv
vnoremap < <gv
vnoremap . :normal .<CR>
nnoremap <silent> <M--> :vertical resize +1<CR>
nnoremap <silent> <M-=> :vertical resize -1<CR>
nnoremap <C-s> :update<CR>
inoremap <C-s> <Esc>:update<CR>
xnoremap <C-s> <C-C>:<C-u>update<CR>
nnoremap <expr> 0 virtcol('.') - 1 <= indent('.') && col('.') > 1 ? '0' : '_'
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
inoremap <C-a> <Home>
inoremap <C-e> <End>
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-r>=icr#ICR()\<CR>"
xnoremap <silent> il <Esc>^vg_
onoremap <silent> il :<C-U>normal! ^vg_<CR>
nnoremap n nzz
nnoremap N Nzz
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>
nnoremap <Space>w viw"+p
nnoremap <Space>p :put+<CR>=`]<C-o>
nnoremap <Space>P :put+<CR>=`]<C-o>
vnoremap <Space>y "+y
vnoremap <Space>p "+p
vnoremap <Space>P "+P
nnoremap <leader>ss :%s/
nnoremap <leader>sa :s/
vnoremap <leader>ss :s/
nnoremap <leader>r :%s/\<<C-r><C-w>\>/<C-r><C-w>
vnoremap <leader>r :s/\<<C-r><C-w>\>/<C-r><C-w>
nnoremap <Space>z :tab split<CR>
nnoremap <Space>q :tabclose<CR>
nnoremap ]b :bnext<CR>
nnoremap [b :bprev<CR>
nnoremap ]l :lnext<cr>
nnoremap [l :lprevious<cr>
nnoremap ]q :cnext<cr>
nnoremap [q :cprevious<cr>
nnoremap ]Q :clast<cr>
nnoremap [Q :cfirst<cr>

"""" Colorscheme
if has('termguicolors')
  set termguicolors
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

set background=dark
silent! colorscheme kolor
