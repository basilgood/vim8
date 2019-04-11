scriptencoding utf-8

if !exists('g:loaded_precious')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> functions#plug('vim-precious')}, {'repeat': 0})
endif
