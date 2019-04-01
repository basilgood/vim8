scriptencoding utf-8

if !exists('g:loaded_niceblock')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> plug#plug('vim-niceblock')}, {'repeat': 0})
endif
