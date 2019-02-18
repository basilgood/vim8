scriptencoding utf-8

if !exists('g:loaded_hlyank_plugin')
  autocmd MyAutoCmd BufEnter,BufNew * call timer_start(300, {-> plug#plug('hlyank.vim')}, {'repeat': 0})
endif
