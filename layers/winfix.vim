scriptencoding utf-8

if !exists('g:loaded_winfix')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> plug#plug('vim-winfix')}, {'repeat': 0})
endif