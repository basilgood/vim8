if &compatible
  " vint: -ProhibitSetNoCompatible
  set nocompatible
endif

scriptencoding utf-8

augroup vimRc
  autocmd!
augroup END

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd vimRc VimEnter * PlugInstall | source $MYVIMRC
endif

silent! if plug#begin('~/.vim/plugged')

Plug 'tpope/vim-vinegar'
let g:netrw_bufsettings = 'nomodifiable nomodified relativenumber nowrap readonly nobuflisted'
let g:netrw_altfile = 1
let g:netrw_altv = 1
let g:netrw_preview = 1
let g:netrw_alto = 0
let g:netrw_use_errorwindow = 0
function! Innetrw() abort
  nmap <buffer> <right> <cr>
  nmap <buffer> l <cr>
  nmap <buffer> <left> -
  nmap <buffer> h -
endfunction
autocmd vimRc FileType netrw call Innetrw()
Plug 'airblade/vim-gitgutter'
let g:gitgutter_sign_priority = 8
let g:gitgutter_override_sign_column_highlight = 0
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)
Plug 'neomake/neomake'
autocmd vimRc BufWritePost,BufEnter * call neomake#configure#automake('nrwi', 500)
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-repeat'
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let $FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude plugged'
let g:fzf_layout = { 'down': '~25%' }
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit',
      \ 'ctrl-w': 'bdelete'}
nnoremap <c-p> :Files<cr>
nnoremap <c-h> :Files %:h<cr>
nnoremap <bs> :Buffers<cr>
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'mbbill/undotree'
let g:undotree_CustomUndotreeCmd = 'vertical 50 new'
let g:undotree_CustomDiffpanelCmd= 'belowright 12 new'
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
Plug 'sgur/vim-editorconfig'
Plug 'itchyny/vim-qfedit'
Plug 'hotwatermorning/auto-git-diff'
Plug 'whiteinge/diffconflicts'
Plug 'markonm/hlyank.vim'
Plug 'markonm/traces.vim'
Plug 'PeterRincker/vim-searchlight'
Plug 'pangloss/vim-javascript'
Plug 'jonsmithers/vim-html-template-literals'
let g:htl_all_templates = 1
let g:htl_css_templates = 1
Plug 'kchmck/vim-coffee-script'
Plug 'lepture/vim-jinja'
Plug 'lumiliet/vim-twig'
Plug 'digitaltoad/vim-pug'
Plug 'LnL7/vim-nix'

call plug#end()
endif

set nobackup
set noswapfile

set undodir=/tmp,.
set undofile

set term=xterm-256color
set t_Co=256
set t_ut=
set t_md=

let &t_SI.="\e[5 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[1 q"

let &t_ti .= "\<Esc>[?2004h"
let &t_te = "\e[?2004l" . &t_te

function! XTermPasteBegin(ret)
  set pastetoggle=<f29>
  set paste
  return a:ret
endfunction

execute "set <f28>=\<Esc>[200~"
execute "set <f29>=\<Esc>[201~"
map <expr> <f28> XTermPasteBegin("i")
imap <expr> <f28> XTermPasteBegin("")
vmap <expr> <f28> XTermPasteBegin("c")
cmap <f28> <nop>
cmap <f29> <nop>

