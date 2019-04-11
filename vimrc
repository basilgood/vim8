"""" vimrc
set encoding=utf-8
scriptencoding utf-8

"""" startup time
if !v:vim_did_enter && has('reltime')
  let g:startuptime = reltime()
  augroup vimrc-startuptime
    autocmd! VimEnter * let g:startuptime = reltime(g:startuptime)
          \                 | redraw
          \                 | echomsg 'startuptime: ' . reltimestr(g:startuptime)
  augroup END
endif

"""" general group
augroup MyAutoCmd
  autocmd!
augroup END

let g:loaded_matchparen = 1
let g:loaded_rrhelper = 1
let g:did_install_default_menus = 1

filetype plugin indent on

"""" environment
function! s:EnsureDirExists(path)
  if !isdirectory(expand(a:path))
    call mkdir(expand(a:path), 'p')
  endif
endfunction

let $CACHE = expand('$HOME/.cache/vimcache')
silent! call s:EnsureDirExists($CACHE)

"""" viminfo
set viminfo=!,'300,<50,s10,h,n$CACHE/viminfo

"""" path
set path& | let &path .= '**'

"""" backup
set nobackup
set nowritebackup

"""" swap and undo
set directory=$CACHE/swap//
silent! call s:EnsureDirExists(&directory)
set history=1000
set undodir=$CACHE/undo//
set undofile
silent! call s:EnsureDirExists(&undodir)

let g:is_bash = 1
let g:sh_noisk = 1

"""" layers
runtime options.vim
runtime remap.vim
runtime! layers/*
runtime autocmds.vim

syntax enable
autocmd MyAutoCmd BufEnter * syntax sync fromstart
runtime theme.vim
