scriptencoding utf-8

if !exists('g:lion_create_maps')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> plug#plug('vim-lion')}, {'repeat': 0})
endif

let b:lion_squeeze_spaces = 1
