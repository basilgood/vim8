scriptencoding utf-8

if !exists('g:templates_plugin_loaded')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> plug#plug('vim-template')}, {'repeat': 0})
endif
