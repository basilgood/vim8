scriptencoding utf-8

if !exists('g:loaded_textobjectify')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> plug#plug('TextObjectify')}, {'repeat': 0})
endif
