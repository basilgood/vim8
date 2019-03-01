scriptencoding utf-8

if !exists('g:loaded_vimux')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> plug#plug('vimux')}, {'repeat': 0})
endif
" nnoremap <silent> p :VimuxPromptCommand<CR>
nnoremap <silent> <M-p> :VimuxPromptCommand<CR>
nnoremap <silent> <M-q> :VimuxCloseRunner<CR>
nnoremap <silent> <M-x> :VimuxInterruptRunner<CR>
