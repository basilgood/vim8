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

"""" general group autocmds
augroup VGroup
  autocmd!
augroup END

"""" large file
let g:LargeFile = 20*1024*1024 " 20MB

call options#options()
call tmux#tmux()
call timer_start(300, {-> remap#map()}, {'repeat': 0})
call timer_start(300, {-> plugins#load()}, {'repeat': 0})
" call lint#linter()
call diff#diff()
call autocmds#autocmds()
call timer_start(300, {-> commands#commands()}, {'repeat': 0})

syntax enable
filetype plugin indent on

set background=dark
colorscheme reki
highlight ParenMatch guifg=#85EB6A guibg=#135B00 gui=NONE   cterm=NONE term=reverse ctermbg=11
highlight Comment    guifg=#5c6370 guibg=NONE    gui=italic cterm=italic

set secure
