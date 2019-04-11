scriptencoding utf-8

if !exists('g:exchange_no_mappings')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> functions#plug('vim-exchange')}, {'repeat': 0})
endif
