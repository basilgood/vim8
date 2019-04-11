scriptencoding utf-8

if !exists('g:loaded_targets')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> functions#plug('targets.vim')}, {'repeat': 0})
endif
