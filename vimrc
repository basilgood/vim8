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

syntax enable
filetype plugin indent on

let g:loaded_matchit = 1
autocmd MyAutoCmd BufEnter * syntax sync fromstart

"""" termguicolors
if !has('gui_running')
      \ && exists('+termguicolors')
  if !has('nvim')
    let &t_8f = "\e[38;2;%lu;%lu;%lum"
    let &t_8b = "\e[48;2;%lu;%lu;%lum"
  endif
  set termguicolors
endif

"""" arrow keys
if (&term =~# '^tmux') || (&term =~# '^alacritty-256color')
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

"""" cursorshape
if exists('$TMUX')
  let &t_SI .= "\<Esc>Ptmux;\<Esc>\<Esc>[6 q\<Esc>\\"
  let &t_SR .= "\<Esc>Ptmux;\<Esc>\<Esc>[4 q\<Esc>\\"
  let &t_EI .= "\<Esc>Ptmux;\<Esc>\<Esc>[2 q\<Esc>\\"
else
  let &t_SI .= "\e[6 q"
  let &t_SR .= "\e[4 q"
  let &t_EI .= "\e[2 q"
endif

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

"""" shell
set shell=/usr/bin/env\ bash

"""" path
set path& | let &path .= '**'

" default home directory.
let t:cwd = getcwd()

"""" backup
set nobackup
set nowritebackup

"""" swap and undo
set directory-=.
set noswapfile
set history=1000
set undodir=$CACHE/undo//
set undofile
silent! call s:EnsureDirExists(&undodir)

let g:is_bash = 1
let g:sh_noisk = 1

"""" plugins
"""" grepper
let g:grepper = {}
let g:grepper.highlight = 1

"""" bufferhint
nnoremap <Bs> :call bufferhint#Popup()<cr>
nnoremap \' :call bufferhint#LoadPrevious()<cr>

"""" layers
runtime options.vim
runtime remap.vim
runtime! layers/*
runtime autocmds.vim
runtime theme.vim

set secure
