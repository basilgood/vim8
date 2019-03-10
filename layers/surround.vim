scriptencoding utf-8

if !exists('g:loaded_surround')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> plug#plug('vim-surround')}, {'repeat': 0})
endif

let surround_indent=1
