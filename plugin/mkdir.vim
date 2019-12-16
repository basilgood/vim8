scriptencoding utf-8

"""" mkdir if not exists
function! s:createDir()
  call mkdir(expand('<afile>:p:h'), 'p')
endfunction
autocmd vimRc BufWritePre,FileWritePre * silent! call s:createDir()
