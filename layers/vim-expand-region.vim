scriptencoding utf-8

if !exists('g:expand_region_init')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> plug#plug('vim-expand-region')}, {'repeat': 0})
endif