set viminfo=!,'300,<50,s10,h,n~/.cache/viminfo
set path& | let &path .= '**'
set nostartofline
set nowrap
set virtualedit=block
set sidescrolloff=10
set sidescroll=1
let &showbreak = '↳ '
set breakat=\ \ ;:,!?
set breakindent
set breakindentopt=sbr
set display=lastline
set incsearch
set hlsearch|nohlsearch
set gdefault
set switchbuf+=useopen,usetab
set splitright
set splitbelow
set completefunc=syntaxcomplete#Complete
set completeopt-=preview
set completeopt+=menuone,noselect,noinsert
set complete=.,w,b,u,U,t,i,d,k
set pumheight=10
set diffopt+=vertical,context:3,indent-heuristic,algorithm:patience
set number
set nrformats-=octal
set mouse=a
set ttymouse=sgr
set backspace=indent,eol,start
set history=200
set wildmenu
set list
set listchars=tab:›\ ,trail:•,extends:»,precedes:«,nbsp:‡
autocmd vimRc InsertEnter * set listchars-=trail:•
autocmd vimRc InsertLeave * set listchars+=trail:•
set confirm
set shortmess=IO
set autoindent
set copyindent
set preserveindent
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab
set autoread
set autowrite
set helplang=en
set spelllang=en_us
set history=1000
set wildmode=longest:list,full
set wildoptions=tagfile
set wildignorecase
set wildignore=
      \*/node_modules/*,
      \*/bower_components/*,
      \*/vendor/*,
      \*/plugged/*,
      \*/.gem/*,
      \*/.git/*,
      \*/.hg/*,
      \*/.svn/*
set wildcharm=<C-Z>
set ttimeout
set ttimeoutlen=100
set lazyredraw
set updatetime=50
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
endif
set grepformat^=%f:%l:%c:%m
set laststatus=2
set statusline=%<%f\ %h%#error#%m%*%r%=%-14.(%l\:%c%)%{&filetype}

nnoremap <silent> j gj
nnoremap <silent> k gk
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
inoremap <C-a> <Home>
inoremap <C-e> <End>
nnoremap } }zz
nnoremap { {zz
nnoremap vv viw
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr><CR> pumvisible() ? "\<C-Y>" : "\<CR>"
nnoremap ]q :cnext<cr>
nnoremap [q :cprevious<cr>
nnoremap ]Q :clast<cr>
nnoremap [Q :cfirst<cr>
nnoremap ]l :lnext<cr>
nnoremap [l :lprevious<cr>
nnoremap ]L :llast<cr>
nnoremap [L :lfirst<cr>
xnoremap <expr> I (mode()=~#'[vV]'?'<C-v>^o^I':'I')
xnoremap <expr> A (mode()=~#'[vV]'?'<C-v>0o$A':'A')
onoremap <silent> <expr> al v:count==0 ? ":<c-u>normal! 0V$h<cr>" : ":<c-u>normal! V" . (v:count) . "jk<cr>"
vnoremap <silent> <expr> al v:count==0 ? ":<c-u>normal! 0V$h<cr>" : ":<c-u>normal! V" . (v:count) . "jk<cr>"
onoremap <silent> <expr> il v:count==0 ? ":<c-u>normal! ^vg_<cr>" : ":<c-u>normal! ^v" . (v:count) . "jkg_<cr>"
vnoremap <silent> <expr> il v:count==0 ? ":<c-u>normal! ^vg_<cr>" : ":<c-u>normal! ^v" . (v:count) . "jkg_h<cr>"
xnoremap <silent> ie gg0oG$
onoremap <silent> ie :<C-U>execute "normal! m`"<Bar>keepjumps normal! ggVG<cr>
nnoremap Q <Nop>
vnoremap <expr>y "my\"" . v:register . "y`y"
nmap  <Space>   [Space]
nnoremap  [Space]   <Nop>
xnoremap <silent> [Space]y y:call system("wl-copy", @")<cr>
nnoremap [Space]p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<cr>p
nnoremap [Space]w diw:let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<cr>P
xnoremap [Space]p d:let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<cr>P
vnoremap P "0p
nnoremap ss :%s/
nnoremap sl :s/
xnoremap s  :s/
nnoremap sa :<c-u>%s/\C\<<c-r><c-w>\>/<c-r><c-w>
nnoremap sw :<C-u>%s/\C\<<C-R><C-w>\>//g<Left><Left>
nnoremap <silent> <expr> [Space]dt ":\<C-u>"."windo ".(&diff?"diffoff":"diffthis")."\<CR>"
nnoremap <silent> <C-g> :file<Bar>echon ' ' system("git rev-parse --abbrev-ref HEAD 2>/dev/null \| tr -d '\n'")<CR>
nnoremap <silent><expr> <C-l> empty(get(b:, 'current_syntax'))
      \ ? "\<C-l>"
      \ : "\<C-l>:syntax sync fromstart\<cr>:nohlsearch<cr>"
nnoremap <silent>n n
nnoremap <silent>N N
" vim-visual-star-search
nnoremap <silent> * *``
nnoremap sn *``cgn
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>``
function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction
" execute macro
nnoremap Q @q
" Run macro on selected lines
vnoremap Q :norm Q<cr>
" find
nnoremap [Space]f :find *<c-z>

nnoremap <silent> ]m /^\(<\{7\}\\|>\{7\}\\|=\{7\}\\|\|\{7\}\)\( \\|$\)<cr>

" omnicomplete
autocmd vimRc Filetype *
      \ if &omnifunc == "" |
      \   setlocal omnifunc=syntaxcomplete#Complete |
      \ endif

" format
autocmd vimRc BufRead,BufNewFile *.nix command! F silent call system('nixpkgs-fmt ' . expand('%'))
autocmd vimRc BufRead,BufNewFile *.js,*.jsx,*.ts,*.tsx command! F silent call system('prettier --single-quote --write ' . expand('%'))
autocmd vimRc FileType yaml command! F silent call system('prettier --write ' . expand('%'))
autocmd vimRc FileType sh command! F silent call system('shfmt -i 2 -ci -w ' . expand('%'))

" If a file is large, disable syntax highlighting, filetype etc
let g:LargeFile = 20*1024*1024 " 20MB
autocmd vimRc BufReadPre *
      \ let s = getfsize(expand("<afile>")) |
      \ if s > g:LargeFile || s == -2 |
      \   call functions#large_file(fnamemodify(expand("<afile>"), ":p")) |
      \ endif

" qf and help keep widow full width
autocmd vimRc FileType qf wincmd J
autocmd vimRc BufWinEnter * if &ft == 'help' | wincmd J | end

" update diff
autocmd vimRc InsertLeave * if &l:diff | diffupdate | endif

" detect filetype on save
autocmd vimRc BufWritePost * if &filetype ==# '' | filetype detect | endif

" external changes
autocmd vimRc FocusGained,CursorHold * if !bufexists("[Command Line]") | checktime | GitGutter | endif

" mkdir
autocmd vimRc BufWritePre *
      \ if !isdirectory(expand('%:h', v:true)) |
      \   call mkdir(expand('%:h', v:true), 'p') |
      \ endif

autocmd vimRc BufNewFile,BufRead *.nix        setfiletype nix
autocmd vimRc BufNewFile,BufRead *.jsx        setfiletype javascript
autocmd vimRc BufNewFile,BufRead *.js         setfiletype javascript
autocmd vimRc BufNewFile,BufRead *.tsx        setfiletype typescript
autocmd vimRc BufNewFile,BufRead *.ts         setfiletype typescript
autocmd vimRc BufNewFile,BufRead *.gitignore  setfiletype gitignore
autocmd vimRc BufNewFile,BufRead *.twig       setfiletype twig.html
autocmd vimRc BufNewFile,BufRead config       setfiletype config
autocmd vimRc BufNewFile,BufRead *.less       setfiletype less
autocmd vimRc BufNewFile,BufRead *.sass       setfiletype sass
autocmd vimRc BufNewFile,BufRead *.scss       setfiletype scss
autocmd vimRc BufNewFile,BufRead *.toml       setfiletype toml
autocmd vimRc BufNewFile,BufRead *.coffee     setfiletype coffeescript
autocmd vimRc BufNewFile,BufRead .babelrc     setfiletype json
autocmd vimRc BufNewFile,BufRead *.json       setfiletype json
autocmd vimRc BufNewFile,BufRead Dockerfile.* setfiletype Dockerfile
autocmd vimRc BufNewFile,BufRead *.txt        setfiletype markdown
autocmd vimRc BufNewFile,BufRead *.md         setfiletype markdown
autocmd vimRc BufNewFile,BufRead *.mkd        setfiletype markdown
autocmd vimRc BufNewFile,BufRead *.markdown   setfiletype markdown
autocmd vimRc BufNewFile,BufRead *.lock   setfiletype config
autocmd vimRc BufWinEnter *.json setlocal conceallevel=0 concealcursor=
autocmd vimRc BufReadPre *.json  setlocal conceallevel=0 concealcursor=
autocmd vimRc BufReadPre *.json  setlocal formatoptions=
autocmd vimRc FileType git       setlocal nofoldenable

command! GB echom system('git rev-parse --abbrev-ref HEAD')
command! DF call delete(expand('%')) | bdelete!
command! -nargs=0 WS %s/\s\+$// | normal! ``
function! Hlgroup() abort
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), '/')
endfunction
command! HL call Hlgroup()
command! -nargs=1 TX
      \ call system('tmux split-window -h '.<q-args>)
command! TA TX tig --all
command! TS TX tig status
command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
      \ | wincmd p | diffthis

command! -nargs=? PreviousVersion diffthis |
      \ vnew |
      \ set buftype=nofile |
      \ set bufhidden=wipe |
      \ set noswapfile |
      \ execute "r!git show ".(!"<args>"?'HEAD^':"<args>").":".expand('#') |
      \ 1d_ |
      \ let &filetype=getbufvar('#', '&filetype') |
      \ execute 'autocmd BufWipeout <buffer> diffoff!' |
      \ diffthis |
      \ wincmd p

function! s:safeundo()
  let s:pos = getpos( '. ')
  let s:view = winsaveview()
  undo
  call setpos( '.', s:pos )
  call winrestview( s:view )
endfunc

function! s:saferedo()
  let s:pos = getpos( '.' )
  let s:view = winsaveview()
  redo
  call setpos( '.', s:pos )
  call winrestview( s:view )
endfunc

nnoremap u :call <sid>safeundo() <CR>
nnoremap <C-r> :call <sid>saferedo() <CR>

" lifepillar
fun! s:git(args, where) abort
  call Runcmd(['git'] + a:args, {'pos': a:where})
  setlocal nomodifiable
endf

fun! Runcmd(cmd, ...) abort
  let l:opt = get(a:000, 0, {})
  if !has_key(l:opt, 'cwd')
    let l:opt['cwd'] = fnameescape(expand('%:p:h'))
  endif
  let l:cmd = join(map(a:cmd, 'v:val !~# "\\v^[%#<]" || expand(v:val) ==# "" ? v:val : shellescape(expand(v:val))'))
  execute get(l:opt, 'pos', 'botright') 'new'
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  nnoremap <buffer> q <c-w>c
  execute 'lcd' l:opt['cwd']
  execute '%!' l:cmd
endf

fun! GitDiff() abort
  let l:ft = getbufvar('%', '&ft') " Get the file type
  let l:fn = expand('%:t')
  call s:git(['show', 'HEAD:./'.l:fn], 'rightbelow vertical')
  let &l:filetype = l:ft
  execute 'silent file' l:fn '[HEAD]'
  diffthis
  autocmd vimRc BufWinLeave <buffer> diffoff!
  wincmd p
  diffthis
endf

fun! Three_Way_Diff() abort
  let l:ft = getbufvar('%', '&ft')
  let l:fn = expand('%:t')
  call s:git(['show', ':2:./'.l:fn], 'leftabove vertical')
  let &l:filetype = l:ft
  execute 'silent file' l:fn '[OURS]'
  diffthis
  autocmd vimRc BufWinLeave <buffer> diffoff!
  wincmd p
  call s:git(['show', ':3:./'.l:fn], 'rightbelow vertical')
  let &l:filetype = l:ft
  execute 'silent file' l:fn '[THEIRS]'
  diffthis
  autocmd vimRc BufWinLeave <buffer> diffoff!
  wincmd p
  diffthis
endf

syntax enable

silent! colorscheme min

set secure
