scriptencoding utf-8

function s:MkdirIfNotExist()
let dir = expand('%:p:h')

if dir =~# '://'
  return
endif

if !isdirectory(dir)
  call mkdir(dir, 'p')
  echo 'Created non-existing directory: '.dir
endif
endfunction

autocmd MyAutoCmd BufWritePre * call s:MkdirIfNotExist()
