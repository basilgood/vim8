scriptencoding utf-8

if !exists('g:loaded_textobj_jabraces')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> plug#plug('vim-textobj-jabraces')}, {'repeat': 0})
endif
