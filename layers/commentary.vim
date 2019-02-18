scriptencoding utf-8

if !exists('g:loaded_commentary')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> plug#plug('vim-commentary')}, {'repeat': 0})
endif
