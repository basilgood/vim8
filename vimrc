set encoding=utf-8
scriptencoding utf-8

if !v:vim_did_enter && has('reltime')
  let g:startuptime = reltime()
  augroup vimrc-startuptime
    autocmd! VimEnter * let g:startuptime = reltime(g:startuptime)
          \                 | redraw
          \                 | echomsg 'startuptime: ' . reltimestr(g:startuptime)
  augroup END
endif

if has('termguicolors')
  let &t_8f = "\e[38;2;%lu;%lu;%lum"
  let &t_8b = "\e[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"""" time out on key codes but not mappings.
set notimeout
set ttimeout
set ttimeoutlen=10
set lazyredraw

let g:loaded_matchparen = 1
let g:loaded_rrhelper          = 1
let g:did_install_default_menus = 1
let g:is_bash = 1
let g:sh_noisk = 1

"""" vim cache directory
let $CACHE=expand('$HOME/.cache/vim')
if ! isdirectory(expand($CACHE))
  call mkdir(expand('$CACHE/undo'), 'p')
endif

set undodir=$CACHE/undo//

"""" viminfo
set viminfo=!,'300,<50,s10,h,n$CACHE/viminfo

"""" path
set path=.,**

"""" backup, swap, undo
set noswapfile
set nobackup
set nowritebackup
set undofile

"""" general group autocmds
augroup MyAutoCmd
  autocmd!
augroup END

call options#options()
call tmux#tmux()
call timer_start(300, {-> remap#map()}, {'repeat': 0})
call timer_start(300, {-> plugins#load()}, {'repeat': 0})
call lint#linter()
call autocmds#autocmds()
call timer_start(300, {-> commands#commands()}, {'repeat': 0})
call sessions#sessions()

syntax enable
filetype plugin indent on

set background=dark
colorscheme theonlyone
highlight ParenMatch term=underline cterm=underline gui=underline

set secure
