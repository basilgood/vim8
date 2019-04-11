scriptencoding utf-8

if !exists('g:qf_modifiable')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> functions#plug('quickfix-reflector.vim')}, {'repeat': 0})
endif
