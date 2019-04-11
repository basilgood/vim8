scriptencoding utf-8

if !exists('g:jsx_improve_motion_disable')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> functions#plug('vim-jsx-improve')}, {'repeat': 0})
endif
let g:jsx_ext_required = 0
