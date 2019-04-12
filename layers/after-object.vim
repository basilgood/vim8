scriptencoding utf-8

if !exists('g:loaded_after_object')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> functions#plug('vim-after-object')}, {'repeat': 0})
endif

autocmd MyAutoCmd BufEnter * call timer_start(350, {-> after_object#enable('=', ':', ';', '-', '+', '?', '!', '*', '#', ' ', '/', '(', ')', '[', ']', '{', '}')}, {'repeat': 0})
