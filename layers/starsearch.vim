scriptencoding utf-8

if !exists('g:loaded_starsearch')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> functions#plug('starsearch.vim')}, {'repeat': 0})
endif
