scriptencoding utf-8

autocmd MyAutoCmd BufEnter * call timer_start(300, {-> functions#plug('vim-polyglot')}, {'repeat': 0})
