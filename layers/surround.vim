scriptencoding utf-8

if !exists('g:loaded_surround')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> functions#plug('vim-surround')}, {'repeat': 0})
endif

let surround_indent=1
nmap ss ysiw
nmap sl yss
vmap s S
