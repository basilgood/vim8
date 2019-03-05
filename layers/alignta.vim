scriptencoding utf-8

if !exists('g:loaded_alignta')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> plug#plug('vim-alignta')}, {'repeat': 0})
endif
" xmap ga <Plug>(EasyAlign)
" nmap ga <Plug>(EasyAlign)
