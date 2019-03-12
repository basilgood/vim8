scriptencoding utf-8

if !exists('g:HiCursorWords_visible')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> plug#plug('HiCursorWords')}, {'repeat': 0})
endif
let g:HiCursorWords_style='ctermbg=241 guibg=#3c465b guifg=#ffffff'
let g:HiCursorWords_delay = 500
