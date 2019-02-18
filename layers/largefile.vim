scriptencoding utf-8

if !exists('g:loaded_LargeFile')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> plug#plug('LargeFile')}, {'repeat': 0})
endif
