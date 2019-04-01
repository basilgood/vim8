scriptencoding utf-8

if !exists('g:loaded_cmdline_ranges')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> plug#plug('vim-cmdline-ranges')}, {'repeat': 0})
endif
