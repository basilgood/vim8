scriptencoding utf-8

if !exists('g:loaded_textobj_anyblock')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> plug#plug('vim-textobj-anyblock')}, {'repeat': 0})
endif
