scriptencoding utf-8

if !exists('g:loaded_quickrun')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> plug#plug('vim-quickrun')}, {'repeat': 0})
endif
