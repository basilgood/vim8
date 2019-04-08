scriptencoding utf-8

if !exists('g:loaded_tsuquyomi')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> plug#plug('tsuquyomi')}, {'repeat': 0})
endif
