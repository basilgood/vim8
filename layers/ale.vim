scriptencoding utf-8

if !exists('g:loaded_ale')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> plug#plug('ale')}, {'repeat': 0})
endif
