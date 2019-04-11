scriptencoding utf-8

if !exists('g:loaded_dispatch')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> functions#plug('vim-dispatch')}, {'repeat': 0})
endif
