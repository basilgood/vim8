scriptencoding utf-8

if !exists('g:loaded_grepper')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> plug#plug('vim-grepper')}, {'repeat': 0})
endif
