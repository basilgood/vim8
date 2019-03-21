scriptencoding utf-8

if !exists('g:skybison_loaded')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> plug#plug('SkyBison')}, {'repeat': 0})
endif

nnoremap <M-x> :<c-u>call SkyBison("")<cr>
nnoremap <leader>b 2:<c-u>call SkyBison("b ")<cr>
nnoremap <leader>t 2:<c-u>call SkyBison("tag ")<cr>
nnoremap <leader>h 2:<c-u>call SkyBison("help ")<cr>
