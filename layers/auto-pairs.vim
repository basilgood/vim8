scriptencoding utf-8

if !exists('g:AutoPairsLoaded')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> plug#plug('auto-pairs')}, {'repeat': 0})
endif
