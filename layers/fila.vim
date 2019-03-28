scriptencoding utf-8

nnoremap - :Fila<cr>
function! InNetrw()
  nmap <buffer> <right> <cr>
  nmap <buffer> <left> <c-h>
  nmap <buffer> <tab> G<cr>
endfunction

autocmd MyAutoCmd FileType fila call InNetrw()
