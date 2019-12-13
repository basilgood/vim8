scriptencoding utf-8

nmap <silent> - :call <SID>opendir()<CR>
function! s:opendir() abort
  if expand('%') =~# '^$\|^term:[\/][\/]'
    Explore
  else
    edit %:h
  endif
endfunction
