if !v:vim_did_enter && has('reltime')
  let g:startuptime = reltime()
  augroup vimrc-startuptime
    autocmd! VimEnter * let g:startuptime = reltime(g:startuptime)
          \                 | redraw
          \                 | echomsg 'startuptime: ' . reltimestr(g:startuptime)
  augroup END
endif

let skip_defaults_vim=1
set encoding=utf-8
scriptencoding utf-8

"""" true colors
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

let g:loaded_matchparen         = 1
let g:loaded_rrhelper           = 1
let g:did_install_default_menus = 1
let g:is_bash                   = 1
let g:sh_noisk                  = 1
let g:loaded_vimball            = 1
let g:loaded_vimballPlugin      = 1
let g:loaded_getscript          = 1
let g:loaded_getscriptPlugin    = 1
let g:loaded_logipat            = 1
let g:loaded_man                = 1

"""" vim cache directory
let $CACHE=expand('$HOME/.cache/vim')

"""" undo
set undodir=$CACHE/undo//
call functions#mkdir(&undodir)

"""" viewdir
set viewdir=$CACHE/view//

"""" viminfo
set viminfo=!,'300,<50,s10,h,n$CACHE/viminfo

"""" path
set path=.,**

"""" backup, swap, undo
set noswapfile
set nobackup
set nowritebackup
set undofile
set viewoptions=cursor,folds,slash,unix

"""" large file
let g:LargeFile = 20*1024*1024 " 20MB

"""" general group autocmds
augroup MyAutoCmd
  autocmd!
augroup END

call options#options()
call tmux#tmux()
call timer_start(300, {-> remap#map()}, {'repeat': 0})
call timer_start(300, {-> plugins#load()}, {'repeat': 0})
call lint#linter()
call diff#diff()
call autocmds#autocmds()
call timer_start(300, {-> commands#commands()}, {'repeat': 0})

syntax enable
filetype plugin indent on

set background=dark
colorscheme molokai
highlight ParenMatch guifg=#85EB6A guibg=#135B00 gui=NONE   cterm=NONE term=reverse ctermbg=11
highlight Comment    guifg=#5c6370 guibg=NONE    gui=italic cterm=italic

set secure
