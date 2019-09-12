scriptencoding utf-8

let $CACHE=expand('$HOME/.cache/')

"""" undo
set undodir=$CACHE/vim/undo//
call functions#mkdir(&undodir)

"""" viewdir
set viewdir=$CACHE/vim/view//

"""" vivid
if empty(glob('~/.vim/pack/vivid/opt/Vivid.vim'))
  silent !git clone https://github.com/axvr/vivid.vim ~/.vim/pack/vivid/opt/Vivid.vim
endif

packadd Vivid.vim

"""" disable some vim pligins
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

let g:LargeFile = 20*1024*1024 " 20MB
