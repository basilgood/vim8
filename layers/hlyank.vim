scriptencoding utf-8

if !exists('g:loaded_hlyank_plugin')
  autocmd MyAutoCmd BufEnter,BufNew * call plug#plug('hlyank.vim')
  " autocmd MyAutoCmd BufEnter,BufNew :call timer_start(200, plug#plug('hlyank.vim'))
endif
