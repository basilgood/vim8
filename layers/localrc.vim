scriptencoding utf-8

if !exists('g:loaded_localrc')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> functions#plug('vim-localrc')}, {'repeat': 0})
endif
