scriptencoding utf-8

if !exists('g:loaded_quickrun')
  autocmd MyAutoCmd CmdlineEnter * call plug#plug('vim-quickrun')
endif
