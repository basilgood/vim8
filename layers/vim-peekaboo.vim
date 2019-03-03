scriptencoding utf-8

if get(b:, 'peekaboo_on', 1)
  autocmd MyAutoCmd BufEnter * call timer_start(500, {-> plug#plug('vim-peekaboo')}, {'repeat': 0})
endif
