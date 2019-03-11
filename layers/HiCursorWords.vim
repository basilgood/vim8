scriptencoding utf-8

if !exists('g:HiCursorWords_visible')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> plug#plug('HiCursorWords')}, {'repeat': 0})
endif
let g:HiCursorWords_style='term=underline cterm=underline gui=underline'
let g:HiCursorWords_delay = 500
