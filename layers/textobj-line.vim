scriptencoding utf-8

if !exists('g:loaded_textobj_line')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> functions#plug('vim-textobj-line')}, {'repeat': 0})
endif
