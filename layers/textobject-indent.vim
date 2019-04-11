scriptencoding utf-8

if !exists('g:loaded_textobj_indent')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> functions#plug('vim-textobj-indent')}, {'repeat': 0})
endif
