if !v:vim_did_enter && has('reltime')
  let g:startuptime = reltime()
  augroup vimrc-startuptime
    autocmd! VimEnter * ++once
          \                   let g:startuptime = reltime(g:startuptime)
          \                 | redraw
          \                 | echomsg 'startuptime: ' .. reltimestr(g:startuptime)
  augroup END
endif

" encoding
set encoding=utf-8
scriptencoding utf-8

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

" vim 8 defaults
unlet! skip_defaults_vim
silent! source $VIMRUNTIME/defaults.vim

augroup vimRc
  autocmd!
augroup END

source $HOME/.vim/rc/plug.vim
source $HOME/.vim/rc/options.vim
source $HOME/.vim/rc/mappings.vim

syntax enable
set t_Co=256
set t_ut=
set t_md=
set background=dark
silent! colorscheme verysimple

if v:vim_did_enter
  filetype off
endif
filetype plugin indent on

set secure
