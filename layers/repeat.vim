scriptencoding utf-8

if !exists('g:loaded_repeat')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> plug#plug('vim-repeat')}, {'repeat': 0})
endif