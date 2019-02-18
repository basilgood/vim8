scriptencoding utf-8

if !exists('g:scriptease')
  autocmd MyAutoCmd CmdlineEnter * call plug#plug('vim-scriptease')
endif
