scriptencoding utf-8

if !exists('g:tabular_loaded')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> plug#plug('tabular')}, {'repeat': 0})
endif

nnoremap <M-a> :Tabularize /
vnoremap <M-a> :Tabularize /
