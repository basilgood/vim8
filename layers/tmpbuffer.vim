scriptencoding utf-8

if !exists('g:loaded_tmpbuffer')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> plug#plug('vim-tmpbuffer')}, {'repeat': 0})
endif
