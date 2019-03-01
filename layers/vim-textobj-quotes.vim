scriptencoding utf-8

if !exists('g:loaded_textobj_quotes')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> plug#plug('vim-textobj-quotes')}, {'repeat': 0})
endif

xmap q iq
omap q iq
