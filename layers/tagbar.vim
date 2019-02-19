scriptencoding utf-8

if !exists('g:loaded_tagbar')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> plug#plug('tagbar')}, {'repeat': 0})
endif

nnoremap <leader>t :TagbarOpenAutoClose<cr>
