scriptencoding utf-8

function! s:CreateDir()
  call mkdir(expand('<afile>:p:h'), 'p')
endfunction
autocmd vimRc BufWritePre,FileWritePre * silent! call s:CreateDir()
