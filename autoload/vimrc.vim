scriptencoding utf-8

function! vimrc#on_filetype() abort
  if execute('filetype') =~# 'OFF'
    silent! filetype plugin indent on
    syntax enable
    filetype detect
  endif
endfunction
