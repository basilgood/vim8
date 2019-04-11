scriptencoding utf-8

if !exists('g:loaded_textobj_entire')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> functions#plug('vim-textobj-entire')}, {'repeat': 0})
endif
