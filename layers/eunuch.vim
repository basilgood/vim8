scriptencoding utf-8

if !exists('g:loaded_eunuch')
   autocmd MyAutoCmd BufEnter * call timer_start(300, {-> functions#plug('vim-eunuch')}, {'repeat': 0})
endif
