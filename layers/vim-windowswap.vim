scriptencoding utf-8

if !exists('g:windowswap_map_keys')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> plug#plug('vim-windowswap')}, {'repeat': 0})
endif
