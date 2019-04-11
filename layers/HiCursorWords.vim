scriptencoding utf-8

if !exists('g:HiCursorWords_visible')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> functions#plug('HiCursorWords')}, {'repeat': 0})
endif

let g:HiCursorWords_style='guibg=#15151c'
let g:HiCursorWords_delay = 500
