scriptencoding utf-8

if !exists('g:loaded_easy_align_plugin')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> plug#plug('vim-easy-align')}, {'repeat': 0})
endif
