scriptencoding utf-8

if !exists('g:loaded_ragtag')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> plug#plug('vim-ragtag')}, {'repeat': 0})
endif
let g:ragtag_global_maps = 1
