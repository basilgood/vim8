scriptencoding utf-8

function! s:load_fugitive()
  if exists('b:git_dir')
    call plug#load('vim-fugitive')
    autocmd! load_fugitive
    call fugitive#detect(expand('%:p'))
  endif
endfunction
augroup load_fugitive
  au!
  au BufWinEnter * packadd vim-fugitive
augroup END
